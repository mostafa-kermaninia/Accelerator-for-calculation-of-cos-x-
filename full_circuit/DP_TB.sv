`timescale 1ns/1ns
module DP_TB();
	logic [15:0] Xin = 16 'b 0000000000100000;
	logic [7:0] Yin = 8'b0;
	logic cen = 0, ldseri = 0, init_temp = 1, initseri = 1, izcounter = 1, clk = 1, rst = 0,
	 clr = 1, ld_y = 0, ldx2 = 0, slx = 0, slx2 = 0, slR = 0, ldtemp = 0, sltemp = 0;
	wire [15:0] ans;
	wire co, ygt_temp;
	DP CUT1(Xin, Yin,
	 Tsignal, cen, ldseri, init_temp, initseri, izcounter, clk, rst,
	 clr, ld_y, ldx2, slx, slx2, slR, ldtemp, sltemp, ans, co, ygt_temp);
	always #90 clk = ~clk;
	initial begin
	#90 init_temp = 0; 
	initseri = 0;
	izcounter = 0;
	clr = 0;
	ld_y = 1;
	ldx2 = 1;
	slx = 1;
	#200 ld_y = 0;
	ldx2 = 0;
	slx = 0;
	slx2 = 1;
	sltemp = 1;
	ldtemp = 1;
	#500 $stop;
	end
endmodule
