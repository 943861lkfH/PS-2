`timescale 1ns / 1ps

module RECIEVER_pc2 (input r, clk, PC2_CLK, output reg R_O, reg [7:0] recieved_data);

reg [3:0] state;

initial
begin
    state = 4'b0;
    R_O = 0;
    recieved_data = 8'b0;
end

always @(negedge PC2_CLK)
begin
	case (state)
		4'd0: 
		begin
			R_O <= 0;
			if (~r) state <= state + 1;
		end
		4'd1: 
		begin
			// записываем биты данных
			recieved_data[0] <= r;
			state <= state + 1;
		end
		4'd2: 
		begin
			recieved_data[1] <= r;
			state <= state + 1;
		end
		4'd3: 
		begin
			recieved_data[2] <= r;
			state <= state + 1;
		end
		4'd4: 
		begin
			recieved_data[3] <= r;
			state <= state + 1;
		end
		4'd5: 
		begin
			recieved_data[4] <= r;
			state <= state + 1;
		end
		4'd6: 
		begin
			recieved_data[5] <= r;
			state <= state + 1;
		end
		4'd7: 
		begin
			recieved_data[6] <= r;
			state <= state + 1;
		end
		4'd8: 
		begin
			recieved_data[7] <= r;
			state <= state + 1;
		end
		4'd9: 
		begin
			if (^recieved_data^r)
                state <= state + 1;
			else state <= 0;
		end
		4'd10:	
		begin
			R_O <= r ? 1 : 0;
			state <= 0;
		end
		default: state <= 0;
	endcase
end

endmodule