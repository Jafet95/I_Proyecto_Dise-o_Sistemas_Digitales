`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jafet Chaves Barrantes
// 
// Create Date:    18:53:02 03/02/2016 
// Design Name: 
// Module Name:    Distribucion_Salida 
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
module Distribucion_Salida
(	 
	 input wire In_signal_conmutacion,
	 input wire select_salida,
	 output wire [1:0] Out_signal_conmutacion 
);

Demux Instancia_Demux(
.out(Out_signal_conmutacion),
.in(In_signal_conmutacion),
.sel(select_salida));

endmodule