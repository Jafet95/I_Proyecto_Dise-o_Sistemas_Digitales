`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:58 02/21/2016 
// Design Name: 
// Module Name:    Demux 
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
module Demux (out,in,sel);

parameter nO = 2;
parameter nS = 1;

output[nO-1:0] out; //demux out
input in; //demux input 
input[nS-1:0] sel; //demux select signal

assign out = in << sel; //shift left in tantas sel veces

endmodule
