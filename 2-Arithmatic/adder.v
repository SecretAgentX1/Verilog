module arithmatic_operator #(
    parameter n=4
) (
    input  [n-1:0] x,
    input  [n-1:0] y,
    output  [n-1:0] s,
    output cout,overflow
);
assign {cout,s} = x+y;
assign overflow = (x[n-1] & y[n-1] & ~s[n-1])|(~x[n-1] & ~y[n-1] & s[n-1]);
    
endmodule
