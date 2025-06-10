`include "../defs.vh"

module datapath(clk, reset);
  
  input wire clk, reset;
  wire [`DATA_WIDTH-1:0] pc_atual, pc_proximo; // PC atual e próximo
  wire [`DATA_WIDTH-1:0] instrucao; // Instrução
  wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch; // Fios para os sinais
  wire [1:0] ALUOp;
  wire [4:0] rs1 = instrucao[19:15]; // Fios para registradores
  wire [4:0] rs2 = instrucao[24:20];
  wire [4:0] rd  = instrucao[11:7];
  wire [`DATA_WIDTH-1:0] rd1, rd2;
  wire [`DATA_WIDTH-1:0] imm;	// Imediato
  wire [`DATA_WIDTH-1:0] alu_mux_out;	// Saida do MUX ALUSrc
  wire [`DATA_WIDTH-1:0] alu_result; // ALU
  wire zero;
  wire [3:0] alu_opcode; // ALU Control
  wire [`DATA_WIDTH-1:0] mem_data; // Memória de dados
  wire [`DATA_WIDTH-1:0] write_data; // Dado a ser escrito no reg
  wire [`DATA_WIDTH-1:0] pc_soma4, pc_alvo;	// Somadores de PC
  wire [`DATA_WIDTH-1:0] pc_mux_out; // Saída do mux PCSrc
  
  pc pc_inst(pc_proximo, clk, reset, pc_atual);
  instruction_memory im_inst(pc_atual[9:2], instrucao);
  control_unit cu_inst(instrucao[6:0], ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
  register_file rf_inst(clk, rs1, rs2, rd, RegWrite, write_data, rd1, rd2);
  imm_gen imm_inst(instrucao, imm);
  mux_alu_src ma_inst(rd2, imm, ALUSrc, alu_mux_out);
  alu_control alu_control_inst(instrucao[31:25], instrucao[14:12], ALUOp, alu_opcode);
  alu alu_inst(rd1, alu_mux_out, alu_opcode, alu_result, zero);
  data_memory dm_inst(alu_result, clk, rd2, MemWrite, MemRead, mem_data);
  mux_memtoreg mmtr_inst(alu_result, mem_data, MemtoReg, write_data);
  pc_soma4 add4_inst(pc_atual, pc_soma4);
  pc_soma_alvo add_imm(pc_atual, imm, pc_alvo);
  mux_pc muxpc(pc_soma4, pc_alvo, Branch, zero, pc_mux_out);

  assign pc_proximo = pc_mux_out;
  
endmodule
