module shift_register #(parameter N =4)(
    input clk,
    input SI,  
    output  SO 
);

reg [N-1:0] Q_reg, Q_next;
always @(posedge clk) begin
    Q_reg <= Q_next;
end


always @(SI,Q_reg ) begin
    // right shift
    Q_next = {SI,Q_reg[N-1:1]};
end

assign SO = Q_reg[0]; // if left shift it would br Q_reg[N-1]

    
endmodule