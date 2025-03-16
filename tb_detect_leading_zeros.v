`timescale 1ns / 1ps

module tb_detect_leading_zeros () ;
    wire [2:0] count ;
    reg [7:0] val ;
    
    detect_leading_zeros  d1(.count(count), .val(val)) ;
    
    initial begin
        for (val = 0; val < 255; val = val + 1) begin 
            #2 ;
            $display("%b - %d", val, count) ;
        end
    end
    
 endmodule


