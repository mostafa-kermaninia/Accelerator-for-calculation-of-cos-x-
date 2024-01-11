`timescale 1ns/1ns
module comparator(input [15:0] a, b, output gT);
	assign gT = (a > b) ? 1'b1 : 1'b0;
endmodule
