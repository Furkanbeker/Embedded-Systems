`timescale 1ns / 1ps

module cmp_4b_str(a_is_equal, a_is_greater, a_is_smaller, a, b);
    output a_is_equal, a_is_greater, a_is_smaller;
    input [3:0] a,b;
    wire [3:0] xi, not_a, not_b;
    wire aig0, aig1, aig2, aig3;
    wire ais0, ais1, ais2, ais3;

    not not0 [3:0] (not_a, a);
    not not1 [3:0] (not_b, b);
    
//xi = (ai xor bi)'
    xnor xnor0 [3:0] (xi,a,b);

//a_is_equal = x3 x2 x1 x0 
    and and0 (a_is_equal, xi[3], xi[2], xi[1], xi[0]);


//a_is_greater = a3 b3' + x3 a2 b2' + x3 x2 a1 b1' + x3 x2 x1 a0 b0' 
    and and1 (aig0, a[3], not_b[3]);
    and and2 (aig1, xi[3], a[2], not_b[2]);
    and and3 (aig2, xi[3], xi[2], a[1], not_b[1]);
    and and4 (aig3, xi[3], xi[2], xi[1], a[0], not_b[0]);

    or or0 (a_is_greater, aig0, aig1, aig2, aig3);


//a_is_smaller = a3' b3 + x3 a2' b2 + x3 x2 a1' b1 + x3 x2 x1 a0' b0
    and and5 (ais0, not_a[3], b[3]);
    and and6 (ais1, xi[3], not_a[2], b[2]);
    and and7 (ais2, xi[3], xi[2], not_a[1], b[1]);
    and and8 (ais3, xi[3], xi[2], xi[1], not_a[0], b[0]);

    or or1 (a_is_smaller, ais0, ais1, ais2, ais3);


endmodule