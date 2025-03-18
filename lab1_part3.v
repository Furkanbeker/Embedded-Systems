


module lab1_part3(input [9:0] fr_SW, output[9:0] to_LEDR);
	
	assign to_LEDR[7:2] = 0;
	assign to_LEDR[9] = fr_SW[9];
	assign to_LEDR[8] = fr_SW[8];
		
	mux u1(.a(fr_SW[1:0]), .b(fr_SW[3:2]), .c(fr_SW[5:4]), .d(fr_SW[7:6]), .s(fr_SW[9:8]), .z(to_LEDR[1:0]));
	
endmodule



module mux(a,b,c,d,s,z);
	input [1:0] a,b,c,d;
	input [1:0] s;
	output [1:0] z;
	
	
	assign z =  (s == 2'b00) ? a: 
					(s == 2'b01) ? b:
					(s == 2'b10) ? c:
					d;
	
endmodule
