`timescale 1ns / 1ns
module final_cos (
    input [15:0] xinbus,
    input [7:0] yinbus,
    input st,
    clk,
    rst,
    output ready,
    output [15:0] cos_bus
);
  wire  toggle, inc_cnt, ld_ps, init_pp, init_ps, init_cnt,
	 init_TFF, ld_y, ldx2, sel_x, sel_x2, sel_ROM, ld_pp, sel_pp;
  wire count_co, not_continue;

  DP CUT1 (
      xinbus,
      yinbus,
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      clk,
      rst,
      init_TFF,
      ld_y,
      ldx2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp,
      cos_bus,
      count_co,
      not_continue
  );

  controller CUT2 (
      st,
      count_co,
      not_continue,
      clk,
      rst,
      ready,
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      init_TFF,
      ld_y,
      ldx2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp
  );
endmodule
