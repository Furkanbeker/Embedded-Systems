`timescale 1ns / 1ps


not ( Rstb, Rst),
    ( S2b, S2),
    ( S1b, S1);
    
and ( S0_1, Rstb, S2b, S1b),
    ( S0_2, Rstb, S2, S1);
    
or ( Sop, S0_1, S0_2);


assign Sop = ( ~Rst)&(~S2)&(~S1) / (~Rst)&(S2)&(S1) ) ;






































