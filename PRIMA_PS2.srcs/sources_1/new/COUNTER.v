`timescale 1ns / 1ps


module COUNTER #(mod = 64, out = 3) (
    input clk,
    input rst,
    input ce,
    output wire [out-1:0] value
    );
    
reg [out-1:0] cnt;
integer n;

initial
begin
    cnt = 0;
end
    
assign value = cnt;
    
always@(posedge clk)
begin
    if (ce) begin  
        if (cnt != mod-1) begin
            cnt = cnt + 1;
        end
        else begin
            cnt = 0;
        end
    end
    else begin
        cnt = 1'b0;
    end
end

endmodule
