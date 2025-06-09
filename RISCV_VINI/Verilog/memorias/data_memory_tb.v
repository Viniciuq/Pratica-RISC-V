`include "../defs.vh"

module data_memory_tb;
  reg clk, we, MemRead;
  reg [`DATA_WIDTH-1:0] addr, wd;
  wire [`DATA_WIDTH-1:0] rd;
  
  data_memory d1(addr, clk, wd, we, MemRead, rd);
  
  // we = habilita a escrita na memoria
  // alu_result = endereço na memoria
  // wd = o que será escrito na memoria
  // rd = valor lido na memoria
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    
    $dumpfile("data_memory.vcd");
    $dumpvars(0, data_memory_tb);
    
  // Inicializa sinais
    we = 0; MemRead = 0;
    addr = 0; wd = 0;
    #10

    // Escreve em addr 10
    we = 1; MemRead = 0;
    addr = 10;
    wd = 32'hDEADBEEF;
    #10

  // Para a escrita e ativa a leitura em addr 10
    we = 0; MemRead = 1;
    addr = 10;
    #10
    $display("Leitura da posição 10: %h (esperado: DEADBEEF)", rd);

  // Lê da posição 20 (não escrita, deve ser zero)
    addr = 20;
    #10
    $display("Leitura da posição 20: %h (esperado: 0)", rd);

  $finish;
end

endmodule