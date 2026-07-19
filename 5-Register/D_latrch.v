module d_latch (
    input D,
    input clk,
    output reg Q,
    output Q_b
);
assign Q_b = ~Q;
always @(D,clk) begin
    Q = Q;
    if(clk)
        Q = D;
    else
        Q  = Q;

    
end
    
endmodule