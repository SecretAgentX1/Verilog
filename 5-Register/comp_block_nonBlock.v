module comb_block_non (
    input a,b,c,
    output reg x
);
always @(*) begin
    x =a ;
    x = x^b;
    x = x |c;
    
end
    
endmodule