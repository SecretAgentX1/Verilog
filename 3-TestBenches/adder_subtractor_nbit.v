`timescale 1ns/1ps
module adder_subtractor_nbit #(parameter n=4)(
    input [n-1:0]x,y,
    input add_n,
    output [n-1:0]s,
    output cout,overflow
);

wire [n-1:0] xored_y;
generate
    genvar k;
    for(k=0;k<n;k= k+1)
    begin : bicx
    assign xored_y[k]=y[k] ^add_n;

    end
endgenerate

rca_nbit #(n) FA(
    .x(x),
    .y(xored_y),
    .cin(add_n),
    .s(s),
    .cout(cout)
);

assign overflow = (x[n-1] & xored_y[n-1] & ~s[n-1]) | (~x[n-1] & ~xored_y[n-1] & s[n-1]);


endmodule
