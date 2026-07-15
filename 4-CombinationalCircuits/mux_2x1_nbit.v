`timescale 1ns/1ps
module mux_2x1_nbit #(
    parameter n = 3
) (
    input [n-1:0]w0,w1,
    input s,
    output reg [n-1:0]f
);

always @(s, w0, w1)
begin
    f = s?w1:w0;
end
    
endmodule
