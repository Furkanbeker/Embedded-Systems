`timescale 1ns / 1ps

module detect_leading_zeros(count, val);
    output [2:0] count;
    input [7:0] val;

    assign count = ~(|val[7:1]) & val[0] ? 8'd7 
                 : ~(|val[7:2]) & val[1] ? 8'd6 
                 : ~(|val[7:3]) & val[2] ? 8'd5 
                 : ~(|val[7:4]) & val[3] ? 8'd4 
                 : ~(|val[7:5]) & val[4] ? 8'd3 
                 : ~(|val[7:6]) & val[5] ? 8'd2 
                 : ~(|val[7:7]) & val[6] ? 8'd1 
                 : 8'd0 ;                       

endmodule


