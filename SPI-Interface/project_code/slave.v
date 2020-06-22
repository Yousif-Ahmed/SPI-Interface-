
module slave

(
    input reg [0:1] mode ,
    input reset,   //reset from outside
    input sclk,    //clock from outside

    input[0:7] tx_data, //data to be transmitted
    
    input  SC , //slave select
    output[0:7]rx_data, //data that was recieved 

    input  SDI,  // bit that slave receive at this clock cycle
    output reg SDO, // bit that slave send at this clock cyclcle
    output reg tx_ready_flag, //just two falge to indicate that process finished
    output reg rx_ready_flag
    );

wire w_cpha, w_cpol;
reg[0:3]tx_cnt;
reg[0:3]rx_cnt;
reg[0:7] slave_reg;
reg leading_edge;
reg trailing_edge;

assign w_cpha = (mode == 1) | (mode == 2);
assign w_cpol = (mode == 2) | (mode == 3);

assign rx_data = slave_reg;



always@(posedge sclk, negedge sclk, posedge reset)
begin
if (reset)
begin
tx_ready_flag <= 1'b0;
rx_ready_flag <= 1'b0;
//
leading_edge <= 1'b0;
trailing_edge <= 1'b1;
//
slave_reg <= tx_data;
end
else
begin
trailing_edge = ~trailing_edge;
leading_edge = ~leading_edge;
end
end

//SDO setup
always@(posedge sclk, negedge sclk, posedge reset)
begin
if (reset)
begin
tx_cnt = 3'b000;
//tx_ready_flag =1'b0 ;
end

else if (!SC)
begin
if(!tx_ready_flag && ((!w_cpha && trailing_edge) || (w_cpha && leading_edge)))
begin
tx_cnt <= tx_cnt + 1;
SDO <= slave_reg[0];
end
if (tx_cnt == 4'b1000)
    begin
    tx_ready_flag <= 1'b1;
    end
    end
    end

    //SDI setup
     always@(posedge sclk, negedge sclk, posedge reset)
    begin
    if (reset)
        begin
        rx_cnt = 3'b000;
	//rx_ready_flag =1'b0 ;  
        end
    else if (!SC)
        begin
        if (tx_cnt&&!rx_ready_flag && ((leading_edge && !w_cpha) || (trailing_edge && w_cpha)))
          begin
            rx_cnt <= rx_cnt + 1;
            slave_reg <= {slave_reg[1:7], SDI};
         end
      if (rx_cnt == 4'b1000)
        begin
        rx_ready_flag <= 1'b1;

        end
        end
        end

    endmodule
