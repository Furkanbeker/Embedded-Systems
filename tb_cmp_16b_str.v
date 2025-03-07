`timescale 1ns / 1ps

module tb_cmp_16b_str();
    wire a_is_equal, a_is_greater, a_is_smaller;
    reg [15:0] a = 0;
    reg [15:0] b = 0;
    reg [15:0] i,j;

    cmp_16b_str u1(a_is_equal, a_is_greater, a_is_smaller, a, b) ;

    initial begin
        for (i = 0; i < 16'hFFFF; i = i + 1) begin
            for (j = 0; j < 16'hFFFF; j = j + 1) begin
            a=i;
            b=j;
            
            #2; 
            
            $display("%t ns - (%d %d -- %b %b %b)", $time, a, b, a_is_equal, a_is_greater, a_is_smaller);
            end
        end
        $stop;
    end
endmodule
