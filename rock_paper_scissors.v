`timescale 1ns / 1ps


module rock_paper_scissors(output win, player, input [1:0] p0guess, p1guess);

//rock = 00 , paper = 01, scissors = 10

assign win = !(p0guess == p1guess);

assign player =((p1guess  == 2'b00)&&(p0guess == 2'b10)) | (( p1guess == 2'b01)&&(p0guess == 2'b00)) | ((p1guess == 2'b10) &&(p0guess == 2'b01));


endmodule


















