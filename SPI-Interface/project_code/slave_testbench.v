
`timescale 1 ns / 10 ps

module Slave_tb();
reg rst;
reg clk;
reg [0:7] i_tx_data;
//reg S_S;  //slave select
wire [0:7]o_rx_data;//data received
reg i_mosi;
wire o_miso;
reg [0:1] mode ;
wire o_tx_ready;
wire o_rx_ready;



slave s0(mode ,rst,clk,i_tx_data,1'b0,o_rx_data,i_mosi,o_miso,o_tx_ready,o_rx_ready);

localparam period =10;
always
   #(period/2)clk=~clk;

initial 
begin
  $display ("###############mode #0##############");
  $display("                           ") ;
  $display ("time\t clk  MOSI MISO  datain     dataout");
  

  $monitor("%g \t  %b   %b   %b     %b   %b",$time,clk ,i_mosi,o_miso,i_tx_data,o_rx_data);
  mode =0 ;
  clk=0;
  rst=1'b1;
  i_tx_data=8'b01010101;
  
  #(period)rst=1'b0;

  #(period/2)i_mosi=0;
  #(period)i_mosi=0;
  #(period)i_mosi=0;
  #(period)i_mosi =0;
  #(period)i_mosi=0;
  #(period)i_mosi=0;  
  #(period)i_mosi=0;
  #(period)i_mosi=0;
  #period ;
  $display ("Expected dataout = 00000000 ");
  $display ("Exact dataout    = %b ",o_rx_data );
 $display("                           ") ;
  $display ("###############mode #1##############");
  $display("                           ") ;
  $display ("time\t clk  MOSI MISO  datain     dataout");
  

  $monitor("%g \t  %b   %b   %b     %b   %b",$time,clk ,i_mosi,o_miso,i_tx_data,o_rx_data);
  mode =1 ;
  clk=0;
  rst=1'b1;
  i_tx_data=8'b11111111;
  
  #(period)rst=1'b0;

  #(period/2)i_mosi=0;
  #(period)i_mosi=1;
  #(period)i_mosi=1;
  #(period)i_mosi =0;
  #(period)i_mosi=1;
  #(period)i_mosi=1;  
  #(period)i_mosi=0;
  #(period)i_mosi=0;
  #period ;
  $display ("Expected dataout = 01101100 ");
  $display ("Exact dataout    = %b ",o_rx_data );
 $display("                           ") ;
  $display ("###############mode #2##############");
  $display("                           ") ;
  $display ("time\t clk  MOSI MISO  datain     dataout");
  

  $monitor("%g \t  %b   %b   %b     %b   %b",$time,clk ,i_mosi,o_miso,i_tx_data,o_rx_data);
  
  mode =2 ;
  clk=1;
  rst=1'b1;
  i_tx_data=8'b11111111;
  
  #(period)rst=1'b0;

  #(period/2)i_mosi=1;
  #(period)i_mosi=0;
  #(period)i_mosi=1;
  #(period)i_mosi=1;
  #(period)i_mosi=0;
  #(period)i_mosi=0;  
  #(period)i_mosi=1;
  #(period)i_mosi=0;
  #period ;
  $display ("Expected dataout = 10110010 ");
  $display ("Exact dataout    = %b ",o_rx_data );
  $display("                           ") ;
  $display ("###############mode #3##############");
  $display("                           ") ;
  $display ("time\t clk  MOSI MISO  datain     dataout");
  

  $monitor("%g \t  %b   %b   %b     %b   %b",$time,clk ,i_mosi,o_miso,i_tx_data,o_rx_data);
  mode =3 ;
  clk=1;
  rst=1'b1;
  i_tx_data=8'b11111111;
  
  #(period)rst=1'b0;

  #(period/2)i_mosi=0;
  #(period)i_mosi=1;
  #(period)i_mosi=1;
  #(period)i_mosi=0;
  #(period)i_mosi=0;
  #(period)i_mosi=1;  
  #(period)i_mosi=1;
  #(period)i_mosi=0;
  #period ;
  $display ("Expected dataout = 01100110 ");
  $display ("Exact dataout    = %b ",o_rx_data );
$finish ;

  

end
endmodule