`include "../defs.vh"

module datapath_tb;

  reg clk, reset;

  datapath dut(clk, reset);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  // 1 caso soma        --->  add x1, x2, x3
  // 2 caso store       --->  sw x1, 0(x2)
  // 3 caso soma        --->  lw x5, 0(x2)
  // 4 caso store       --->  beq x3, x4, 12

  initial begin
    
    $dumpfile("datapath.vcd");
    $dumpvars(0, datapath_tb);
    
    reset = 1;
    #10;
    reset = 0;

    #100;
   
    $finish;
  end

endmodule
