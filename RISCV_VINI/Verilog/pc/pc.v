`include "../defs.vh"

module pc(pc_in, clk, rst, pc_out);
  
  input wire rst, clk; 
  input wire [`DATA_WIDTH-1:0] pc_in;  // valor calculado (proximo endereço)
  output reg [`DATA_WIDTH-1:0] pc_out; // saida com o valor atual
  
  always @(posedge clk, posedge rst) begin
    
    if (rst)
      pc_out <= 0;
    else
      pc_out <= pc_in;
  end

endmodule