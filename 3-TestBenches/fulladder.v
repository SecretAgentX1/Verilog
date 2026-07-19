`timescale 1ns/1ps

module fulladder(
    input x,y,cin,
    output s,cout
);
wire s1,c1,c2;
halfadder HA1(
    .x(x),
    .y(y),
    .s(s1),
    .c(c1)
);

halfadder HA2(
    .x(cin),
    .y(s1),
    .s(s),
    .c(c2)
);

assign cout = c1|c2;


endmodule
