`timescale 1ns/1ps
module decoder_2x4 (
    input [1:0]w,
    output reg [0:3] y
);
always @(*)
begin
    y = 4'b0000;
    // case (w)
    //     2'b00 : y[0] = 1'b1;
    //     2'b01 : y[1] = 1'b1;
    //     2'b10 : y[2] = 1'b1;
    //     2'b11 : y[3] = 1'b1;
    //     default: y = 4'b0000;
    // endcase

    //easy way
    y[w]=1'b1;
end
endmodule
