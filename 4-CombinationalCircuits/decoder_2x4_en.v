`timescale 1ns/1ps
module decoder_2x4_en (
    input [1:0]w,
    input en,
    output reg [0:3] y
);
always @(w,en)
begin
    y = 4'b0000;
    if(en)
    begin
        case (w)
            2'b00 : y[0] = 1'b1;
            2'b01 : y[1] = 1'b1;
            2'b10 : y[2] = 1'b1;
            2'b11 : y[3] = 1'b1;
            default: y = 4'b0000;
        endcase
    end
    else
        y = 4'b0000;
end
endmodule
