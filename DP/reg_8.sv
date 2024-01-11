`timescale 1ns/1ns
module reg_8(input clk, rst, ld,input [7:0] pin, output logic [7:0] pout);
	always @(posedge clk, posedge rst) begin
		if (rst) pout <= 8'b0;
		else if (ld) pout <= pin;
		else pout <= pout;
	end


endmodule
