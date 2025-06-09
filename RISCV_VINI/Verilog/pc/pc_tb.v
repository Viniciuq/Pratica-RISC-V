`include "../defs.vh"

module pc_tb;
  reg [`DATA_WIDTH-1:0] pc_in;
  reg rst, clk;
  wire [`DATA_WIDTH-1:0] pc_out;
  pc uut(pc_in, clk, rst, pc_out);

  initial begin

    $dumpfile("pc.vcd");
    $dumpvars(0, pc_tb);

    $monitor("current state: %h", pc_out);

    rst = 1'd0; #5
    pc_in = 32'd12345678; #5
    rst = 1'd1; #5

    $finish;
  end

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

endmodule