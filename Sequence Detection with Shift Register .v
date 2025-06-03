

module lab7_part3 (fr_SW, fr_KEY, to_LEDR);
    input [1:0] fr_SW;       
    input [0:0] fr_KEY;      
    output [9:0] to_LEDR;

    wire clk, rst, w, z, detect_zeros, detect_ones; 

	 reg [3:0] shift_zeros, shift_ones;
	 
	 assign clk = fr_KEY[0];
	 
	 assign rst = fr_SW[0];
	 
	 assign w = fr_SW[1];	
	 
	 assign detect_zeros = (shift_zeros == 4'b0000);
	 
	 assign detect_ones  = (shift_ones == 4'b1111);
	 
    assign z = detect_zeros | detect_ones;

    always @(posedge clk) begin
        if (!rst) begin
            shift_zeros <= 4'b0000;
            shift_ones <= 4'b0000;
        end else begin
            shift_zeros <= {shift_zeros[2:0], ~w};  
            shift_ones  <= {shift_ones[2:0],  w};   
        end
    end

    assign to_LEDR[3:0] = shift_ones;
    assign to_LEDR[7:4] = shift_zeros;
    assign to_LEDR[9] = z;
    assign to_LEDR[8] = 0;

endmodule
