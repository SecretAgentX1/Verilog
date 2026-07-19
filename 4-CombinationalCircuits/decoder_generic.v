`timescale 1ns/1ps
module decoder_generic
#(parameter n = 2) (
    input [n-1:0]w,
    input en,
    output reg [0:2**n - 1] y
);
always @(w,en)
begin
    y = 0;
    if(en)
        y[w] = 1'b1;

end
endmodule
