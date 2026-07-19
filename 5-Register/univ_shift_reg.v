

module shift_register #(parameter N =4)(
    input clk,
    input [1:0]sel,
    input SIR,
    input SIL,
    input reset_n,
    input [N-1:0] PI,
    output [N-1:0]PO,
    output SOR,
    output SOL
);

reg [N-1:0] Q_reg, Q_next;

always @(posedge clk , negedge reset_n)
begin
    if (!reset_n)
        Q_reg <= 'b0;
    else
        Q_reg <= Q_next;
end


always @(SIR,SIL,Q_reg,sel,PI) begin
    // right shift
    Q_next = Q_reg;
    case(sel)
        2'b00: Q_next = Q_reg;
        2'b01: Q_next = {SIR,Q_reg[N-1:1]}; 
        2'b10: Q_next = {Q_reg[N-2:0],SIL};
        2'b11: Q_next = PI;
    endcase
end

assign SOR = Q_reg[0]; // if left shift it would br Q_reg[N-1]
assign SOL = Q_reg[N-1];
assign PO = Q_reg;

    
endmodule