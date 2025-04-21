module lab2_part2(fr_SW, to_LEDR, to_HEX0, to_HEX1, to_HEX2, to_HEX3); 
    input [9:0] fr_SW;
    output [9:0] to_LEDR;  
    output [7:0] to_HEX0;  
    output [7:0] to_HEX1; 
    output [7:0] to_HEX2; 
    output [7:0] to_HEX3; 
    wire [1:0] Z0, Z1, Z2, Z3;

    assign to_LEDR = fr_SW;

    mux41_2b M0(.S(fr_SW[9:8]), .A(fr_SW[1:0]), .B(fr_SW[7:6]), .C(fr_SW[5:4]), .D(fr_SW[3:2]), .Z(Z0));

    mux41_2b M1(.S(fr_SW[9:8]), .A(fr_SW[3:2]), .B(fr_SW[1:0]), .C(fr_SW[7:6]), .D(fr_SW[5:4]), .Z(Z1));

    mux41_2b M2(.S(fr_SW[9:8]), .A(fr_SW[5:4]), .B(fr_SW[3:2]), .C(fr_SW[1:0]), .D(fr_SW[7:6]), .Z(Z2));

    mux41_2b M3(.S(fr_SW[9:8]), .A(fr_SW[7:6]), .B(fr_SW[5:4]), .C(fr_SW[3:2]), .D(fr_SW[1:0]), .Z(Z3));

    char_7seg H0 (.C(Z0), .Display(to_HEX0)); 
    char_7seg H1 (.C(Z1), .Display(to_HEX1)); 
    char_7seg H2 (.C(Z2), .Display(to_HEX2)); 
    char_7seg H3 (.C(Z3), .Display(to_HEX3)); 
endmodule


module mux41_2b (S, A, B, C, D, Z); 
	input [1:0] S, A, B, C, D; 
	output [1:0] Z; 
		
	assign Z =  (S == 2'b00) ? A: 
					(S == 2'b01) ? B:
					(S == 2'b10) ? C:
					D;
endmodule 


	 
module char_7seg (Display, C);
	output reg [7:0] Display;
	input [1:0] C;


	parameter BLANK = 8'b1111_1111;  
	parameter ZERO = 8'b1100_0000;  
	parameter ONE = 8'b1111_1001;    
	parameter char_d = 8'b1010_0001;
	parameter char_E = 8'b1000_0110;

	always @ (C) begin
		 Display = BLANK;
			case (C)
				 2'd0:  Display = char_d;
				 2'd1:  Display = char_E;
				 2'd2:  Display = ONE;
				 2'd3:  Display = ZERO;
				 default:  Display = BLANK;
			 endcase
		end
endmodule
