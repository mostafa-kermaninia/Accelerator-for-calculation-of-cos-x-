`timescale 1ns / 1ns
module DP (
    input [15:0] Xin,
    input [7:0] Yin,
    input Tsignal,
    cen,
    ldseri,
    init_temp,
    initseri,
    izcounter,
    clk,
    rst,
    clr,
    ld_y,
    ldx2,
    slx,
    slx2,
    slR,
    ldtemp,
    sltemp,
    output [15:0] ans,
    output co,
    ygt_temp
);

  wire [15:0] mult_result, x2, temp, add_sub_result, y, Rout, M2_1out, M3_1out;
  logic [7:0] ytemp, fact;
  wire [3:0] adr;
  logic add_sub_sel;
  reg_16 x2reg (
      clk,
      rst,
      ldx2,
      1'b0,
      mult_result,
      x2
  );
  reg_16 tempreg (
      clk,
      rst,
      ldtemp,
      init_temp,
      mult_result,
      temp
  );
  reg_16 serireg (
      clk,
      rst,
      ldseri,
      initseri,
      add_sub_result,
      ans
  );
  reg_8 yreg (
      clk,
      rst,
      ld_y,
      Yin,
      ytemp
  );
  assign y = {8'b0, ytemp};
  four_bit_counter C1 (
      cen,
      izcounter,
      clk,
      rst,
      adr,
      co
  );
  ROM R1 (
      clk,
      rst,
      adr,
      fact
  );
  assign Rout = {8'b0, fact};
  two_MUX M2_1 (
      Xin,
      temp,
      slx,
      sltemp,
      M2_1out
  );
  four_MUX M3_1 (
      x2,
      Rout,
      Xin,
      slx2,
      slR,
      slx,
      M3_1out
  );
  mult mult (
      M3_1out,
      M2_1out,
      mult_result
  );
  comparator comp (
      y,
      temp,
      ygt_temp
  );
  toggle_FF T1 (
      Tsignal,
      clk,
      rst,
      clr,
      add_sub_sel
  );
  adder A1 (
      ans,
      temp,
      add_sub_sel,
      add_sub_result
  );
endmodule
