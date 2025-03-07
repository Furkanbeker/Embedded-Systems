`timescale 1ns/1ns

module tb_cmp_4b_str;
    reg [3:0] a, b; 
    reg [3:0] i = 0;
    reg [3:0] j = 0;
    wire a_is_equal, a_is_greater, a_is_smaller; 
//  reg [7:0] x = 0;  
  
//    always @(*) begin
//        a = x[3:0];
//        b = x[7:4];
//    end

//    initial begin
//        for (x = 0; x < 256; x = x + 1) begin
//            #2; 

    cmp_4b_str UUT(.a_is_equal(a_is_equal), .a_is_greater(a_is_greater), .a_is_smaller(a_is_smaller),.a(a), .b(b));

      initial begin
      for (i = 0; i < 4'b1111; i = i + 1) begin
            for (j = 0; j < 4'b1111; j = j + 1) begin
            a = i;
            b = j;
            #2; 
            $display("%t ns - (%d %d -- %b %b %b)", $time, a, b, a_is_equal, a_is_greater, a_is_smaller);
            end
        end
        $stop;
    end
endmodule
