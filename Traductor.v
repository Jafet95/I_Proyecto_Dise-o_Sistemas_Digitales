`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Yermy Benvaides
// 
// Create Date:    20:33:46 02/29/2016 
// Design Name: 
// Module Name:    Traductor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Traductor(in,out,clk,rst);
input wire clk,rst;
input wire [2:0]in;
output reg [6:0]out;


always@(posedge clk, posedge rst)
	if (rst)
		begin
		out <= 7'd0;
		end
	else
		case(in)
			4'b0000: out <= 7'd104; //30k
			4'b0001: out <= 7'd62;  //50k
			4'b0010: out <= 7'd41;  //75k
			4'b0011: out <= 7'd31;  //100k
			4'b0100: out <= 7'd25;  //125k
			4'b0101: out <= 7'd21;  //150k
			4'b0110: out <= 7'd18;  //175k
			4'b0111: out <= 7'd15;  //200k
			default out <= 7'd0;    
		endcase
endmodule
