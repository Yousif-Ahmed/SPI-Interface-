module SPI_Integ
(
input reg [0:1] mode ,
input reset, //for both master & slave (not sure)
input clk, //for master only

input [0:1] C_S, //slave select
input [0:7]M_tx_data, //data to be transmitted by master
input [0:7]S_tx_data,//data to be transmitted by slave

output  [0:7]M_rx_data, //data received by master
output  [0:7]S_rx_data //data received by Slave
);
wire miso1;
wire miso2;
wire miso3 ;

wire [0:7]S_rx_data1;
wire [0:7]S_rx_data2;
wire [0:7]S_rx_data3;
wire slave_clk;
wire m_o_tx_ready;
wire m_o_rx_ready;
wire s_o_tx_ready;
wire s_o_rx_ready;
wire CS1,CS2,CS3;
wire miso,mosi;


assign miso=(C_S==2'b01)? miso1:(C_S==2'b10)?miso2:miso3;
assign S_rx_data=(C_S==2'b01)? S_rx_data1:(C_S==2'b10)?S_rx_data2:S_rx_data3;

master m1(mode,reset,clk,C_S,M_tx_data,M_rx_data,miso,mosi,slave_clk,m_o_tx_ready, m_o_rx_ready,CS1,CS2,CS3);
slave s1(mode ,reset,slave_clk,S_tx_data,CS1,S_rx_data1,mosi,miso1,s_o_tx_ready, s_o_rx_ready);
slave s2(mode ,reset,slave_clk,S_tx_data,CS2,S_rx_data2,mosi,miso2,s_o_tx_ready, s_o_rx_ready);
slave s3(mode,reset,slave_clk,S_tx_data,CS3,S_rx_data3,mosi,miso3,s_o_tx_ready, s_o_rx_ready);



endmodule

