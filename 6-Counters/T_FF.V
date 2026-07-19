module T_FF (
    input  T,
    input  clk,
    input  reset_n,
    output Q
);
  wire Q_next;
  reg  Q_reg;
  always @(posedge clk, negedge reset_n) begin
    if (!reset_n) begin
      Q_reg <= 0;
    end else begin
      Q_reg <= Q_reg ^ Q_next;
    end

  end

  assign Q_next = T;
  //   assign Q_next = T ? ~Q_reg : Q_reg;
  assign Q = Q_reg;
endmodule

