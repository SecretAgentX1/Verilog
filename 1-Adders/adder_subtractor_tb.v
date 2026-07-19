`timescale 1ns/1ps

module adder_subtractor_tb;
    reg [3:0] x, y;
    reg add_n;
    wire [3:0] s;
    wire cout;

    integer failures;

    adder_subtractor_4bit dut (
        .x(x),
        .y(y),
        .add_n(add_n),
        .s(s),
        .cout(cout)
    );

    task automatic check_case;
        input [3:0] x_in;
        input [3:0] y_in;
        input add_n_in;
        reg [4:0] sum_expected;
        reg [3:0] s_expected;
        reg cout_expected;
        begin
            x = x_in;
            y = y_in;
            add_n = add_n_in;
            #1;

            if (add_n_in) begin
                sum_expected = x_in + (5'd16 - y_in);
            end else begin
                sum_expected = x_in + y_in;
            end

            s_expected = sum_expected[3:0];
            cout_expected = sum_expected[4];

            if ((s !== s_expected) || (cout !== cout_expected)) begin
                $display("FAIL: x=%0d y=%0d add_n=%b -> expected s=%0d cout=%b, got s=%0d cout=%b",
                         x_in, y_in, add_n_in, s_expected, cout_expected, s, cout);
                failures = failures + 1;
            end else begin
                $display("PASS: x=%0d y=%0d add_n=%b -> s=%0d cout=%b",
                         x_in, y_in, add_n_in, s, cout);
            end
        end
    endtask

    initial begin
        $dumpfile("adder_subtractor_tb.vcd");
        $dumpvars(0, adder_subtractor_tb);
        failures = 0;

        check_case(4'd0, 4'd0, 1'b0);
        check_case(4'd1, 4'd2, 1'b0);
        check_case(4'd7, 4'd8, 1'b0);
        check_case(4'd15, 4'd1, 1'b0);
        check_case(4'd8, 4'd8, 1'b0);

        check_case(4'd0, 4'd0, 1'b1);
        check_case(4'd7, 4'd3, 1'b1);
        check_case(4'd3, 4'd5, 1'b1);
        check_case(4'd0, 4'd1, 1'b1);
        check_case(4'd12, 4'd9, 1'b1);

        if (failures == 0) begin
            $display("All 10 test cases passed.");
        end else begin
            $display("Total failed cases: %0d", failures);
        end

        $finish;
    end
endmodule
