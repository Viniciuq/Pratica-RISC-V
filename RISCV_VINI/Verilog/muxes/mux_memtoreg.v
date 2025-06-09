`include "../defs.vh"

module mux_memtoreg(alu_result, mem_data, MemtoReg, saida_memoria);

  input wire [`DATA_WIDTH-1:0] alu_result, mem_data;
  input wire MemtoReg;
  output wire [`DATA_WIDTH-1:0] saida_memoria;
  
  assign saida_memoria = MemtoReg ? mem_data : alu_result;
  
endmodule