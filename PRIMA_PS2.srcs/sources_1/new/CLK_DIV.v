`timescale 1ns / 1ps

module CLK_DIV(
    input clk,
    output new_clk
);

reg [15:0] cnt;

assign new_clk = cnt[10];

always@ (posedge clk) begin
    cnt <= cnt + 1'b1;
end

initial begin
    cnt = 0;
end

endmodule