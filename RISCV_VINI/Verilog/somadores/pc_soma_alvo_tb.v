`include "../defs.vh"

module pc_soma_alvo_tb;
  reg [`DATA_WIDTH-1:0] pc, imm;
  wire [`DATA_WIDTH-1:0] pc_out_imm;
  
  pc_soma_alvo ex1(pc, imm, pc_out_imm);
  
  initial begin
    
    $dumpfile("pc_soma_alvo.vcd");
    $dumpvars(0, pc_soma_alvo_tb);
    
    pc = 32'd10; imm = 32'd10;
    #5
    
    $display("a + b = %d", pc_out_imm);
    $finish;
    
  end
endmodule