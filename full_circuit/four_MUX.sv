`timescale 1ns/1ns
module four_MUX(input [15:0] a, b, c, input sla, slb, slc, output [15:0] s);
	assign s = sla ? a :
		   slb ? b :
		   slc ? c : 16'b 0;
endmodule 