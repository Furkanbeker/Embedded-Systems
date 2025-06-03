


module lab7_part1 (fr_SW, fr_KEY, to_LEDR);
    input [1:0] fr_SW;
    input [0:0] fr_KEY;
    output [9:0] to_LEDR;

    wire clk, rst, w, z;

    reg [8:0] y_d;
    wire [8:0] y_q;

    assign clk = fr_KEY[0];
    assign rst = fr_SW[0];
    assign w = fr_SW[1];

    assign to_LEDR[8:0] = y_q;
    assign to_LEDR[9] = z;
    assign z = y_q[4] | y_q[8];

    assign y_d[0] = (!rst) ? 1'b1 : 1'b0;
    assign y_d[1] = (y_q[0]| y_q[5] | y_q[6]| y_q[7] | y_q[8]) & ~w;
    assign y_d[2] = y_q[1] & ~w;
    assign y_d[3] = y_q[2] & ~w;
    assign y_d[4] = (y_q[3] | y_q[4]) & ~w;
    assign y_d[5] = (y_q[0] | y_q[1] | y_q[2] | y_q[3] | y_q[4]) & w;
    assign y_d[6] = y_q[5] & w;
    assign y_d[7] = y_q[6] & w;
    assign y_d[8] = (y_q[7] | y_q[8]) & w;

    always @(posedge clk) begin
        if (!rst)
            y_q <= 9'b000000001;
        else
            y_q <= y_d;
    end

endmodule
