`timescale 1ns/1ps
module mux_generic_1bit #(
    parameter INS = 7
) (
    input [INS-1:0] w,
    input [$clog2(INS) - 1:0]s,
    output reg f
    
);
    integer k;

    always @(w,s) begin
        f = 'bx;
        for(k=0;k<INS;k=k+1)
        begin
            if(k == s)
                f = w[k];

        end
    end

endmodule
