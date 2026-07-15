`timescale 1ns/1ps

module decoder_generic_tb;

    parameter n = 2;

    reg  [n-1:0] w;
    reg          en;
    wire [0:2**n-1] y;

    // DUT
    decoder_generic #(n) DUT (
        .w(w),
        .en(en),
        .y(y)
    );

    initial begin
        // Waveform
        $dumpfile("wave.vcd");
        $dumpvars(0, decoder_generic_tb);

        // Header
        $display("--------------------------------");
        $display(" Time\t en\t w\t y");
        $display("--------------------------------");

        // Monitor
        $monitor("%4t\t %b\t %b\t %b", $time, en, w, y);

        // Test جميع الحالات

        en = 0; w = 2'b00; #10;
        en = 0; w = 2'b01; #10;
        en = 0; w = 2'b10; #10;
        en = 0; w = 2'b11; #10;

        en = 1; w = 2'b00; #10;
        en = 1; w = 2'b01; #10;
        en = 1; w = 2'b10; #10;
        en = 1; w = 2'b11; #10;

        $finish;
    end

endmodule

