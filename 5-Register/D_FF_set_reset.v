module D_FF_reset (
    input clk,
    input D,
    input reset_n, // Asynchronous
    input set_n,   // Synchronous
    output Q
);

reg q_reg,q_next;

 
always @(negedge clk , negedge reset_n ) begin
    if(!reset_n)
        q_reg = 0;
    else
        q_reg <= q_next;
end

always @(D,set_n ) begin
    q_next <= q_reg;
    if(!set_n)
        q_next = 1;
    else 
        q_next <= D;
end

assign Q = q_reg;
    
endmodule