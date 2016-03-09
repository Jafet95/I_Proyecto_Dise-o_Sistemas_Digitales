`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Yermy Benavides
// 
// Create Date:    21:08:09 02/29/2016 
// Design Name: 
// Module Name:    MDF 
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
module MDF(clk,rst,entrada,salida,salida_1kHz,q);
input wire clk,rst;
input wire [2:0]entrada;
output wire salida;
output wire salida_1kHz;
output wire [6:0]q; // Valor de division
	  
Traductor Conv(
    .in(entrada), 
    .out(q), 
    .clk(clk), 
    .rst(rst)
    );
	 
DivFrec DF(
    .clk(clk), 
    .rst(rst), 
    .div(q), 
    .clkd(salida),
	 .clk_1kHz(salida_1kHz)
    );	 
	 

endmodule
