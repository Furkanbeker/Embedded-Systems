
module lab5_part2(fr_SW, to_LEDR, to_HEX0, to_HEX1, fr_KEY);
	input [9:0] fr_SW;
	output [9:0] to_LEDR;
	input [1:0] fr_KEY;
	output [7:0] to_HEX0,to_HEX1;
	
	wire [7:0] count_out;

	assign to_LEDR [1:0]  = fr_SW[1:0];
	assign to_LEDR [9:2] = 0;

	counter_param c0 ( .clk(fr_KEY[0]), .enable (fr_SW[1]), .clr(fr_SW[0]), .count(count_out));

	char_7seg s0(.BCD(count_out[3:0]), .Display(to_HEX0));

   char_7seg s1(.BCD(count_out[7:4]), .Display(to_HEX1));


endmodule



module counter_param #(parameter BIT = 8)(clk, clr, enable, count);
    input clk;
    input clr;
    input enable;
	 output reg [BIT-1:0] count;
	 
	 reg [BIT-1:0] count_next; 
	
    always @(posedge clk or negedge clr) begin
        if (!clr)
            count <= 0;
        else if (enable)
            count <= count_next;
    end
	 
	 always @(*) begin
	 	  count_next = count;
		
		  if (enable) 
			  count_next = count +1;
	 end
 
endmodule





module char_7seg(Display, BCD);

    output reg [7:0] Display;
    input [3:0] BCD;

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
    parameter A     = 8'b10001000;
    parameter B     = 8'b10000011;
    parameter C     = 8'b11000110;
    parameter D     = 8'b10100001;
    parameter E     = 8'b10000110;
    parameter F     = 8'b10001110;

    always @(BCD) begin
        case (BCD)
            4'd0: Display = ZERO;
            4'd1: Display = ONE;
            4'd2: Display = TWO;
            4'd3: Display = THREE;
            4'd4: Display = FOUR;
            4'd5: Display = FIVE;
            4'd6: Display = SIX;
            4'd7: Display = SEVEN;
            4'd8: Display = EIGHT;
            4'd9: Display = NINE;
            4'd10: Display = A;
            4'd11: Display = B;
            4'd12: Display = C;
            4'd13: Display = D;
            4'd14: Display = E;
            4'd15: Display = F;
            default: Display = BLANK;
        endcase
    end

endmodule

