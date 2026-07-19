`timescale 1ns/1ps
module generic_priority_encoder
#(parameter N = 4) (
    input [N-1:0] w,
    output z,
    output reg [$clog2(N)-1:0] y
);

    assign z = |w;
    integer k;

    // always @(w) begin
    //     y = 'bx;
    //     for (k = N-1; k>=0; k=k-1) begin
    //         if(w[k])
    //         begin
    //             y= k;
    //             k = 'b0;
                
    //         end
    //     end

    // end
    
    always @(w) begin
        y = 'bx;
        for (k = 0; k<N; k=k+1) begin
            if(w[k])
            begin
                y= k;
                
            end
        end

    end





endmodule
