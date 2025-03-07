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



module cmp_16b_str (a_is_equal, a_is_greater, a_is_smaller, a, b) ;
    output a_is_equal, a_is_greater, a_is_smaller;
    input [15:0] a, b;
    
    wire a_eq0, a_eq1, a_eq2, a_eq3;
    wire a_gr0, a_gr1, a_gr2, a_gr3;
    wire a_sm0, a_sm1, a_sm2, a_sm3;
    wire a_g0, a_g1, a_g2;
    wire a_s0, a_s1, a_s2;
    
    cmp_4b_str x0(.a_is_equal(a_eq0), .a_is_greater(a_gr0), .a_is_smaller(a_sm0), .a(a[15:12]), .b(b[15:12]));
    cmp_4b_str x1(.a_is_equal(a_eq1), .a_is_greater(a_gr1), .a_is_smaller(a_sm1), .a(a[11:8]), .b(b[11:8]));
    cmp_4b_str x2(.a_is_equal(a_eq2), .a_is_greater(a_gr2), .a_is_smaller(a_sm2), .a(a[7:4]), .b(b[7:4]));
    cmp_4b_str x3(.a_is_equal(a_eq3), .a_is_greater(a_gr3), .a_is_smaller(a_sm3), .a(a[3:0]), .b(b[3:0]));
    
    //a_is_equal = a_eq0 a_eq1 a_eq2 a_eq03         
    and and9(a_is_equal, a_eq0, a_eq1, a_eq2, a_eq3);
    
    //a_is_greater = [15:12] greater or 
    //  ([15:12] equal and [11:8] greater) or 
    //  ([15:12] equal and [11:8] equal and [7:4] greater) or 
    //  ([15:12] equal and [11:8] equal and [7:4] equal and [3:0] greater)
    and and10 ( a_g0, a_eq0, a_gr1);
    and and11 ( a_g1, a_eq0, a_eq1, a_gr2);
    and and12 ( a_g2, a_eq0, a_eq1, a_eq2, a_gr3);
        
    or or2( a_is_greater, a_gr0, a_g0 , a_g1, a_g2);
    
    
    //a_is_smaller = [15:12] smaller or 
    //  ([15:12] equal and [11:8] smaller) or 
    //  ([15:12] equal and [11:8] equal and [7:4] smaller) or 
    //  ([15:12] equal and [11:8] equal and [7:4] equal and [3:0] smaller)
    and and13 ( a_s0, a_eq0, a_sm1);
    and and14 ( a_s1, a_eq0, a_eq1, a_sm2);
    and and15 ( a_s2, a_eq0, a_eq1, a_eq2, a_sm3);
    
    or or3( a_is_smaller, a_sm0, a_s0 , a_s1, a_s2);
    
    
endmodule





















