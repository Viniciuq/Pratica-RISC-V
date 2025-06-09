`include "../defs.vh"

module imm_gen_tb;

  reg [`DATA_WIDTH-1:0] inst;
  wire [`DATA_WIDTH-1:0] imm_out;

  imm_gen imm1(inst, imm_out);

  initial begin

    $dumpfile("imm_gen.vcd");
    $dumpvars(0, imm_gen_tb);
    
    // Caso 1: lw (I-type)
    // inst[31:20] = 12'hFFF (=-1 em 12 bits com sinal)
    inst = 32'b111111111111_00000_010_00001_0000011; 
    #10
    // Esperado imm_out = 0xFFFFFFFF (32-bit sinal estendido -1)
    $display("LW: inst= %b, imm_out= %b", inst, imm_out);

    // Caso 2: sw (S-type)
    // inst[31:25] = 7'b0000001, inst[11:7] = 5'b00101 (decimal 37)
    inst = 0;
    inst[31:25] = 7'b0000001;
    inst[11:7]  = 5'b00101;
    inst[6:0]   = 7'b0100011; // opcode sw
    #10
    // Esperado imm_out = 32'b100101 (32 + 5 = 37 decimal)
    $display("SW: inst= %b, imm_out= %b", inst, imm_out);

    // BEQ: imediato = 4 decimal (offset)
    inst = 0;
    inst[31]    = 1'b0;       // inst[31] é o bit de sinal (imm[12])
    inst[7]     = 1'b0;       // inst[7] é imm[11]
    inst[30:25] = 6'b000000;  // inst[30:25] são imm[10:5]
    inst[11:8]  = 4'b0010;    // inst[11:8] são imm[4:1]
    inst[6:0]   = 7'b1100011; // opcode beq
    #10
    // Esperado imm_out = 4 decimal = 0x4
    $display("BEQ: inst= %b, imm_out= %b", inst, imm_out);

    $finish;
  end

endmodule