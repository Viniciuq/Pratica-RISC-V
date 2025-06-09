`include "../defs.vh"

module pc_soma_alvo(pc, imm, pc_out_imm);
  
  input wire [`DATA_WIDTH-1:0] pc, imm;
  output wire [`DATA_WIDTH-1:0] pc_out_imm;
  
  assign pc_out_imm = pc + imm;
  
endmodule