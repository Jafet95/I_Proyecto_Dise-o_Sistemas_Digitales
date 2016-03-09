`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jafet Chaves Barrantes
// 
// Create Date:    17:39:32 03/02/2016 
// Design Name: 
// Module Name:    Modificacion_Frec_Conmu 
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
module Modificacion_Frec_Conmu
	(
	input wire CLK_100MHz,
	input wire aumentar_Frec,
	input wire disminuir_Frec,
	input wire funct_select,
	input wire reset,
	output wire CLK_dividido,
	output wire CLK_1kHz,
	output wire [2:0] OutContadorAD_InMDF //Conexiones entre contador y bloque MDF (traductor y divisor de clock), también para la FSM
    );

wire OutRegistroAumentar_InContadorADAumentar; //Conexiones entre registro y contador A/D
wire OutRegistroDisminuir_InContadorADDisminuir;

Registro_Universal Instancia_Registro_Universal(
.aumentar(aumentar_Frec), //boton aumentar
.disminuir(disminuir_Frec), //boton disminuir
.clk(CLK_100MHz), //system clock
.reset(reset), //system reset
.chip_select(~funct_select), //Control data (funct_select)
.out_aumentar(OutRegistroAumentar_InContadorADAumentar), //boton aumentar
.out_disminuir(OutRegistroDisminuir_InContadorADDisminuir) //boton disminuir    
);
 
Contador_AD_Frecuencia Instancia_Contador_AD_Frecuencia(
.clk(CLK_100MHz),
.reset(reset),
.enUP(OutRegistroAumentar_InContadorADAumentar),
.enDOWN(OutRegistroDisminuir_InContadorADDisminuir),
.q(OutContadorAD_InMDF)
);

MDF Instancia_MDF(
.clk(CLK_100MHz),
.rst(reset),
.entrada(OutContadorAD_InMDF),
.salida(CLK_dividido),
.salida_1kHz(CLK_1kHz),
.q()
);

endmodule
