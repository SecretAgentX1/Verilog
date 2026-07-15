module halfadder(
    input y,x,
    output s,c
);

    assign s = x^y;
    assign c = x&y;
endmodule
