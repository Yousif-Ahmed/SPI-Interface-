`timescale 1 ns / 10 ps

module master_tb();
reg rst;
reg clk;
reg [0:7] i_tx_data;
wire [0:7]o_rx_data;
reg i_miso;
wire o_mosi;
wire o_spi_clk;
wire o_tx_ready;
wire o_rx_ready;
reg [0:1] mode ;
reg [0:1] C_S ;

master m1(mode,rst,clk,C_S,i_tx_data,o_rx_data,i_miso,o_mosi,o_spi_clk,o_tx_ready, o_rx_ready,CS1,CS2,CS3);
localparam period =10;
always
   #(period/2)clk=~clk;

initial 
begin
  $display ("###############TestCase(1)---->mode #0##############");
  $display("clk\tMISO MOSI      initial_data     out_shift");
  $monitor("%b   \t%b   %b         %b        %b",clk,i_miso,o_mosi,i_tx_data,o_rx_data);
  mode =0 ;
  clk=0;
  rst=1'b1;
  i_tx_data=8'b10100101;
  
  #(period)rst=1'b0;

  #(period/2)i_miso=1;
  #(period)i_miso=0;
  #(period)i_miso=1;
  #(period)i_miso =1;
  #(period)i_miso=1;
  #(period)i_miso=0;  
  #(period)i_miso=1;
  #(period)i_miso=0;
  #period ;
  $display("                           ") ;
  $display ("initial data in master=%b",i_tx_data) ; 
  $display ("Expected dataout = 10111010");
   if ( o_rx_data ==8'b10111010 )
    begin
  $display ("Exact dataout    = %b",o_rx_data) ;
  $display ("Test case #1 is passed successfuly ");
  end
  else
  $display ("Test case #1 Failed ");
  $display("                           ") ;
   $display ("###############TestCase(2)---->mode #1##############");
  $display("                           ") ;
  $display("clk\tMISO MOSI      initial_data     out_shift");
  $monitor("%b   \t%b   %b         %b        %b",clk,i_miso,o_mosi,i_tx_data,o_rx_data);
  mode =1 ;
  clk=0;
  rst=1'b1;
  i_tx_data=8'b10100101;
  
  #(period)rst=1'b0;

  #(period/2)i_miso=1;
  #(period)i_miso=0;
  #(period)i_miso=1;
  #(period)i_miso =1;
  #(period)i_miso=1;
  #(period)i_miso=0;  
  #(period)i_miso=1;
  #(period)i_miso=0;
  #period ;
  $display("                           ") ;
  $display ("initial data in master=%b",i_tx_data) ; 
  $display ("Expected dataout = 10111010");
  if ( o_rx_data ==8'b10111010 )
  begin
  $display ("Exact dataout    = %b",o_rx_data) ;
  $display ("Test case #2 is passed successfuly ");
  end
  else
  $display ("Test case #2 Failed ");
  $display("                           ") ;
    $display ("###############TestCase(3)---->mode #2##############");
  $display("                           ") ;
  $display("clk\tMISO MOSI      initial_data     out_shift");
  $monitor("%b   \t%b   %b         %b        %b",clk,i_miso,o_mosi,i_tx_data,o_rx_data);
  mode =2 ;
  clk=1;
  rst=1'b1;
  i_tx_data=8'b10100101;
  
  #(period)rst=1'b0;

  #(period/2)i_miso=1;
  #(period)i_miso=0;
  #(period)i_miso=1;
  #(period)i_miso=1;
  #(period)i_miso=1;
  #(period)i_miso=0;  
  #(period)i_miso=1;
  #(period)i_miso=0;
    
  #period ;
   $display("                           ") ;
  $display ("initial data in master=%b",i_tx_data) ; 
  $display ("Expected dataout = 10111010");
  if ( o_rx_data ==8'b10111010 )
  begin
  $display ("Exact dataout    = %b",o_rx_data) ;
  $display ("Test case #3 is passed successfuly ");
  end
  else
  $display ("Test case #3 Failed ");
  $display("                           ") ;
    $display ("###############TestCase(4)---->mode #3##############");
  $display("                           ") ;
  $display("clk\tMISO MOSI      initial_data     out_shift");
  $monitor("%b   \t%b   %b         %b        %b",clk,i_miso,o_mosi,i_tx_data,o_rx_data);
  mode =3 ;
  clk=1;
  rst=1'b1;
  i_tx_data=8'b10100101;
  
  #(period)rst=1'b0;

  #(period/2)i_miso=1;
  #(period)i_miso=0;
  #(period)i_miso=1;
  #(period)i_miso=1;
  #(period)i_miso=1;
  #(period)i_miso=0;  
  #(period)i_miso=1;
  #(period)i_miso=0;
  #period ;
  $display("                           ") ;
  $display ("initial data in master=%b",i_tx_data) ; 
  $display ("Expected dataout = 10111010");
  if ( o_rx_data ==8'b10111010 )
  begin
  $display ("Exact dataout    = %b",o_rx_data) ;
  $display ("Test case #4 is passed successfuly ");
  end
  else
  $display ("Test case #4 Failed ");
  $display("                           ") ;
//to stop monitoring clk
$finish ;
 
 

end
endmodule