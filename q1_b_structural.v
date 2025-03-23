`timescale 1ns / 1ps

module q1_b_structural(A, B, C, D, F );
    input A, B, C, D;
    output F;
    wire w1, w2, w3, w4;
    wire A_n, B_n, C_n, D_n;
    
    not n1(A_n, A);
    not n2(B_n, B);
    not n3(C_n, C);
    not n4(D_n, D);
    
    and a1(w1, A, B_n);
    and a2(w2, A_n, B);
    or o1(w3, w1, w2);
    or o2(w4, C, D_n);
    and a3(F, w3, w4);

endmodule

