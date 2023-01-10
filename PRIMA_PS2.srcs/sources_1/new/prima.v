`timescale 1ns / 1ps

module prima(input [19:0] dataIn, clk, R_I, get_out, rst, readIn/*, [2:0] cnt*/, output [19:0] dataOut, reg R_O);//, reg get_in);//, reg RED_LED);

reg [2:0] cnt;

reg [19:0] matrix [4:0];
reg [19:0] RES;
reg [0:4] selected;
reg [2:0] x, x1, x2, x3;

reg [2:0] y [4:0];
reg [2:0] y1 [4:0];
reg [2:0] y2 [4:0];
reg [2:0] y3 [4:0];

reg [4:0] minimum;

reg [4:0] tmp1 [4:0];
reg [4:0] tmp2 [4:0];
reg [4:0] tmp3 [4:0];
reg [4:0] smoller [4:0];

reg [2:0] station;
integer i;
integer j;

parameter s_in = 3'b00, s_prima = 3'b001, s_min = 3'b010, s_out = 3'b011, s_rst = 3'b100;

always@(posedge clk)
begin
//if(readIn)
//    get_in <= ~get_in;
if(rst)
    station <= s_rst;
case(station)
    s_in:
    begin
//        if(R_I)
//            begin
//            RED_LED <= 1'b0;
//            matrix [i][16 - 4*j +:4] <= dataIn;
//            j = j + 1; 
//            end
//        if(j == 5)
//            begin
//            RED_LED <= 1'b1;
//            j = 0;
//            i <= i + 1;
//            end
        if(readIn)
        begin
            if(cnt != 5)
            begin
                matrix [cnt] <= dataIn;
                cnt <= cnt + 1;
            end
        end
        if (cnt == 5)
        begin
            for (i = 0; i < 5; i = i + 1)
                matrix[i][19:16] <= 4'b0;
            station = s_prima;
        end
    end
    
    s_prima:
    begin
        for(i = 0; i < 5; i = i + 1)
        begin
            if(selected[i])
            begin
                if((matrix[i][19:16]!=0)&&(selected[0]==0))
                begin
                    if ((matrix[i][15:12]!=0)&&(selected[1]==0))
                    begin
                        if (matrix[i][19:16] > matrix[i][15:12])
                        begin
                            tmp1[i][4:0] = matrix[i][15:12];
                            y1[i][2:0] = 3'b001;
                        end
                        else
                        begin
                            tmp1[i][4:0] = matrix[i][19:16];
                            y1[i][2:0] = 3'b000;
                        end
                    end
                    else
                    begin
                        tmp1[i][4:0] = matrix[i][19:16];
                        y1[i][2:0] = 3'b000;
                    end
                end
                else
                begin
                    if ((matrix[i][15:12]!=0)&&(selected[1]==0))
                    begin
                        tmp1[i][4:0] = matrix[i][15:12];
                        y1[i][2:0] = 3'b001;
                    end
                    else tmp1[i][4:0] = 5'h10;
                end
                
                if((matrix[i][11:8]!=0)&&(selected[2]==0))
                begin
                    if ((matrix[i][7:4]!=0)&&(selected[3]==0))
                    begin
                        if (matrix[i][11:8] > matrix[i][7:4])
                        begin
                            tmp2[i][4:0] = matrix[i][7:4];
                            y2[i][2:0] = 3'b011;
                        end
                        else
                        begin
                            tmp2[i][4:0] = matrix[i][11:8];
                            y2[i][2:0] = 3'b010;
                        end
                    end
                    else
                    begin
                        tmp2[i][4:0] = matrix[i][11:8];
                        y2[i][2:0] = 3'b010;
                    end
                end
                else
                begin
                    if ((matrix[i][7:4]!=0)&&(selected[3]==0))
                    begin
                        tmp2[i][4:0] = matrix[i][7:4];
                        y2[i][2:0] = 3'b011;
                    end
                    else tmp2[i][4:0] = 5'h10;
                end
                
                if ((matrix[i][3:0]!=0)&&(selected[4]==0))
                begin
                    if (matrix[i][3:0] > tmp2[i][4:0])
                    begin
                        tmp3[i][4:0] = tmp2[i][4:0];
                        y3[i][2:0] = y2[i][2:0];
                    end
                    else 
                    begin
                        tmp3[i][4:0] = matrix[i][3:0];
                        y3[i][2:0] = 3'b100;
                    end
                end
                else
                begin
                    tmp3[i][4:0] = tmp2[i][4:0];
                    y3[i][2:0] = y2[i][2:0];
                end
                
                if (tmp1[i][4:0] > tmp3[i][4:0])
                begin
                    smoller[i][4:0] = tmp3[i][4:0];
                    y[i][2:0] = y3[i][2:0];
                end
                else
                begin
                    smoller[i][4:0] = tmp1[i][4:0];
                    y[i][2:0] = y1[i][2:0];
                end
            end
        end
        station <= s_min;
    end
    
    s_min:
    begin
        if (smoller[0][4:0] > smoller[1][4:0])
        begin
            tmp1[0][4:0] = smoller[1][4:0];
            x1 = 3'b001;
        end
        else
        begin
            tmp1[0][4:0] = smoller[0][4:0];
            x1 = 3'b000;
        end
        if (smoller[2][4:0] > smoller[3][4:0])
        begin
            tmp2[0][4:0] = smoller[3][4:0];
            x2 = 3'b011;
        end
        else
        begin
            tmp2[0][4:0] = smoller[2][4:0];
            x2 = 3'b010;
        end
        
        if (smoller[4][4:0] > tmp2[0][4:0])
        begin
            tmp3[0][4:0] = tmp2[0][4:0];
            x3 = x2;
        end
        else
        begin
            tmp3[0][4:0] = smoller[4][4:0];
            x3 = 3'b100;
        end
        
        if (tmp1[0][4:0] > tmp3[0][4:0])
        begin
            minimum = tmp3[0][4:0];
            x = x3;
        end
        else
        begin
            minimum = tmp1[0][4:0];
            x = x1;
        end
        
        selected[y[x][2:0]] = 1'b1;
        matrix[0][16 - (4*y[x][2:0]) +:4] = 4'b0;
        matrix[1][16 - (4*y[x][2:0]) +:4] = 4'b0;
        matrix[2][16 - (4*y[x][2:0]) +:4] = 4'b0;
        matrix[3][16 - (4*y[x][2:0]) +:4] = 4'b0;
        matrix[4][16 - (4*y[x][2:0]) +:4] = 4'b0;
        matrix[x][16 - (4*y[x][2:0]) +:4] <= minimum[3:0];
        matrix[y[x][2:0]][16 - (4*x) +:4] <= minimum[3:0];
        if(selected == 5'b11111)
        begin
            station <= s_out;
            i <= 0;
        end
        else station <= s_prima;
    end
    
    s_out:
    begin
        R_O <= 1;
        if(get_out)
        begin
            RES <= matrix[i][19:0];
            i = i + 1;
            if (i == 6)
            begin
                R_O = 1'b0;
                station <= s_rst;
            end
        end
    end
    
    s_rst:
    begin
        cnt = 3'b0;
        RES = 20'b0;
        station = s_in;
        selected = 5'b10000;
        x = 3'b0;
        R_O = 1'b0;
        //get_in = 0;
        //RED_LED = 1'b0;
        
        for (i = 0; i < 5; i = i + 1)
        begin
            matrix[i][19:0] = 20'b0;
            y[i][2:0] = 3'b0;
            y1[i][2:0] = 3'b0;
            y2[i][2:0] = 3'b0;
            y3[i][2:0] = 3'b0;
            tmp1[i][4:0] = 5'b10000;
            tmp2[i][4:0] = 5'b10000;
            tmp3[i][4:0] = 5'b10000;
            smoller[i][4:0] = 5'b10000;
        end
        minimum = 5'b10000;
        i = 0;
        j = 0;
    end
endcase
end

initial
begin
    cnt = 3'b0;
    RES = 20'b0;
    station = s_in;
    selected = 5'b10000;
    //get_in = 0;
    x = 3'b0;
    R_O = 1'b0;
    //RED_LED = 1'b0;
    for (i = 0; i < 5; i = i + 1)
    begin
        y[i][2:0] = 3'b0;
        y1[i][2:0] = 3'b0;
        y2[i][2:0] = 3'b0;
        y3[i][2:0] = 3'b0;
        tmp1[i][4:0] = 5'b10000;
        tmp2[i][4:0] = 5'b10000;
        tmp3[i][4:0] = 5'b10000;
        smoller[i][4:0] = 5'b10000;
    end
    minimum = 5'b10000;
    i = 0;
    j = 0;
end

assign dataOut = RES;

endmodule