`timescale 1ns / 1ps

module test_bounce();
reg clk;
reg enable;
reg in_signal;
reg [3:0] flag;
wire out_signal;
wire out_enable;

BOUNCE set  (.clk(clk), .in_s(in_signal),   .clock_en(enable), .out_signal(out_signal),   .out_signal_en(out_enable));

//BOUNCE ex_bounce(
//.clk(clk), 
//.enable(enable), 
//.in_signal(in_signal), 
//.out_signal(out_signal), 
//.out_enable(out_enable));

    
always #5 clk = ~clk;
always@ (posedge clk) enable = ~enable;


initial begin
clk <= 0;
flag = 4'b0;
enable <= 0;
end

always@ (*)
begin
$srandom(30631);
repeat($urandom_range(150,0)) begin
    assign in_signal = $random;
    flag = flag + 4'd1;
    #1;
    end
assign in_signal = 1;

#200
$srandom(84356);
repeat($urandom_range(150,0)) begin
    assign in_signal = $random;
    flag = flag + 4'd1;
    #1;
    end
assign in_signal = 0;

#200
$srandom(15163);
repeat($urandom_range(150,0)) begin
    assign in_signal = $random;
    flag = flag + 4'd1;
    #1;
    end
assign in_signal = 1;

#400
$srandom(63211);
repeat($urandom_range(150,0)) begin
    assign in_signal = $random;
    flag = flag + 4'd1;
    #3;
    end
assign in_signal = 0;

end

endmodule
