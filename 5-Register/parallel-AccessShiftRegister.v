

module shift_register #(parameter N =4)(
    input clk,
    input sel,
    input SI,
    input [N-1:0] PI,
    input reset_n,
    output  [N-1:0]PO,
    output  SO 
);

reg [N-1:0] Q_reg, Q_next;

always @(posedge clk , negedge reset_n)
begin
    if (!reset_n)
        Q_reg <= 'b0;
    else
        Q_reg <= Q_next;
end


always @(SI,Q_reg,sel,PI) begin
    // right shift
    Q_next = Q_reg;
    if(sel)
        Q_next = PI;
    else
        Q_next = {SI,Q_reg[N-1:1]};
end

assign SO = Q_reg[0]; // if left shift it would br Q_reg[N-1]
assign PO = Q_reg;

    
endmodule