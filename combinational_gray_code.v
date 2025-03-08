`timescale 1ns / 1ns

module combinational_gray_code (NS,S,Rst) ;
    output [2:0] NS ;
    input [2:0] S ;
    input Rst ;

    wire not_Rst, A1, A0, B1, B0, C1, C0 ;
    wire [2:0] not_S ; 

    not #1 (not_Rst,Rst), // (output,input) 
        (not_S[2],S[2]), 
        (not_S[1],S[1]), 
        (not_S[0],S[0]);

    and #2 AND_A [1:0] ({A1,A0},not_Rst,S[2:1],{S[0],not_S[0]}) ;
    and #2 (B1,not_Rst,not_S[2],S[0]), (B0,not_Rst,S[1],not_S[0]) ;
    and #2 (C1,not_Rst,not_S[2],not_S[1]), (C0,not_Rst,S[2],S[1]) ;
    or  #2 (NS[2],A1,A0), (NS[1],B1,B0), (NS[0],C1,C0) ;

endmodule