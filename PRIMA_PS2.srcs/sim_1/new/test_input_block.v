`timescale 1ns / 1ps

module test_input_block();

reg clk, R_I, get;
reg [3:0] dataIn;

wire R_O;
wire [19:0] dataOut;

input_block in (
    .clk(clk), .dataIn(dataIn), .set(R_I), .R_O(R_O), .dataOut(dataOut), .get(get)
);

initial
begin
    clk = 0;
    get = 0;
    
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

always #10 clk = ~clk;

always #20 get = ~get;

endmodule
