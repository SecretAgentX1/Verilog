module D_FF_neg (
    input D,
    input clk,
    output reg Q,
    output Q_b
);
assign Q_b = ~Q;
always @(negedge clk) begin
    Q = D;
    
end
    
endmodule