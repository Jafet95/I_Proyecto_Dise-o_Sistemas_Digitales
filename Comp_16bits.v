`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Yermy Benavides
// 
// Create Date:    11:46:16 02/23/2016 
// Design Name: 
// Module Name:    Comp_16bits 
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
module Comp_16bits(in,out,rst,ref,clk);
input wire [3:0] in, ref;
input wire rst,clk;
output reg out;
 
always@(posedge clk,posedge rst)
if (rst) out = 1'b0;
else if (in >= ref) out = 1'b1;
else out = 1'b0;
endmodule
