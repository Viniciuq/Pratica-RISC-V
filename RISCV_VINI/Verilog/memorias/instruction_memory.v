`include "../defs.vh"

module instruction_memory(addr, inst);
  
  input wire [7:0] addr;             // 8 bits para endereçar as 256 instruções possíveis
  output wire [`DATA_WIDTH-1:0] inst; // saida de 32 bits da instrução 
  
  
  reg [`DATA_WIDTH-1:0] mem[0:255]; // criando uma memoria de 256 posições
  									// e 32 bits em cada instrução
  
  assign inst = mem[addr];
  
  initial begin
    
    $readmemh("../instructions.txt", mem, 0, 3);
    
    //pode também ser feito assim:
    
    //mem[0] = 8'b12345678;
    //mem[1] = 8'b00000132;
    
  end
  
endmodule