`include "../defs.vh" 

module mux_alu_src_tb;

  reg [`DATA_WIDTH-1:0] rd2;
  reg [`DATA_WIDTH-1:0] imm;
  reg ALUSrc;
  wire [`DATA_WIDTH-1:0] saida;
  
  mux_alu_src m1(rd2, imm, ALUSrc, saida);
  
  initial begin
    
    $dumpfile("mux_alu_src.vcd");
    $dumpvars(0, mux_alu_src_tb);  
    
    rd2 = 32'd001; imm = 32'd11111; ALUSrc = 1'b1; #5
    
    $display("rd2 = %d | imm = %d | ALUSrc = %b | saida = %d", rd2, imm, ALUSrc, saida);
    
    ALUSrc = 1'b0; #5
    
    $display("rd2 = %d | imm = %d | ALUSrc = %b | saida = %d", rd2, imm, ALUSrc, saida);
    
    $finish;
    
  end
  
endmodule