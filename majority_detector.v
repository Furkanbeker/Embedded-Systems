`timescale 1ns / 1ps


module majority_detector(V1, V2, V3, U);
    input V1, V2, V3;
    output U;
    wire N1, N2, N3;
    
    and a0(N1, V1, V2),
        a1(N2, V2, V3),
        a2(N3, V3, V1);
        
    or o0(U, N1, N2, N3);
   
endmodule

























