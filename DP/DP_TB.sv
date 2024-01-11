`timescale 1ns / 1ns
module DP_TB ();
  wire [15:0] cos_bus_PRE, cos_bus_POST;
  wire not_continue_PRE, not_continue_POST;
  logic [15:0] xx = 16'b0000000000100000;
  logic [ 7:0] yy = 8'b0;
  logic
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      clk,
      rst,
      init_DFF,
      ld_y,
      ld_x2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp;
  DP DP_PRE (
      xx,
      yy,
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      clk,
      rst,
      init_DFF,
      ld_y,
      ld_x2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp,
      cos_bus_PRE,
      cnt_co,
      not_continue_PRE
  );
  DP2 DP_POST (
      xx,
      yy,
      toggle,
      inc_cnt,
      ld_ps,
      init_pp,
      init_ps,
      init_cnt,
      clk,
      rst,
      init_DFF,
      ld_y,
      ld_x2,
      sel_x,
      sel_x2,
      sel_ROM,
      ld_pp,
      sel_pp,
      cos_bus_POST,
      cnt_co,
      not_continue_POST
  );
  always #90 clk = ~clk;
  initial begin
    toggle = 0;
    inc_cnt = 0;
    ld_ps = 0;
    init_pp = 1;
    init_ps = 1;
    init_cnt = 1;
    clk = 1;
    rst = 0;
    init_DFF = 1;
    ld_y = 0;
    ld_x2 = 0;
    sel_x = 0;
    sel_x2 = 0;
    sel_ROM = 0;
    ld_pp = 0;
    sel_pp = 0;
    #200 init_pp = 0;
    init_ps = 0;
    init_cnt = 0;
    init_DFF = 0;
    ld_y = 1;
    ld_x2 = 1;
    sel_x = 1;
    #300 ld_y = 0;
    ld_x2   = 0;
    sel_x   = 0;
    inc_cnt = 1;
    sel_x2  = 1;
    sel_pp  = 1;
    ld_pp   = 1;
    #200 sel_x2 = 0;
    sel_ROM = 1;
    #180 inc_cnt = 0;
    #180 sel_ROM = 0;
    ld_pp  = 0;
    sel_pp = 0;
    ld_ps  = 1;
    toggle = 1;
    #500 $stop;
  end
endmodule
