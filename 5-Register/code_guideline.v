module D_FF_pos (
    input a,b,c,
    input clk,
    output reg f,g

);
// reg f_reg, f_next, g_reg, g_next;

// always @(posedge clk ) begin
//     f_reg <= f_next;
//     g_reg <= g_next;
// end


// // next state logic
// always@(a, b, c, g_reg) begin
//     f_next = a & (~g_reg);
//     g_next = b | c ;
// end

// // output logic
// assign f = f_reg;
// assign g = g_reg;

//short form of the code

always @(posedge clk ) begin
    f <= a & ~g;
    g <= b|c;
    
end
    
endmodule