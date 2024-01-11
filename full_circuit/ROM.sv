`timescale 1ns / 1ns
module ROM (
    input clk,
    rst,
    input [3:0] address,
    output logic [7:0] data
);
  logic [7:0] element;
  always @(address) begin
    case (address)
      0:  element = 8'hFF;
      1:  element = 8'h80;
      2:  element = 8'h55;
      3:  element = 8'h40;
      4:  element = 8'h33;
      5:  element = 8'h2A;
      6:  element = 8'h24;
      7:  element = 8'h20;
      8:  element = 8'h1c;
      9:  element = 8'h19;
      10: element = 8'h17;
      11: element = 8'h15;
      12: element = 8'h13;
      13: element = 8'h12;
      14: element = 8'h11;
      15: element = 8'h10;
    endcase
  end
  always @(posedge clk, posedge rst) begin
    if (rst) data <= 8'b0;
    else data <= element;
  end
endmodule
