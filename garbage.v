`timescale 1ns / 1ps

module garbage(A,B,C,D,E);
    input A,B,C,D;
    output E;
    wire K,L;
    
    and a1(K,A,B);
    nand a2(L,C,D);
    or a3(E,K,L);

endmodule










