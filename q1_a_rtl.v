`timescale 1ns / 1ps

module q1_a_rtl(A, B, C, D, F);
    input A, B, C, D;
    output F;
    wire C_n, w1, w2, w3, w4;
    
    assign C_n = ~C;
    assign w1 = C & D;
    assign w2 = w1 | B;
    assign w3 = w2 & A;
    assign w4 = B & C_n;
    assign F = w3 | w4;
    
endmodule

//module q1_a_rtl(A, B, C, D, F);
//    input A, B, C, D;
//    output F;
    
//    assign F = (((C & D) | B) & A) | (B & ~C);  
    
//endmodule


