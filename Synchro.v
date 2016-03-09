`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:47:41 03/01/2016 
// Design Name: 
// Module Name:    Synchro 
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
module Synchro(dato,clk,ds);
input wire dato,clk;
output wire ds;

wire c1,c2,c3,c4,c5;

FFD FF1(
    .dato(dato), 
    .clk(clk), 
    .q(c1)
    );
FFD FF2(
    .dato(c1), 
    .clk(clk), 
    .q(c2)
    );
FFD FF3(
    .dato(c2), 
    .clk(clk), 
    .q(c3)
    );

FFD FF4(
    .dato(c3), 
    .clk(clk), 
    .q(c4)
    );
	 
FFD FF5(
    .dato(c4), 
    .clk(clk), 
    .q(c5)
    );
	 

assign ds = c1 && c2 && c3 && c4 && c5; 

endmodule
