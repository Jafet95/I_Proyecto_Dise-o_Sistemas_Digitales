`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:49:15 03/01/2016 
// Design Name: 
// Module Name:    FF-D 
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
module FFD(dato,clk,q);
input dato, clk; 
output reg q;

always @ ( posedge clk)
begin
  q <= dato;
end
endmodule
