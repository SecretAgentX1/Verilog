module upl_counter #(
    parameter integer BIT = 4
) (
    input clk,
    input reset_n,
    input up,
    input enable,
    input load,
    input [BIT - 1:0] D,
    output [BIT - 1:0] Q
);



  reg [BIT - 1:0] Q_reg, Q_next;

  always @(posedge clk, negedge reset_n) begin
    if (~reset_n) Q_reg <= 'b0;
    else if (enable) Q_reg <= Q_next;
    else Q_reg <= Q_reg;
  end


  always @(Q_reg, up, laod, D) begin
    Q_next = Q_reg;
    casex ({
      load, up
    })
      2'b00:   Q_next = Q_reg - 1;
      2'b01:   Q_next = Q_reg + 1;
      2'b1x:   Q_next = D;
      default: Q_next = Q_reg;
    endcase
  end


  assign Q = Q_reg;


endmodule
