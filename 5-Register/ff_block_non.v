module D_FF_pos (
    input D,
    input clk,
    output reg Qa,Qb

);
always @(posedge clk) begin
    // Qa <= D;
    // Qb <=Qa;

    // Qa = D;
    // Qb =Qa;

    Qb= Qa;
    Qa = D;
    
end
    
endmodule