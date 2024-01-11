`timescale 1ns/1ns
module mult(input [15:0] a, b, output [15:0] ans);
	wire [31:0] temp;
	assign temp = a * b;
	assign ans = temp[23:8];
endmodule
