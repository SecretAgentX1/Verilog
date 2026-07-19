module up_down_counter #(
    parameter integer BIT = 4
) (
    input clk,
    input reset_n,
    input up,
    input enable,
    output [BIT - 1:0] Q
);



  reg [BIT - 1:0] Q_reg, Q_next;

  always @(posedge clk, negedge reset_n) begin
    if (~reset_n) Q_reg <= 'b0;
    else if (enable) Q_reg <= Q_next;
    else Q_reg <= Q_reg;
  end


  always @(Q_reg, up) begin
    Q_next = Q_reg;
    if (up) Q_next = Q_reg + 1;
    else Q_next = Q_reg - 1;
  end


  assign Q = Q_reg;


endmodule
