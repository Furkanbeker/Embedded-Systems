`timescale 1ns / 1ps

module q1_a_behavioral(A, B, C, D, F);
    input wire A, B, C, D;
    output reg F;
    
    always@(*) begin
    
    F = (((C & D) | B) & A) | (B & ~C);
    
    end
    
endmodule

