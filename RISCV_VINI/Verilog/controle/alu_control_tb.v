module alu_control_tb;
  
  reg [1:0] ALUOp;
  reg [6:0] func7;
  reg [2:0] func3;
  wire [3:0] alu_opcode;
  
  alu_control ac1(func7, func3, ALUOp, alu_opcode);
  
  initial begin
    
    $dumpfile("alu_control.vcd");
    $dumpvars(0, alu_control_tb);
    
    $monitor("ALUOp = %b, func7 = %b, func3 = %b, alu_opcode = %b", ALUOp, func7, func3, alu_opcode);
    
    ALUOp = 2'b00; #10 // manipulação na memoria (load ou store)
    ALUOp = 2'b01; #10 // calcular posição destino na memoria (branch) 
    
    ALUOp = 2'b10; 
    
    func7 = 7'b0000000; func3 = 3'b000; #10 // soma na ula
    func7 = 7'b0100000; func3 = 3'b000; #10 // subtração na ula
    func7 = 7'b0000000; func3 = 3'b111; #10 // logica and na ula
    func7 = 7'b0000000; func3 = 3'b110; #10 // logica or na ula
    
    $finish;
    
  end
  
endmodule