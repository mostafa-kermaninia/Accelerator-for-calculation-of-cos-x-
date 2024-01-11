`timescale 1ns/1ns
module four_bit_counter(input cen, iz, clk, rst, output logic [3:0] po, output co);
	wire [3:0] ns;
	assign ns = po + 1'b1;
	always @(posedge clk, posedge rst) begin
		if(rst) po <= 4'b 0;
		else if (iz) po <= 4'b 0;
		else if (cen) po <= ns;
	end
	assign co = &ns;
endmodule
