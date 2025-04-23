

module lab3_part2(to_HEX0, to_HEX1, fr_SW, to_LEDR);
      input [3:0] fr_SW;
      output [7:0] to_HEX0;  
      output [7:0] to_HEX1;
		output [9:0] to_LEDR;
 
	   wire z;
      wire [3:0] A;
      wire [3:0] MUX_OUT;
      wire [7:0] seg0, seg1;

		assign to_LEDR [3:0]  = fr_SW[3:0];
		assign to_LEDR [9:4]  = 0;
		
		
		comparator a0(.v(fr_SW), .z(z));
		
		circuit_a a1(.v(fr_SW), .A(A));
		
		mux2to1_4bit a2(.sel(z), .in0(fr_SW), .in1(A), .out(MUX_OUT));

		char_7seg a3(.BCD(MUX_OUT), .SEG(to_HEX0));
		
		char_7seg a4(.BCD({3'b000, z}), .SEG(to_HEX1));
	 
endmodule


module comparator (v, z);
	 input [3:0] v; 
	 output z;
	 
    assign z = (v > 4'd9) ? 1'b1 : 1'b0;
	 
endmodule



module circuit_a(v, A);
	 input [3:0] v;
	 output reg [3:0] A;
	 
    always @(v) begin
        case (v)
            4'd10: A = 4'd0;
            4'd11: A = 4'd1;
            4'd12: A = 4'd2;
            4'd13: A = 4'd3;
            4'd14: A = 4'd4;
            4'd15: A = 4'd5;
            default: A = 4'd0;
        endcase
    end
	 
endmodule



module mux2to1_4bit(sel, in0, in1, out);
	 input sel;
	 input [3:0] in0; 
	 input [3:0] in1; 
	 output [3:0] out;
	 
    assign out = (sel == 0) ? in0 : in1;
	 
endmodule



module char_7seg(BCD, SEG);
	 input [3:0] BCD;
	 output reg [7:0] SEG;
	 
    parameter BLANK = 8'b11111111;  
    parameter ZERO  = 8'b11000000;  
    parameter ONE   = 8'b11111001;  
    parameter TWO   = 8'b10100100;   
    parameter THREE = 8'b10110000; 
    parameter FOUR  = 8'b10011001; 
    parameter FIVE  = 8'b10010010;
    parameter SIX   = 8'b10000010;
    parameter SEVEN = 8'b11111000;
    parameter EIGHT = 8'b10000000;
    parameter NINE  = 8'b10010000;

    always @(BCD) begin
        case (BCD)
            4'd0: SEG = ZERO;
            4'd1: SEG = ONE;
            4'd2: SEG = TWO;
            4'd3: SEG = THREE;
            4'd4: SEG = FOUR;
            4'd5: SEG = FIVE;
            4'd6: SEG = SIX;
            4'd7: SEG = SEVEN;
            4'd8: SEG = EIGHT;
            4'd9: SEG = NINE;
            default: SEG = BLANK;
        endcase
    end
endmodule

