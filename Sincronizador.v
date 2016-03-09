`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:10 03/01/2016 
// Design Name: 
// Module Name:    Sincronizador 
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
module Sincronizador(incambiarfuncion,incambiarsalida,inrst,inbtup,inbtdown,outcambiarfuncion,outcambiarsalida,outrst,outbtup,outbtdown,clk);
input wire incambiarfuncion,incambiarsalida,inrst,inbtup,inbtdown,clk;
output wire outcambiarfuncion,outcambiarsalida,outbtup,outbtdown,outrst;

Synchro S1 (
    .dato(incambiarfuncion), 
    .clk(clk), 
    .ds(outcambiarfuncion)
    );
	 
Synchro S2 (
    .dato(incambiarsalida), 
    .clk(clk), 
    .ds(outcambiarsalida)
    );
Synchro S3 (
    .dato(inrst), 
    .clk(clk), 
    .ds(outrst) 
    );
Synchro S4 (
    .dato(inbtup), 
    .clk(clk), 
    .ds(outbtup)
    );
Synchro S5 (
    .dato(inbtdown), 
    .clk(clk), 
    .ds(outbtdown)
    );

endmodule
