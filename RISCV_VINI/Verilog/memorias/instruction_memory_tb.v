`include "../defs.vh"

module instruction_memory_tb;
  
  reg [7:0] addr;
  wire [`DATA_WIDTH-1:0] inst;
  
  instruction_memory im1 (addr, inst);
  
  integer i;  

  initial begin
    
    $dumpfile("instruction_memory.vcd");
    $dumpvars(0, instruction_memory_tb);
    
    for (i=0; i < 4; i++) begin
      
      addr = i;
      #5
      $display("ENDEREÇO = %d | INSTRUÇÃO = %h", addr, inst);
      
    end
    
    #5
    $finish;
    
  end
  
endmodule