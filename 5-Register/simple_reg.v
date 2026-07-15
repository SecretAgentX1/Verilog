module simple_reg #(
    parameter N = 4
) (
    input clk,
    input load,
    input [N-1:0] I,
    output [N-1:0] Q
);

reg [N-1:0] q_reg,q_next;
reg [N-1:0] Iload;

always @(posedge clk ) begin
    q_reg <= q_next;
end

always @(I) begin
    if(load)
        q_next = I;
    else
        q_next = q_reg;
end

assign Q = q_reg;
    
endmodule