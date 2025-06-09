`include "../defs.vh"

module mux_pc(PC_soma_4, PC_alvo, Branch, zero, pc_out);
  input wire [`DATA_WIDTH-1:0] PC_soma_4, PC_alvo;
  input wire Branch, zero; // sinais de branch
  output wire [`DATA_WIDTH-1:0] pc_out;
  
  assign pc_out = (Branch && zero) ? PC_alvo : PC_soma_4;

endmodule