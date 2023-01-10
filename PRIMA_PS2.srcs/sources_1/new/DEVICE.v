`timescale 1ns / 1ps

module DEVICE(
    input clk_old,
    input clk_pc2,
    input data_pc2,

    output reg [7:0] an, // parts of led panel
    output reg [7:0] seg, // parts of number
    output ok_led, red_led
);

reg [31:0] memory;

reg [7:0] mask;
wire [7:0] catod;
wire clk;

wire [19:0] dataOut; // for result PRIMA

wire set_signal;
wire reset_signal;
wire read_signal;

wire [2:0] count;

wire [19:0] inForPrima;

//assign clk = clk_old; //------------commite for bitstream
CLK_DIV div26(
    .clk(clk_old), 
    .new_clk(clk));  //-----------uncommite for bitstream

COUNTER #(.mod(8), .out(3)) counter ( //counter for output leds
    .clk(clk),
    .rst(reset_signal),
    .ce(1'b1),
    .value(count));

LED led(
    .clk(clk),
    .switcher(memory[((count+1)*4-1)-:4]),
    .SEG(catod));

wire [7:0] recieved_data;
wire readIn_pc2;
wire pc2_ro;
reg ro_dc = 0;
reg flag = 0;

prima prima2(
    .clk(clk_old),
    .dataIn(inForPrima),
    .rst(reset_signal),
    .R_I(set_signal),
    .get_out(read_signal),
    .readIn(readIn_pc2),
    .dataOut(dataOut),
    .R_O(ok_led));

RECIEVER_pc2 reciever(
    .r(data_pc2),
    .clk(clk_old),
    .PC2_CLK(clk_pc2),
    .R_O(pc2_ro),
    .recieved_data(recieved_data));

DC_pc2 dc_pc2 (
    .clk(clk_old),
    .pc2_data(recieved_data),
    .pc2_ro(ro_dc),
    .fsm_data(inForPrima),
    .R_I(readIn_pc2),
    .set(set_signal),
    .read(read_signal),
    .reset(reset_signal));

initial begin
    memory = 0;
    mask = 8'b00011111;
    an = ~1'b1;
    seg = ~8'b0;
end

assign red_led = readIn_pc2;

always@ (posedge clk_old)
begin
    if (pc2_ro&~flag&~clk_pc2) begin
        ro_dc <= 1;
        flag <= 1;
    end
    else ro_dc <= 0;
    if (clk_pc2) flag <= 0;
    
    an <= ~((1'd1 << count) & mask);
    seg <= catod;
    if(reset_signal)
        memory <= 36'b0;
    else
        begin
            if(readIn_pc2)
                memory <= {12'b0, inForPrima};
            if(ok_led || read_signal)
                memory <= {12'b0, dataOut[19:0]};
        end
end
endmodule
