module multiadder (
    input [31:0]x,y,
    input cin,
    output [31:0] s,
    output cout
);

rca_nbit #(32) Adder(
    .x(x),
    .y(y),
    .cin(cin),
    .s(s),
    .cout(cout)
);
    
endmodule
