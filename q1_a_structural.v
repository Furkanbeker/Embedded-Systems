`timescale 1ns / 1ps

module q1_a_structural(A, B, C, D, F);
    input A, B, C, D;
    output F;
    wire C_n, w1, w2, w3, w4;
    
    not n1(C_n, C);
    and a1(w1, C, D);
    or o1(w2, w1, B);
    and a2(w3, w2, A);
    and a3 (w4, B, C_n);
    or o2(F, w3, w4); 
    
endmodule



