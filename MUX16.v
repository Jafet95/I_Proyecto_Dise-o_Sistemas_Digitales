`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:32 11/03/2015 
// Design Name: 
// Module Name:    MUX16 
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
module MUX16(Seleccion,Dn,Y);

input [3:0] Seleccion;
input [15:0] Dn;
output Y;

wire [3:0] Seleccion;
wire [15:0] Dn;
wire Y;

assign Y = Dn[Seleccion];


endmodule
