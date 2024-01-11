`timescale 1ns / 1ns
module controller_TB ();
  logic clk = 1, rst = 0, can_continue = 1, count_co = 0, start = 0;
  wire ready_pre, toggle, inc_cnt, ld_ps,
		init_pp, init_ps, init_cnt, init_TFF, ld_y, ld_x2, sel_x, sel_x2, sel_ROM, ld_pp, sel_pp;
    wire ready_POST, toggle_POST, inc_cnt_POST, ld_ps_POST,
  		init_pp_POST, init_ps_POST, init_cnt_POST, init_TFF_POST, ld_y_POST, ldx_POST, sel_x_POST, sel_x2_POST, sel_ROM_POST, ld_pp_POST, sel_pp_POST;

  controller PRE (
      start,
      count_co,
      can_continue,
      clk,
      rst,
      ready_pre,
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      init_TFF,
      ld_y,
      ld_x2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp
  );
    controller2 POST (
        start,
        count_co,
        can_continue,
        clk,
        rst,
        ready_POST,
        toggle_POST,
        inc_cnt_POST,
        ld_ps_POST,
        init_pp_POST,
        init_ps_POST,
        init_cnt_POST,
        init_TFF_POST,
        ld_y_POST,
        ldx_POST,
        sel_x_POST,
        sel_x2_POST,
        sel_ROM_POST,
        ld_pp_POST,
        sel_pp_POST
    );
  always #80 clk = ~clk;
  initial begin
    #102 start = 1;
    #203 start = 0;
    #800;
    #103 count_co = 1;
    start = 0;
    #50 $stop;
  end
endmodule
