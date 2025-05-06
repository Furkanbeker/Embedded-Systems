
module lab5_part1(fr_SW, to_LEDR, to_HEX0, to_HEX1, fr_KEY);
	input [9:0] fr_SW;
	output [9:0] to_LEDR;
	input [1:0] fr_KEY;
	output [7:0] to_HEX0,to_HEX1;
	
	wire [7:0] count_out;

	assign to_LEDR [1:0]  = fr_SW[1:0];
	assign to_LEDR [9:2] = 0;

	counter c0 (.enable(fr_SW[1]), .clk(fr_KEY[0]), .clr(fr_SW[0]), .out(count_out));

	char_7seg s0(.BCD(count_out[3:0]), .Display(to_HEX0));

   char_7seg s1(.BCD(count_out[7:4]), .Display(to_HEX1));


endmodule




module counter(enable, clk, clr, out);
	input wire enable;
	input clk;
	input clr;
	output wire [7:0] out;

	wire [7:0] q;
	wire [7:0] t;

	assign t[0] = enable;

	and a1(t[1], q[0], t[0]);
	and a2(t[2], q[1], t[1]);
	and a3(t[3], q[2], t[2]);
	and a4(t[4], q[3], t[3]);
	and a5(t[5], q[4], t[4]);
	and a6(t[6], q[5], t[5]);
	and a7(t[7], q[6], t[6]);
	
	
	t_ff t0(.t(t[0]), .clk(clk), .clr(clr), .q(q[0]));
	t_ff t1(.t(t[1]), .clk(clk), .clr(clr), .q(q[1]));
	t_ff t2(.t(t[2]), .clk(clk), .clr(clr), .q(q[2]));
	t_ff t3(.t(t[3]), .clk(clk), .clr(clr), .q(q[3]));
	t_ff t4(.t(t[4]), .clk(clk), .clr(clr), .q(q[4]));
	t_ff t5(.t(t[5]), .clk(clk), .clr(clr), .q(q[5]));
	t_ff t6(.t(t[6]), .clk(clk), .clr(clr), .q(q[6]));
	t_ff t7(.t(t[7]), .clk(clk), .clr(clr), .q(q[7]));

	assign out = q; 

endmodule




module t_ff(clk, clr, t, q);
    input clk;
    input clr;
    input t;
    output reg q;

    reg q_next;

    always @(posedge clk or negedge clr) begin
        if (!clr)
            q <= 1'b0;
        else
            q <= q_next;
    end

    always @(*) begin
        q_next = q; 

        if (t)
            q_next = ~q; 
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

