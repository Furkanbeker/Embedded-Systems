`timescale 1ns / 1ps

module cmp_4b_rtl (
    output a_is_equal, a_is_greater, a_is_smaller,  
    input [3:0] a, b) ;

    assign a_is_greater = a > b;
    assign a_is_smaller = a < b;
    assign a_is_equal = a == b;

endmodule
