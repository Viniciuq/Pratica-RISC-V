`include "../defs.vh"

module alu_tb;
  
  reg [`DATA_WIDTH-1:0] a, b;
  reg [3:0] ALUOp;
  wire [`DATA_WIDTH-1:0] alu_result;
  wire zero;
  
  alu test1(a, b, ALUOp, alu_result, zero);
  
  initial begin
    
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    
    $display("Testando ALU...");
    #5
    $monitor("a = %b | b = %b | (opcode = %b) | out = %b | zero = %b", a, b, ALUOp, alu_result, zero);
    
    a = 32'b0100; b = 32'b0100; 
    
    ALUOp = 4'b0000; #5
    ALUOp = 4'b0001; #5
    ALUOp = 4'b0010; #5
    ALUOp = 4'b0110; #5
    
    #1
    
    $finish;
    
  end
  
endmodule