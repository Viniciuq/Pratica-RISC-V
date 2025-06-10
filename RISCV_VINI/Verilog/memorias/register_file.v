`include "../defs.vh"

module register_file(clk, rs1, rs2, rd, wr, wd, rd1, rd2);
  
  input wire clk, wr;
  input wire [4:0] rs1, rs2, rd;
  input wire [`DATA_WIDTH-1:0] wd;
  output wire [`DATA_WIDTH-1:0] rd1, rd2;
  
  reg [`DATA_WIDTH-1:0] regfile[31:0];
  
  assign rd1 = (rs1 != 0) ? regfile[rs1] : 0; // posição do rs1 nos regs
  assign rd2 = (rs2 != 0) ? regfile[rs2] : 0; // posição do rs2 nos regs
  
  always @(posedge clk) begin
    
    if(wr)
      regfile[rd] <= wd;
    
  end

  initial begin
    
    regfile[0] = 32'd0;   // x0
    regfile[2] = 32'd5;   // x2 (rs1)
    regfile[3] = 32'd10;  // x3 (rs2)

    regfile[1] = 32'd0;   // resultado da add x1, x2, x3 -> soma
    regfile[5] = 32'd0;   //resultado do lw x5, 0(x2) -> load
    
    regfile[4] = 32'd10;       // valor a ser comparado com o x3, deve dar branch
    
  end

  initial begin
    #50
    $display("Valor do registrador x1 = %d", regfile[1]);
    $display("Valor do registrador x2 = %d", regfile[2]);
    $display("Valor do registrador x3 = %d", regfile[3]);
    $display("Valor do registrador x4 = %d", regfile[4]);
    $display("Valor do registrador x5 = %d", regfile[5]);

  end
  
endmodule
