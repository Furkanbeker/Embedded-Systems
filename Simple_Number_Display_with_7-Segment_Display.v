


module lab3_part1(to_HEX0, to_HEX1, fr_SW, to_LEDR);
    input [7:0] fr_SW;
    output [7:0] to_HEX0;  
    output [7:0] to_HEX1; 
	 output [9:0] to_LEDR;
	 
	 
	 assign to_LEDR [7:0]  = fr_SW[7:0];
	 assign to_LEDR [9:8] = 0;
	 
	

    char_7seg H0 (.BCD(fr_SW[3:0]), .Display(to_HEX0)); 
    char_7seg H1 (.BCD(fr_SW[7:4]), .Display(to_HEX1)); 

endmodule




module char_7seg (Display, BCD);
	output reg [7:0] Display;
	input [3:0] BCD;


    parameter BLANK = 8'b1111_1111;  
    parameter ZERO = 8'b1100_0000;  
    parameter ONE = 8'b1111_1001;  
    parameter TWO = 8'b1010_0100;   
    parameter THREE = 8'b1011_0000; 
    parameter FOUR = 8'b1001_1001; 
    parameter FIVE = 8'b1001_0010;
    parameter SIX = 8'b1000_0010;
    parameter SEVEN = 8'b1111_1000;
    parameter EIGHT = 8'b1000_0000;
    parameter NINE = 8'b1001_1000;


always @ (BCD) begin
    Display = BLANK;
      case (BCD)
			4'd0:  Display = ZERO;
			4'd1:  Display = ONE;
			4'd2:  Display = TWO;
			4'd3:  Display = THREE;
			4'd4:  Display = FOUR;
			4'd5:  Display = FIVE;
			4'd6:  Display = SIX;
			4'd7:  Display = SEVEN;
			4'd8:  Display = EIGHT;
			4'd9:  Display = NINE;
			default:  Display = BLANK;
       endcase
	end
endmodule



