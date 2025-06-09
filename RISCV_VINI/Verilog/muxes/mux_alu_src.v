`include "../defs.vh" 

module mux_alu_src(rd2, imm, ALUSrc, saida);
  
  input wire [`DATA_WIDTH-1:0] rd2, imm; // valor do rd2 imediato
  input wire ALUSrc;				     // sinal do ALUSrc
  output wire [`DATA_WIDTH-1:0] saida;
  
  assign saida = ALUSrc ? imm : rd2;
  
endmodule

