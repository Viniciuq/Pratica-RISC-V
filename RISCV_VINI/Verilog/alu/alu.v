`include "../defs.vh"

module alu(a, b, alu_opcode, alu_result, zero);
  
  input wire [`DATA_WIDTH-1:0] a, b;
  input wire [3:0] alu_opcode;  // ALUOp da unit control
  output reg [`DATA_WIDTH-1:0] alu_result;   // Resultado da operação
  output wire zero;
  
  always @(*) begin
    
    case (alu_opcode)
      4'b0000: alu_result <= a & b;
      4'b0001: alu_result <= a | b;
      4'b0010: alu_result <= a + b;
      4'b0110: alu_result <= a - b;
      default: alu_result <= 32'bz;
    endcase
  end
  
  assign zero = (alu_result == 32'b0);
  
endmodule