`timescale 1ns / 1ps

module test_prima();
reg [3:0] dataIn;
wire [19:0] dataOut;
reg clk, rst;
//reg [2:0] addra, addrb;
wire R_O;
wire red;
reg R_I, get_out;
//[19:0] dataIn, R_I, clk, reset, output [19:0] dataOut, reg R_O 

prima fsm(
    //.addra(addra),
    //.addrb(addrb),
    .dataIn(dataIn),
    .clk(clk),
    .R_I(R_I),
    .get_out(get_out),
    .rst(rst),
    .R_O(R_O),
    .dataOut(dataOut),
    .RED_LED(red)
);

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


always@(posedge clk)
begin
    if(R_O)
        #20 get_out = ~get_out;
end

always #10 clk = ~clk;

endmodule

