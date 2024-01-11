`timescale 1ns/1ns

module adder(input [15:0] a, b, input sel, output [15:0] po);
	wire [15:0] bBar;
	assign bBar  = ~b + 1'b1;
	assign po = (sel) ? a + b : a + bBar;
endmodule
