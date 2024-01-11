`timescale 1ns / 1ns
module controller (
    input start,
    co,
    cant_continue,
    clk,
    rst,
    output logic ready,
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

  parameter idle = 3'd0, init = 3'd1, load = 3'd2, mult1 = 3'd 3,
		mult2 = 3'd4, mult3 = 3'd5, cmp = 3'd6, add = 3'd7;
  logic [2:0] ps, ns;
  always @(ps, start, co, cant_continue) begin
    ns = 3'd0;
    {ready, toggle, inc_cnt, ld_ps, init_pp, init_ps, init_cnt, init_TFF, ld_y, ld_x2,
			 sel_x, sel_x2, sel_ROM, ld_pp, sel_pp} = 15 'b 0;
    case (ps)
      idle: begin
        ns = start ? init : idle;
        ready = 1;
      end
      init: begin
        ns = start ? init : load;
        {init_pp, init_ps, init_cnt, init_TFF} = 4'b1111;
      end
      load: begin
        ns = mult1;
        {ld_y, ld_x2, sel_x} = 3'b111;
      end
      mult1: begin
        ns = mult2;
        {sel_x2, inc_cnt, sel_pp, ld_pp} = 4'b1111;
      end
      mult2: begin
        ns = mult3;
        {sel_ROM, inc_cnt, ld_pp, sel_pp} = 4'b1111;
      end
      mult3: begin
        ns = cmp;
        {sel_ROM, ld_pp, sel_pp} = 3'b111;
      end
      cmp: ns = cant_continue ? idle : add;
      add: begin
        ns = co ? idle : mult1;
        {toggle, ld_ps} = 2'b11;
      end
      default: ns = 3'b0;
    endcase
  end
  always @(posedge clk, posedge rst) begin
    if (rst) ps <= 3'b000;
    else ps <= ns;
  end
endmodule
