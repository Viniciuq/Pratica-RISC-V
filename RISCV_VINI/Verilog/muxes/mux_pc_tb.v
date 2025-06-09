`include "../defs.vh"

module mux_pc_tb;
  
  reg [`DATA_WIDTH-1:0] PC_soma_4, PC_alvo;
  reg Branch, zero; // zero = se rs1 - rs2 = 0, habilita branch.
  wire [`DATA_WIDTH-1:0] pc_out;
  
  mux_pc m1(PC_soma_4, PC_alvo, Branch, zero, pc_out);
  
  initial begin
    
    $dumpfile("mux_pc.vcd");
    $dumpvars(0, mux_pc_tb);
    
    PC_soma_4 = 32'd001; PC_alvo = 32'd11111; 
    Branch = 1'b1; 
    zero = 1'b1;
    #5
    
    $display("PC_soma_4 = %d | PC_alvo = %d | Branch = %b | zero = %b | pc_out = %d", PC_soma_4, PC_alvo, Branch, zero, pc_out);
    
    Branch = 1'b0;
    zero = 1'b0;
    #5
  
    $display("PC_soma_4 = %d | PC_alvo = %d | Branch = %b | zero = %b | pc_out = %d", PC_soma_4, PC_alvo, Branch, zero, pc_out);
    
    $finish;
  
  end
    
endmodule