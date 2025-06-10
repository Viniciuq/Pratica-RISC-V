`include "../defs.vh"

module data_memory(addr, clk, wd, we, MemRead, rd);
  input wire clk, we, MemRead;
  input wire [`DATA_WIDTH-1:0] addr, wd;
  output reg [`DATA_WIDTH-1:0] rd;
  
  reg [31:0] RAM[0:64]; // memória de 65 posições (0 a 64)

  always @(*) begin
    
    if (MemRead)
      rd = RAM[addr];
    
    else
      rd = 32'b0;
    
  end

  always @(posedge clk) begin
    
    if (we)
      RAM[addr] <= wd;
    
  end

  initial begin

    RAM[5] = 32'd0; // resultado do store sw x1, 0(x2)
    RAM[9] = 32'd33; // valor a ser guardado no registrador x5
    
    #100

    $display("Valor do memoria RAM[5] = %d", RAM[5]); #1
    $display("Valor do memoria RAM[9] = %d", RAM[9]); #1
    $finish;

  end
  
endmodule
