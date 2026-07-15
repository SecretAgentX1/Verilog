`include "rca.v"


module adder_subtractor_4bit(
    input [3:0] x,y,
    input add_n,
    output [3:0]s,
    output cout
);
    wire [3:0] copy_y;
    assign copy_y[0] = y[0] ^add_n;
    assign copy_y[1] = y[1] ^add_n;
    assign copy_y[2] = y[2] ^add_n;
    assign copy_y[3] = y[3] ^add_n;

    rca_4bit FA(
        .x(x),
        .y(copy_y),
        .cin(add_n),
        .s(s),
        .cout(cout)
    );


endmodule
