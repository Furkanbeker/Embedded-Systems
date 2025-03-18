
module lab1_part2(input [9:0] fr_SW, output[9:0] to_LEDR);
	
	assign to_LEDR[8:4] = 0;
	assign to_LEDR[9] = fr_SW[9];
		
	mux u1(.a(fr_SW[3:0]), .b(fr_SW[7:4]), .s(fr_SW[9]), .z(to_LEDR[3:0]));
	
endmodule



module mux(a,b,s,z);
	input [3:0] a;
	input [3:0] b; 
	input s;
	output [3:0] z;
	
	assign z[0] = (~s & a[0]) | (s & b[0]); 
	assign z[1] = (~s & a[1]) | (s & b[1]);
	assign z[2] = (~s & a[2]) | (s & b[2]);
	assign z[3] = (~s & a[3]) | (s & b[3]);
	
	//assign z[0] = (~s) ? a [0]: b[0];
	//assign z[1] = (~s) ? a [1]: b[1];
	//assign z[2] = (~s) ? a [2]: b[2];
	//assign z[3] = (~s) ? a [3]: b[3];	
	
endmodule


