`timescale 1ns/1ps

module multiaddder_tb;
    reg [31:0] x, y;
    reg cin;
    wire [31:0] s;
    wire cout;

    multiadder dut (
        .x(x),
        .y(y),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $dumpfile("multiaddder_tb.vcd");
        $dumpvars(0, multiaddder_tb);

        x = 32'h00000000;
        y = 32'h00000000;
        cin = 1'b0;
        #10;
        $display("Case1: x=%0h y=%0h cin=%b s=%0h cout=%b", x, y, cin, s, cout);

        x = 32'h00000001;
        y = 32'h00000002;
        cin = 1'b0;
        #10;
        $display("Case2: x=%0h y=%0h cin=%b s=%0h cout=%b", x, y, cin, s, cout);

        x = 32'hFFFFFFFF;
        y = 32'h00000001;
        cin = 1'b0;
        #10;
        $display("Case3: x=%0h y=%0h cin=%b s=%0h cout=%b", x, y, cin, s, cout);

        x = 32'h12345678;
        y = 32'h9ABCDEF0;
        cin = 1'b1;
        #10;
        $display("Case4: x=%0h y=%0h cin=%b s=%0h cout=%b", x, y, cin, s, cout);

        $finish;
    end
endmodule
