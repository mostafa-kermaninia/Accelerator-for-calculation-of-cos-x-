`timescale 1ns/1ns
module two_MUX(input [15:0] a, b, input sla, slb, output [15:0] s);
	assign s = sla ? a:
	           slb ? b: 16'b z;
endmodule
