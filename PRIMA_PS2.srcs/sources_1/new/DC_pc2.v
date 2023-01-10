`timescale 1ns / 1ps

module DC_pc2 (input clk, [7:0] pc2_data, pc2_ro, output reg [19:0] fsm_data, reg R_I, reg  set, reg read, reg reset);

reg flag; // флаг, указывающий на то, что пришел код отжатия

parameter [7:0]
	releas = 8'hf0, // код отжатия
	enter = 8'h5a, // код клавиши enter
	g_key = 8'h34, // код клавиши g (set)
	h_key = 8'h33, // код клавиши h (read)
	j_key = 8'h3b; // код клавиши j (reset)

reg [3:0] dc;

initial
begin
    fsm_data = 20'b0; // данные, которые потом будут отправляться в автомат (20-разрядные числа)
    flag = 0; // флаг, указывающий на то, что пришел код отжатия
    R_I = 0;
    set = 0;
    read = 0;
    reset = 0;
    dc = 4'b0;
end

always @(*)
begin
    case (pc2_data)
        8'h45: dc <= 4'h0;
        8'h16: dc <= 4'h1;
        8'h1e: dc <= 4'h2;
        8'h26: dc <= 4'h3;
        8'h25: dc <= 4'h4;
        8'h2e: dc <= 4'h5;
        8'h36: dc <= 4'h6;
        8'h3d: dc <= 4'h7;
        8'h3e: dc <= 4'h8;
        8'h46: dc <= 4'h9;
        8'h1c: dc <= 4'ha;
        8'h32: dc <= 4'hb;
        8'h21: dc <= 4'hc;
        8'h23: dc <= 4'hd;
        8'h24: dc <= 4'he;
        8'h2b: dc <= 4'hf;
        default: dc <= 0;
    endcase
end

always @(posedge clk)
begin
	if (pc2_ro)
	begin
		if (pc2_data == releas) flag <= 1;
		// если флаг уже установлен, то сейчас нам предоставлен код отжатой клавиши
		else if (flag)
		begin
			flag <= 0;
			// если нажата клавиша enter, то отправляем в автомат сигнал R_I
            if (pc2_data == enter)
                R_I <= 1;
			else if(pc2_data == j_key)
			begin
				reset <= 1;
				fsm_data <= 0;
			end
			else if (pc2_data == g_key)
                set <= 1;
			else if (pc2_data == h_key)
                read <= 1;
			else fsm_data <= {fsm_data[15:0], dc};
		end
	end
	// во всех остальных случаях сбрасываем значения, потому что нам их нужно отправлять только в течение одного такта
	else
	begin
		R_I <= 0;
		reset <= 0;
		set <= 0;
		read <= 0;
	end
end

endmodule