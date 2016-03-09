`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: I.T.C.R
// Engineer: Jafet Chaves Barrantes
// 
// Create Date:    17:20:57 02/28/2016 
// Design Name: 
// Module Name:    Mux_2x1 
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
module Mux_2x1(Seleccion,D1,D0,Y);

input wire Seleccion;
input wire [3:0] D1;
input wire [2:0] D0;
output reg [3:0] Y;

always @* 

begin

case(Seleccion)

1'b0: Y <= D0;
1'b1: Y <= D1;

endcase 

end

endmodule
