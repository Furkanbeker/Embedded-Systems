
module lab7_part2 (fr_SW, fr_KEY, to_LEDR);
    input [1:0] fr_SW;
    input [0:0] fr_KEY;
    output [9:0] to_LEDR;

    wire clk;
    wire rst;
    wire w;
	 reg [3:0] y_Q, Y_D;
	
	 assign clk = fr_KEY[0];
	 assign rst = fr_SW[0];
	 assign w = fr_SW[1];
	 
	 
    parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, 
				  F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;

    always @(w, y_Q) begin
        case (y_Q)
            A: Y_D = (w == 0) ? B : F;
            B: Y_D = (w == 0) ? C : F;
            C: Y_D = (w == 0) ? D : F;
            D: Y_D = (w == 0) ? E : F;
            E: Y_D = (w == 0) ? E : F;
            F: Y_D = (w == 1) ? G : B;
            G: Y_D = (w == 1) ? H : B;
            H: Y_D = (w == 1) ? I : B;
            I: Y_D = (w == 1) ? I : B;
            default: Y_D = A;
        endcase
    end

    always @(posedge clk) begin
        if (!rst)
            y_Q <= A;
        else
            y_Q <= Y_D;
    end

    assign to_LEDR[3:0] = y_Q;
    assign to_LEDR[9] = (y_Q == E) | (y_Q == I);
    assign to_LEDR[8:4] = 5'b00000;

endmodule





