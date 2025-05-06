

module lab5_part3(fr_SW, to_LEDR, to_HEX0, fr_KEY, CK50M);
    input [9:0] fr_SW;
    output [9:0] to_LEDR;
    input [1:0] fr_KEY;
    input CK50M;
    output [7:0] to_HEX0;

    wire [15:0] count_stage1;
    wire [9:0] count_stage2;
    wire [3:0] count_stage3;
    wire enable_stage2;
    wire enable_stage3;

    assign to_LEDR[1:0] = fr_SW[1:0];
    assign to_LEDR[9:2] = 0;

	 counter_param #(16, 16'd65535) stage1 (.clk(CK50M), .clr(fr_SW[0]), .enable(fr_SW[1]), .count(count_stage1), .enable_out(enable_stage2));

	 counter_param #(10, 10'd1023)  stage2 (.clk(CK50M), .clr(fr_SW[0]), .enable(enable_stage2), .count(count_stage2), .enable_out(enable_stage3));

    counter_mod10 c3 (.clk(CK50M), .clr(fr_SW[0]), .enable(enable_stage3), .count(count_stage3));

    char_7seg display (.BCD(count_stage3), .Display(to_HEX0));
	 
endmodule



module counter_param(clk, clr, enable, count, enable_out);
    parameter BIT = 8;
    parameter MAX = 255;

    input clk;
    input clr;
    input enable;
    output reg [BIT-1:0] count;
    output reg enable_out;

    reg [BIT-1:0] next_count;
    reg next_enable;

    always @(posedge clk or negedge clr) begin
        if (!clr) begin
            count <= 0;
            enable_out <= 0;
        end else begin
            count <= next_count;
            enable_out <= next_enable;
        end
    end

    always @(*) begin
        next_count = count;
        next_enable = 0;

        if (enable) begin
            if (count == MAX) begin
                next_count = 0;
                next_enable = 1;
            end else begin
                next_count = count + 1;
            end
        end
    end
endmodule



module counter_mod10(clk, clr, enable, count);
    input clk;
    input clr;
    input enable;
    output reg [3:0] count;

    always @(posedge clk or negedge clr) begin
        if (!clr)
            count <= 0;
        else if (enable) begin
            if (count == 4'd9)
                count <= 0;
            else
                count <= count + 1;
        end
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


