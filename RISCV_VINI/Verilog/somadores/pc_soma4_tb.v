`include "../defs.vh"

module pc_soma4_tb;
  reg [`DATA_WIDTH-1:0] pc;
  wire [`DATA_WIDTH-1:0] pc_out_soma4;
  
  pc_soma4 ex1(pc, pc_out_soma4);
  
  initial begin
    
    $dumpfile("pc_soma4.vcd");
    $dumpvars(0, pc_soma4_tb);
    
    pc = 32'd10;
    #5
    
    $display("a + b = %d", pc_out_soma4);
    $finish;
    
  end
endmodule