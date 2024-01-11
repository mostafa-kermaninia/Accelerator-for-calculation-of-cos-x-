`timescale 1ns/1ns

module reg_16(input clk, rst, ld, init1,input [15:0] pin, output logic [15:0] pout);
	always @(posedge clk, posedge rst) begin
		if (rst) pout <= 16'b0;
		else if (init1) pout <= 16'b 0000000100000000;
		else if (ld) pout <= pin;
		else pout <= pout;
	end
endmodule