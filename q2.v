`timescale 1ns / 1ps

module q2(x, y, z);
    input x, y;
    output z;
    wire w1, w2;
    wire x_n, y_n;
    
    not #2 n1(x_n, x);
    not #2 n2(y_n, y);
    
    and #5 a1(w1, x, y_n);
    and #5 a2(w2, y, x_n);
    
    or #7 o1(z, w1, w2);
   
endmodule



