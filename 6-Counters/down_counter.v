module down_counter #(
    parameter integer BIT = 4
) (
    input clk,
    input reset_n,
    output [BIT - 1:0] Q
);



  reg [BIT - 1:0] Q_reg, Q_next;

  always @(posedge clk, negedge reset_n) begin
    if (~reset_n) Q_reg <= -'b1;
    else Q_reg <= Q_next;
  end


  always @(Q_reg) begin
    Q_next = Q_reg - 1;
  end


  assign Q = Q_reg;


endmodule
