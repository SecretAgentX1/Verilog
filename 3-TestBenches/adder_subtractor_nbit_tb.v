`timescale 1ns/1ps
module  adder_subtractor_nbit_tb(
    
);
parameter n = 4;
reg [n-1:0]x,y;
reg add_n;
wire [n-1:0]s;
wire cout,overflow;

adder_subtractor_nbit
#(.n(n)) ASN(
    .x(x),
    .y(y),
    .add_n(add_n),
    .s(s),
    .cout(cout),
    .overflow(overflow)
);

initial 
begin
    #40 $finish;
end

initial
begin
// 3 - 6 = -3
add_n = 1;
x = 4'd3;
y = 4'd6;
#10;

// -4 + -3 = -7
add_n = 0;
x = -4'd4;
y = -4'd3;
#10;

// 7 + 1 => Overflow
add_n = 0;
x = 4'd7;
y = 4'd1;
#10;

// -8 - 1 => Overflow
add_n = 1;
x = -4'd8;
y = 4'd1;
#10;


end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, adder_subtractor_nbit_tb);
end

initial begin
    $monitor("t=%0t add_n=%b x=%d y=%d s=%d cout=%b overflow=%b",
              $time, add_n, x, y, s, cout, overflow);
end

endmodule
