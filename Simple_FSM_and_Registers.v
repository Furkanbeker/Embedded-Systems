
module lab4(SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR);

    input [7:0] SW;
    input [1:0] KEY;
    output reg [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    output reg [9:0] LEDR;

    reg [7:0] A, A_next;
    reg [7:0] B, B_next;
    reg [8:0] S, S_next;
    reg [1:0] state, state_next;

    wire [7:0] HEX0_w, HEX1_w, HEX2_w, HEX3_w, HEX4_w, HEX5_w;

    always @(posedge KEY[1] or negedge KEY[0]) begin
        if (!KEY[0]) begin
            A <= 8'd0;
            B <= 8'd0;
            S <= 9'd0;
            state <= 2'd0;
        end else begin
            A <= A_next;
            B <= B_next;
            S <= S_next;
            state <= state_next;
        end
    end

    always @(*) begin
        A_next = A;
        B_next = B;
        S_next = S;
        state_next = state;

        case (state)
            2'd0: begin
                A_next = SW;
                state_next = 2'd1;
            end
            2'd1: begin
                B_next = SW;
                state_next = 2'd2;
            end
            2'd2: begin
                S_next = A + B;
                state_next = 2'd0;
            end
            default: begin
                state_next = 2'd0;
            end
        endcase
    end

    always @(*) begin
        LEDR[7:0] = SW;
        LEDR[8] = 1'b0;
        LEDR[9] = S[8];

        HEX0 = HEX0_w;
        HEX1 = HEX1_w;
        HEX2 = HEX2_w;
        HEX3 = HEX3_w;
        HEX4 = HEX4_w;
        HEX5 = HEX5_w;
    end

    char_7seg d0 (.Display(HEX0_w), .BCD(B[3:0]));
    char_7seg d1 (.Display(HEX1_w), .BCD(B[7:4]));
    char_7seg d2 (.Display(HEX2_w), .BCD(A[3:0]));
    char_7seg d3 (.Display(HEX3_w), .BCD(A[7:4]));
    char_7seg d4 (.Display(HEX4_w), .BCD(S[3:0]));
    char_7seg d5 (.Display(HEX5_w), .BCD(S[7:4]));

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


