module master

(
    input reg [0:1] mode ,
    input reset,   //reset from outside
    input clock,    //clock from outside
    input[0:1] C_S,
    input[0:7] tx_data, //data to be transmitted
    
    output[0:7]rx_data, //data that was recieved 

    input  miso,  // bit that slave send at this clock cycle
    output reg mosi, // bit that master send at this clock cycle
    output slave_clk, // clock the master send to slave operate with
    output reg tx_ready_flag, //just two falgs to indicate that process finished
    output reg rx_ready_flag,

    output wire CS1,
    output wire CS2,
    output wire CS3

    );

wire w_cpha, w_cpol;
reg spi_clock;
reg[0:3]tx_cnt;
reg[0:3]rx_cnt;
reg[0:7] master_reg;
reg leading_edge;
reg trailing_edge;

assign w_cpha = (mode == 1) | (mode == 2);
assign w_cpol = (mode == 2) | (mode == 3);
assign slave_clk = spi_clock;
assign rx_data = master_reg;
assign CS1=(C_S==2'b01)?0:1;
assign CS2=(C_S==2'b10)?0:1;
assign CS3=(C_S==2'b11)?0:1;

// spi clk setup
always@(posedge clock, negedge clock, posedge reset)
begin
if (reset)
begin
spi_clock <= w_cpol;
leading_edge <= 1'b0;
trailing_edge <= 1'b1;
tx_ready_flag <= 1'b0;
rx_ready_flag <= 1'b0;
master_reg <= tx_data;
end
else
begin
spi_clock = ~spi_clock;
trailing_edge = ~trailing_edge;
leading_edge = ~leading_edge;
end
end

//mosi setup
always@(posedge clock, negedge clock, posedge reset)
begin
if (reset)
begin
tx_cnt = 3'b000;
end
else
begin
if (!tx_ready_flag && ((!w_cpha && trailing_edge) || (w_cpha && leading_edge)))
begin
tx_cnt <= tx_cnt + 1;
mosi <= master_reg[0];
end
if (tx_cnt == 4'b1000)
    begin
    tx_ready_flag <= 1'b1;
    end
    end
    end

    //miso setup
always@(posedge clock, negedge clock, posedge reset)
    begin
    if (reset)
        begin
        rx_cnt = 3'b000;
        end
    else
        begin
        if (tx_cnt&&!rx_ready_flag && ((leading_edge && !w_cpha) || (trailing_edge && w_cpha)))
            begin
            rx_cnt <= rx_cnt + 1;
	    master_reg <= {master_reg[1:7], miso};
	    end
        if (rx_cnt == 4'b1000)
            begin
            rx_ready_flag <= 1'b1;
            end
    end
end

    endmodule

