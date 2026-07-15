module rca_4bit(
    input [3:0]x,y,
    input cin,
    output [3:0]s,
    output cout
);
wire [3:1]c;
fulladder FA0 (
    .x(x[0]),
    .y(y[0]),
    .cin(cin),
    .s(s[0]),
    .cout(c[1])
);
fulladder FA1 (
    .x(x[1]),
    .y(y[1]),
    .cin(c[1]),
    .s(s[1]),
    .cout(c[2])
);
fulladder FA2 (
    .x(x[2]),
    .y(y[2]),
    .cin(c[2]),
    .s(s[2]),
    .cout(c[3])
);
fulladder FA3 (
    .x(x[3]),
    .y(y[3]),
    .cin(c[3]),
    .s(s[3]),
    .cout(cout)
);

endmodule
