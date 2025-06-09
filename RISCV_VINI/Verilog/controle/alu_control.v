module alu_control(func7, func3, ALUOp, alu_opcode);
  
  input wire [1:0] ALUOp;
  input wire [6:0] func7;
  input wire [2:0] func3;
  output reg [3:0] alu_opcode;
  
  always @(*) begin
    
    case(ALUOp)
      
      2'b00: alu_opcode = 4'b0010; // sw, lw
      2'b01: alu_opcode = 4'b0110; // beq
      2'b10:                       //type R
        begin
          case({func7, func3})
            10'b0000000_000: alu_opcode = 4'b0010; // add
            10'b0100000_000: alu_opcode = 4'b0110; // sub
            10'b0000000_111: alu_opcode = 4'b0000; // and
            10'b0000000_110: alu_opcode = 4'b0001; // or
          
            default: alu_opcode = 4'bxxxx;
            
          endcase
        end
            
      default: alu_opcode = 4'bxxxx;
      
    endcase
  end
  
endmodule