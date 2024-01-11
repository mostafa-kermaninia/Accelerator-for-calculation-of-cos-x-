`timescale 1ns / 1ns
module cos_TB ();
  wire ready_pre, ready_post;
  wire [15:0] outCosx_pre, outCosx_post;
  logic [15:0] xx;
  logic [ 7:0] yy;
  logic clk = 0, rst = 0, st = 0;
  final_cos PRE (
      xx,
      yy,
      st,
      clk,
      rst,
      ready_pre,
      outCosx_pre
  );
  final_cos_2 POST (
      xx,
      yy,
      st,
      clk,
      rst,
      ready_post,
      outCosx_post
  );
  always #222 clk = ~clk;
  initial begin
    // test1
    #700 st = 1;
    #700 st = 0;

    xx = 16'b0000000011110101;
    yy = 8'b00000101;
    // good out = 0000000010010100
    #35453;


    // test2
    #700;
    st = 1;
    #700 st = 0;

    xx = 16'b0000001001001100;
    yy = 8'b01110011;
    // good out = 1111111110000110

    #101010 $stop;
  end
endmodule
