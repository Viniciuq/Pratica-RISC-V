`include "../defs.vh"

module imm_gen(inst, imm_out);
  input wire [`DATA_WIDTH-1:0] inst;
  output reg [`DATA_WIDTH-1:0] imm_out;
  
  wire [6:0] opcode;
  assign opcode = inst[6:0];
  
  always @(*) begin
    case(opcode) 
      7'b0000011: // lw (Tipo I)
        imm_out = {{20{inst[31]}}, inst[31:20]}; 
      7'b0100011: // sw (Tipo S)
        imm_out = {{20{inst[31]}}, inst[31:25], inst[11:7]};
      7'b1100011: // beq (Tipo B)
        imm_out = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
      default:
        imm_out = 32'b0;
    endcase
  end
endmodule
