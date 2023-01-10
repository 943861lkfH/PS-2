`timescale 1ns / 1ps

module pc2_test();

parameter	STOP_CODE = 8'hF0,
			clk_period = 10,
			PS2_clk_period = 40,
			code_space_period = 60;

reg clk, PS2_clk, PS2_dat;
reg [7:0] key_code;
reg [3:0] i;

always #(clk_period) clk <= ~clk;
wire [9:0] X;
wire [9:0] Y;

test t(.clk(clk), .PS2_clk(PS2_clk), .PS2_dat(PS2_dat), .X(X), .Y(Y));

initial begin
	PS2_clk <= 1;
	PS2_dat <= 1;
	key_code <= 0;

	clk <= 0;

	#(2*clk_period) key_code = HEX_CD(4'h1);
	PS2_press_and_release_key(key_code);
	#(2*clk_period) key_code = HEX_CD(4'h2);
	PS2_press_and_release_key(key_code);
	#(2*clk_period) key_code = HEX_CD(4'h5);
	PS2_press_and_release_key(key_code);
	#(2*clk_period) key_code = HEX_CD(4'hf);
	PS2_press_and_release_key(key_code);
	#(2*clk_period) key_code = HEX_CD(4'h9);
	PS2_press_and_release_key(key_code);
	$finish;
end


// Нажатие и отжатие клавиши
task automatic PS2_press_and_release_key(input [7:0] code);
	begin
		fork
			PS2_gen_byte_clk();
			PS2_code_input(code);
		join
		#code_space_period;
		fork
			PS2_gen_byte_clk();
			PS2_code_input(STOP_CODE);
		join
		#code_space_period;
		fork
			PS2_gen_byte_clk();
			PS2_code_input(code);
		join
	end
endtask

// Генерация пакета данных
task automatic PS2_code_input( input [7:0] code);
	begin
		PS2_dat <= 0;
		for (i = 0; i < 8; i = i + 1) begin
			@(posedge PS2_clk)
			PS2_dat <= code[i];
		end

		@(posedge PS2_clk)
		PS2_dat <= ~^(code);

		@(posedge PS2_clk)
		PS2_dat <= 1;
	end
endtask

// Генерация синхросигнала для передачи пакета
task automatic PS2_gen_byte_clk;
	begin
		#(clk_period);
		repeat(22) begin 
			PS2_clk <= ~PS2_clk;
			#(PS2_clk_period);
		end
		PS2_clk <= 1;
	end
endtask

function [7:0] HEX_CD;
	input [3:0] number_in;
	begin
		case(number_in)
			4'h0: HEX_CD = 8'h45;
			4'h1: HEX_CD = 8'h16;
			4'h2: HEX_CD = 8'h1E;
			4'h3: HEX_CD = 8'h26;
			4'h4: HEX_CD = 8'h25;
			4'h5: HEX_CD = 8'h2E;
			4'h6: HEX_CD = 8'h36;
			4'h7: HEX_CD = 8'h3D;
			4'h8: HEX_CD = 8'h3E;
			4'h9: HEX_CD = 8'h46;
			4'hA: HEX_CD = 8'h1C;
			4'hB: HEX_CD = 8'h32;
			4'hC: HEX_CD = 8'h21;
			4'hD: HEX_CD = 8'h23;
			4'hE: HEX_CD = 8'h24;
			4'hF: HEX_CD = 8'h2B;
			default: HEX_CD = 0;
		endcase
	end
endfunction

endmodule
