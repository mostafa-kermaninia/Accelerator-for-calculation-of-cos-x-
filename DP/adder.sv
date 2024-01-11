`timescale 1ns/1ns

module adder(input [15:0] a, b, input sel_add, output [15:0] po);
	wire [15:0] bBar;
	assign bBar  = ~b + 1'b1;
	assign po = (sel_add) ? a + b : a + bBar;
endmodule
