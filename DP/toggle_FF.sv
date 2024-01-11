`timescale 1ns / 1ns
module toggle_FF (
    input T,
    clk,
    rst,
    clr,
    output logic Q
);
  wire Qprim;
  assign Qprim = T ? ~Q : Q;
  always @(posedge clk, posedge rst) begin
    if (rst) Q <= 1'b0;
    else if (clr) Q <= 1'b0;
    else Q <= Qprim;
  end
endmodule
