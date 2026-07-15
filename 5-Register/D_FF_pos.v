module D_FF_pos (
    input D,
    input clk,
    output reg Q,
    output Q_b
);
assign Q_b = ~Q;
always @(posedge clk) begin
    Q = D;
    
end
    
endmodule