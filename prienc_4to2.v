`timescale 1ns / 1ps


module prienc_4to2(output [1:0] out, input in0, in1, in2, in3);
    assign out = (in3 == 1'b1 ? 2'b11: (in2 == 1'b1 ? 2'b10: (in1 == 1'b1 ? 2'b01 : (in0 == 1'b1 ? 2'b00 : 2'bxx ))));
    
endmodule


