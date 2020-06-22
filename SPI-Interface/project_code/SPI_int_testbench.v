`timescale 1 ns / 10 ps
module spi_testbench();
reg rst;
reg clk;
reg [1:0] mode ;
reg [0:7]M_i_tx_data;
reg [0:7]S_i_tx_data;
wire[0:7]M_o_rx_data;
wire[0:7]S_o_rx_data;
reg [1:0]C_S;
reg [0:3]no_failures=4'b0;
reg [0:3]no_successful=4'b0;
reg [0:3]no_test_cases=4'b0;
reg [0:3]failure[0:12];

SPI_Integ  spi(mode ,rst,clk,C_S,M_i_tx_data,S_i_tx_data,M_o_rx_data,S_o_rx_data);
integer i=0;
localparam period =10;
assign no_cases=no_test_cases;
always
   #(period/2)clk=~clk;

initial 
begin
//////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
$display (" ######################Test Case (1)---------Mode 0-----############################ ");
no_test_cases<=no_test_cases+1;
clk=0;
mode =0 ;
rst=1'b1;
M_i_tx_data=8'b00100111;
S_i_tx_data=8'b00101010;
C_S=1;
$display (" Hey Master , Send this data %b to Slave #1 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #1                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #1       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #1       = %b ",S_o_rx_data );
end 
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
#120
////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" ######################Test Case (2)---------Mode 0-----############################ ");
no_test_cases<=no_test_cases+1;
clk=0;
rst=1'b1;
M_i_tx_data=8'b10101111;
S_i_tx_data=8'b00000000;
C_S=2;
$display (" Hey Master , Send this data %b to Slave #2 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #2                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #2       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120 
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #2       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
/////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" ######################Test Case (3)---------Mode 0-----############################ ");
no_test_cases<=no_test_cases+1;
clk=0;
rst=1'b1;
M_i_tx_data =8'b11001100;
S_i_tx_data =8'b00110011;
C_S=3;
$display (" Hey Master , Send this data %b to Slave #3 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #3                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #3       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #3       = %b ",S_o_rx_data );
  end 
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

$display (" ######################Test Case (4)---------Mode 1-----############################ ");
no_test_cases<=no_test_cases+1;
mode =1 ;
rst=1'b1;
M_i_tx_data=8'b00000011; 
S_i_tx_data=8'b11100111;
C_S=1 ;
$display (" Hey Master , Send your data %b to Slave #1 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #1                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave          = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #1       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

$display (" ######################Test Case (5)---------Mode 1-----############################ ");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b00100100;
S_i_tx_data=8'b00000111;
C_S=2 ;
$display (" Hey Master , Send your data %b to Slave #2 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #2                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave          = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120 
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #2       = %b ",S_o_rx_data );
 end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
/////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

$display (" ######################Test Case (6)---------Mode 1-----############################ ");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b00010011;
S_i_tx_data=8'b00000111;
C_S=3 ;
$display (" Hey Master , Send your data %b to Slave #3 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #3                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave          = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
     no_successful=no_successful+1;
     $display (" Output data from master         = %b ",M_o_rx_data );
     $display (" Output data from slave #3       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (7)---------Mode 2-----#############################");
no_test_cases<=no_test_cases+1;
mode =2 ;
rst=1'b1;
M_i_tx_data=8'b00000100;
S_i_tx_data=8'b01100100;
C_S=1 ;
$display (" Hey Master , Send your data %b to Slave #1 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #1                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #1       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120 
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
begin
    no_successful=no_successful+1;
    $display (" Output data from master         = %b ",M_o_rx_data );
    $display (" Output data from slave #1       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (8)---------Mode 2-----#############################");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b00100010;
S_i_tx_data=8'b01100100;
C_S=2 ;
$display (" Hey Master , Send your data %b to Slave #2 and read the data from it and give it to me ",M_i_tx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_i_tx_data );
$display (" Data in slave #2                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #2       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
begin
 no_successful=no_successful+1;
 $display (" Output data from master         = %b ",M_o_rx_data );
 $display (" Output data from slave #2       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (9)---------Mode 2-----#############################");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b11111111;
S_i_tx_data=8'b00000000;
C_S=3 ;
$display (" Hey Master , Send your data %b to Slave #3 and read the data from it and give it to me ",M_o_rx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_o_rx_data );
$display (" Data in slave #3                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #3       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
 no_successful=no_successful+1;
 $display (" Output data from master         = %b ",M_o_rx_data );
 $display (" Output data from slave #3       = %b ",S_o_rx_data );
 end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (10)---------Mode 3-----#############################");
no_test_cases<=no_test_cases+1;
mode =3 ;
rst=1'b1;
M_i_tx_data=8'b10001111;
S_i_tx_data=8'b11001000;
C_S=1 ;
$display (" Hey Master , Send your data %b to Slave #1 and read the data from it and give it to me ",M_o_rx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_o_rx_data );
$display (" Data in slave #1                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #1       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
 no_successful=no_successful+1;
 $display (" Output data from master         = %b ",M_o_rx_data );
 $display (" Output data from slave #1       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (11)---------Mode 3-----#############################");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b10001111;
S_i_tx_data=8'b11001000;
C_S=2 ;
$display (" Hey Master , Send your data %b to Slave #2 and read the data from it and give it to me ",M_o_rx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_o_rx_data );
$display (" Data in slave #2                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #2       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin 
 no_successful=no_successful+1;
 $display (" Output data from master         = %b ",M_o_rx_data );
 $display (" Output data from slave #2       = %b ",S_o_rx_data );
end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end
//////////////////////////////////////////////////////////////////////////////////////////////////////
$display (" #######################Test Case (12)---------Mode 3-----#############################");
no_test_cases<=no_test_cases+1;
rst=1'b1;
M_i_tx_data=8'b11111000;
S_i_tx_data=8'b11001000;
C_S=3 ;
$display (" Hey Master , Send your data %b to Slave #3 and read the data from it and give it to me ",M_o_rx_data);

$display ("                                  ");
$display (" Data in master                  = %b ",M_o_rx_data );
$display (" Data in slave #3                = %b ",S_i_tx_data );
$display ("                                  ");
$display (" Expected Data in master         = %b ",S_i_tx_data );
$display (" Expected Data in slave #3       = %b ",M_i_tx_data );
#(period)rst=1'b0;
$display ("                                  ");
#120
if (M_o_rx_data ==S_i_tx_data && S_o_rx_data==M_i_tx_data)
 begin
 no_successful=no_successful+1;
 $display (" Output data from master         = %b ",M_o_rx_data );
 $display (" Output data from slave #3       = %b ",S_o_rx_data );
 end
else 
begin
     $display("communication failed...Error ") ; 
     no_failures=no_failures+1;
     failure[no_failures-1]=no_test_cases;
end


#20
$display (" Finished with  %d  Successful, %d failed test cases out  of %d test cases ",no_successful,no_failures,  no_test_cases);
if (no_failures>0)
begin 
$display (" Failed test cases are ");
for(i=0 ;i<no_failures;i=i+1)
begin
$display ("Test case no.  : %d",failure[i]);
end 
end



end 
endmodule

