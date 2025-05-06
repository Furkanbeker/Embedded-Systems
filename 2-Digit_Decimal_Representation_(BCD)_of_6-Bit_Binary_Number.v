

module lab3_part3(fr_SW, to_LEDR, to_HEX0, to_HEX1);
	 input [5:0] fr_SW;
	 output [9:0] to_LEDR;
	 output [7:0] to_HEX0;
	 output [7:0] to_HEX1;

    reg [3:0] d0;
    reg [3:0] d1;
	 
	 assign to_LEDR [5:0] = fr_SW [5:0];
	 assign to_LEDR [9:6] = 0;

    always @(fr_SW) begin
	 
        if (fr_SW < 10) begin
            d1 = 0; d0 = fr_SW;
		  end 
				
		  else if (fr_SW < 20) begin
            d1 = 1; d0 = fr_SW - 10;
        end 
		  
		  else if (fr_SW < 30) begin
            d1 = 2; d0 = fr_SW - 20;
        end 
		  
		  else if (fr_SW < 40) begin
            d1 = 3; d0 = fr_SW - 30;
        end 
		  
		  else if (fr_SW < 50) begin
            d1 = 4; d0 = fr_SW - 40;
        end 
		  
		  else if (fr_SW < 60) begin
            d1 = 5; d0 = fr_SW - 50;
        end 
		  
		  else begin
            d1 = 6; d0 = fr_SW - 60;
        end
		  
    end

    char_7seg o0 (.BCD(d0), .SEG(to_HEX0));
    char_7seg o1 (.BCD(d1), .SEG(to_HEX1));
	 
endmodule


module char_7seg(BCD, SEG);
	 input [3:0] BCD;
	 output reg [7:0] SEG;
	 
	 
    always @(BCD) begin
        case (BCD)
            4'd0: SEG = 8'b11000000;
            4'd1: SEG = 8'b11111001;
            4'd2: SEG = 8'b10100100;
            4'd3: SEG = 8'b10110000;
            4'd4: SEG = 8'b10011001;
            4'd5: SEG = 8'b10010010;
            4'd6: SEG = 8'b10000010;
            4'd7: SEG = 8'b11111000;
            4'd8: SEG = 8'b10000000;
            4'd9: SEG = 8'b10010000;
            default: SEG = 8'b11111111; // blank
        endcase
    end
endmodule

