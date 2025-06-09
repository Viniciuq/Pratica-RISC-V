module control_unit_tb;
  
  reg [6:0] op;
  wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
  wire [1:0] ALUOp;
  
  control_unit uc1(op, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
  
  initial begin
    
    $dumpfile("control_unit.vcd");
    $dumpvars(0, control_unit_tb);
    
    $monitor("ALUSrc = %b, MemtoReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, ALUOp = %b", ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    
    op = 7'b0000000; #5;
    
    op = 7'b0110011; #5; // R-format
    
    op = 7'b0000011; #5; // lw

    op = 7'b0100011; #5; // sw

    op = 7'b1100011; #5; // beq
    
    $finish;
    
  end
  
endmodule