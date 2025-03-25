`timescale 1ns / 1ps

    module tb_q2();
    reg x,y;
    wire z;
    
    q2 u(x,y,z);
    
    initial begin
        x = 0; y = 0;
        #10 x = 0; y = 1;
        #20 x = 1; y = 1;
        #20 x = 1; y = 0;
        #20 x = 0; y = 0;
        #20 $finish;
    end
       
    initial begin
        $monitor ( "%t ns , (%b, %b, %b)", $time, x, y, z );
    end
endmodule



