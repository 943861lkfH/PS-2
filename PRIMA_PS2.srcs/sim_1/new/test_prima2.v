`timescale 1ns / 1ps

module test_prima2();

reg clk;

reg rst;
reg R_I;
reg get_out;
reg [3:0] dataIn;

wire [7:0] an;
wire [7:0] seg;

wire ok;
wire red;

DEVICE device(
.clk_old(clk), .set_button(R_I), .reset_button(rst), .read_button(get_out), 
.switch(dataIn), .an(an), .seg(seg), .ok_led(ok), .red_led(red));

always #10 clk = ~clk;

always@(negedge clk)
begin
    if(ok)
        #10 get_out <= ~get_out;
    //else get_out = 1'b0;
end

initial
begin
rst = 0;
get_out = 0;
clk = 0;
//R_I = 0;
//#10

//dataIn = 4'd5;// передаем количество вершин
////addra = 3'h0;
//R_I = 0;
//#10
//R_I = 1;
//#10

//dataIn = 20'h07050;
dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h7;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h5;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

//----------------------------------//dataIn = 20'h70897;

//dataIn = 20'h70897;
dataIn = 4'h7;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h8;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h9;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h7;
R_I = 0;
#10
R_I = 1;
#10

//---------------------------------//dataIn = 20'h08005;

//dataIn = 20'h08005;
dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h8;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h5;
R_I = 0;
#10
R_I = 1;
#10

//-----------------------------------------//dataIn = 20'h5900F;

//dataIn = 20'h5900F;
dataIn = 4'h5;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h9;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'hF;
R_I = 0;
#10
R_I = 1;
#10

//----------------------------------------//dataIn = 20'h075f0;

//dataIn = 20'h075f0;
dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h7;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h5;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'hF;
R_I = 0;
#10
R_I = 1;
#10

dataIn = 4'h0;
R_I = 0;
#10
R_I = 1;
#10
R_I = 0;
end

endmodule
