`timescale 1ns / 1ps

module q1_b_rtl(A, B, C, D, F );
    input A, B, C, D;
    output F;
    wire w1, w2, w3, w4;
    wire A_n, B_n, C_n, D_n;
    
    assign A_n = ~A;
    assign B_n = ~B;
    assign C_n = ~C;
    assign D_n = ~D;

    assign w1 = A & B_n;
    assign w2 = A_n & B;
    assign w3 = w1 | w2;
    assign w4 = C | D_n;
    assign F = w3 & w4;

endmodule



//module q1_b_rtl(A, B, C, D, F );
//    input A, B, C, D;
//    output F;
    
//    assign F = ((A & ~B) | (~A & B)) & ( C | ~C);
    
//endmodule