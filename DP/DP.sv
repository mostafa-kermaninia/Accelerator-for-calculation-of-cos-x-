`timescale 1ns / 1ns
module DP (
    input [15:0] xinbus,
    input [7:0] yinbus,
    input toggle,
    inc_cnt,
    ld_ps,
    init_pp,
    init_ps,
    init_cnt,
    clk,
    rst,
    init_TFF,
    ld_y,
    ld_x2,
    sel_x,
    sel_x2,
    sel_ROM,
    ld_pp,
    sel_pp,
    output [15:0] cnt_cos_bus,
    output cnt_co,
    not_continue
);

  wire [15:0] multiply_out, x, temp, add_sub_result, y, Rout, M2_1out, M3_1out;
  logic [7:0] ytemp, fact;
  wire [3:0] adr;
  logic add_sub_sel;
  reg_16 x2_reg (
      clk,
      rst,
      ld_x2,
      1'b0,
      multiply_out,
      x2
  );
  reg_16 PP_reg (
      clk,
      rst,
      ld_pp,
      init_pp,
      multiply_out,
      temp
  );
  reg_16 PS_reg (
      clk,
      rst,
      ld_ps,
      init_ps,
      add_sub_result,
      cnt_cos_bus
  );
  reg_8 y_reg (
      clk,
      rst,
      ld_y,
      yinbus,
      ytemp
  );
  assign y = {8'b0, ytemp};
  four_bit_counter C1 (
      inc_cnt,
      init_cnt,
      clk,
      rst,
      adr,
      cnt_co
  );
  ROM R1 (
      clk,
      rst,
      adr,
      fact
  );
  assign Rout = {8'b0, fact};
  two_MUX M2_1 (
      xinbus,
      temp,
      sel_x,
      sel_pp,
      M2_1out
  );
  four_MUX M3_1 (
      x2,
      Rout,
      xinbus,
      sel_x2,
      sel_ROM,
      sel_x,
      M3_1out
  );
  mult mult (
      M3_1out,
      M2_1out,
      multiply_out
  );
  comparator cnt_comp (
      y,
      temp,
      not_continue
  );
  toggle_FF T1 (
      toggle,
      clk,
      rst,
      init_TFF,
      add_sub_sel
  );
  adder A1 (
      cnt_cos_bus,
      temp,
      add_sub_sel,
      add_sub_result
  );
endmodule
