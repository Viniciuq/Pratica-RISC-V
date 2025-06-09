`include "../defs.vh"

module mux_memtoreg_tb;
  
  reg [`DATA_WIDTH-1:0] alu_result, mem_data;
  reg MemtoReg;
  wire [`DATA_WIDTH-1:0] saida_memoria;
  
  mux_memtoreg m1(alu_result, mem_data, MemtoReg, saida_memoria);
  
  initial begin
  
    $dumpfile("mux_memtoreg.vcd");
    $dumpvars(0, mux_memtoreg_tb);
    
    alu_result = 32'd0011; mem_data = 32'd11111; 
    MemtoReg = 1'b1; 
    #5
    
    $display("alu_result = %d | mem_data = %d | MemtoReg = %b | saida_memoria = %d", alu_result, mem_data, MemtoReg, saida_memoria);
    
    MemtoReg = 0;
    #5
  
    $display("alu_result = %d | mem_data = %d | MemtoReg = %b | saida_memoria = %d", alu_result, mem_data, MemtoReg, saida_memoria);
    
    $finish;
  
  end

endmodule