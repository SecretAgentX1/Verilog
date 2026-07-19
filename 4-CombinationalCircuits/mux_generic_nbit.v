`timescale 1ns/1ps
module mux_generic_nbit #(
    parameter INS = 7,
    parameter n   = 4
)(
    input  [INS*n-1:0]        w,
    input  [$clog2(INS)-1:0]  s,
    output [n-1:0]             f
);

    genvar k, j;

    generate
        for (k = 0; k < n; k = k + 1) begin : bit_slice
            wire [INS-1:0] w_gathered;

            for (j = 0; j < INS; j = j + 1) begin : gather
                assign w_gathered[j] = w[j*n + k];
            end

            mux_generic_1bit #(.INS(INS)) u_mux (
                .w (w_gathered),
                .s (s),
                .f (f[k])
            );
        end
    endgenerate

endmodule
