module control_unit(op, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
  
  input wire [6:0] op;
  output wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
  output wire [1:0] ALUOp;
  output reg [7:0] control_signals;
  
  always @(*) begin
    case(op)
      7'b0110011: control_signals = 8'b0_0_1_0_0_0_10; // type-R
      7'b0000011: control_signals = 8'b1_1_1_1_0_0_00; // lw
      7'b0100011: control_signals = 8'b1_x_0_0_1_0_00; // sw
      7'b1100011: control_signals = 8'b0_x_0_0_0_1_01; // beq
      7'b0000000: control_signals = 8'b0_0_0_0_0_0_00; // setando sinais 
      default: control_signals =    8'bx_x_x_x_x_x_xx;
    endcase
  end
  
  assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = control_signals;
      
endmodule