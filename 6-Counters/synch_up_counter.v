module synch_up_counter (
    input clk,
    input reset_n,
    output [3:0] Q
);


  wire [3:0] Q_next;

  assign Q_next[0] = 1'b1;
  T_FF FF0 (
      .T(Q_next[0]),
      .clk(clk),
      .reset_n(reset_n),
      .Q(Q[0])
  );


  assign Q_next[1] = Q_next[0] & Q[0];
  T_FF FF1 (
      .T(1'b1),
      .clk(~Q[0]),
      .reset_n(reset_n),
      .Q(Q[1])
  );

  assign Q_next[2] = Q_next[1] & Q[1];

  T_FF FF2 (
      .T(1'b1),
      .clk(~Q[1]),
      .reset_n(reset_n),
      .Q(Q[2])
  );

  assign Q_next[3] = Q_next[2] & Q[2];
  T_FF FF3 (
      .T(1'b1),
      .clk(~Q[2]),
      .reset_n(reset_n),
      .Q(Q[3])
  );



endmodule
