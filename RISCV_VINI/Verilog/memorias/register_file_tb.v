`include "../defs.vh"

module register_file_tb;
  
  reg clk, wr;
  reg [4:0] rs1, rs2, rd;
  reg [`DATA_WIDTH-1:0] wd;
  wire [`DATA_WIDTH-1:0] rd1, rd2;
  
  register_file rf1(clk, rs1, rs2, rd, wr, wd, rd1, rd2);
  
  // rs = entrada
  // rd = destino
  // wr = sinal de controle para escrever no registrador
  // wd = valor para ser escrito no registrador destino
  
     // Geração de clock
    initial begin
      clk = 0;
      forever #5 clk = ~clk; // Clock de 10 unidades de tempo (período)
    end

    initial begin
      
      $dumpfile("register_file.vcd");
      $dumpvars(0, register_file_tb);
      
      //$monitor("rd1 = %h | rd2 = %h", rd1, rd2);
      
      // Inicialização
      wr = 0; rs1 = 0; rs2 = 0; rd = 0; wd = 0;
	  
      $display("rd1 = %h | rd2 = %h", rd1, rd2);
      
      // Escrevendo 0xAAAAAAAA no registrador 6
      rd = 5'd6; wd = 32'hAAAAAAAA; wr = 1;
      #10

      // Escrevendo 0x55555555 no registrador 3
      rd = 5'd3; wd = 32'h55555555; wr = 1;
      #10

      // Faz leitura dos registradores 6 e 3
      rs1 = 5'd6; rs2 = 5'd3;
      #10
      
      $display("rd1 = %h | rd2 = %h", rd1, rd2);
      $finish;
    end

endmodule