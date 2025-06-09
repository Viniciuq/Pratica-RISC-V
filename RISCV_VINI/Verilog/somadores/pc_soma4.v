`include "../defs.vh"

module pc_soma4(pc, pc_out_soma4);
  
  input wire [`DATA_WIDTH-1:0] pc;
  output wire [`DATA_WIDTH-1:0] pc_out_soma4;
  
  assign pc_out_soma4 = pc + 4;
  
endmodule