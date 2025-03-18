module Lab1Part1(fr_SW, to_LEDR);
	input [9:0] fr_SW; // slide switches 
	output [9:0] to_LEDR; // red LEDs 

	assign to_LEDR= fr_SW; 


endmodule