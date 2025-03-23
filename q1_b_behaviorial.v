`timescale 1ns / 1ps

module q1_b_behaviorial(A, B, C, D, F );
    input wire A, B, C, D;
    output reg F;
    
    always@(*) begin
    
    F = ((A & ~B) | (~A & B)) & ( C | ~C);
    
    end
endmodule


