
module lab2part1(fr_SW, to_LEDR, to_HEX0);
	input [9:0] fr_SW;
	output [9:0] to_LEDR;
	output [7:0] to_HEX0;
	wire c0, c1;
	
	
	assign to_LEDR [9:0]  = fr_SW[9:0];
	
	
	displayy uut( .Display(to_HEX0), .BCD(fr_SW[1:0]));

	
endmodule 


	 
module displayy (Display, BCD);
	output reg [7:0] Display;
	input [1:0] BCD;


parameter BLANK = 8'b1111_1111;  
parameter ZERO = 8'b1100_0000;  
parameter ONE = 8'b1111_1001;    
parameter d = 8'b1010_0001;
parameter E = 8'b1000_0110;


always @ (BCD) begin
    Display = BLANK;
      case (BCD)
          2'd0:  Display = d;
          2'd1:  Display = E;
          2'd2:  Display = ONE;
          2'd3:  Display = ZERO;
          default:  Display = BLANK;
       endcase
	end
endmodule
