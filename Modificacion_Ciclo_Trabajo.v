`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:57 03/03/2016 
// Design Name: 
// Module Name:    Modificacion_Ciclo_Trabajo 
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
module Modificacion_Ciclo_Trabajo(
	input wire clk_100MHz,
	input wire clk_de_trabajo,
	input wire rst,
	input wire up,
	input wire down,
	input wire chip_select, //Tanto para seleccionar el registro como para habilitar el contador universal
	output wire signal_out,
	output wire [3:0]ciclo_actual	
	
    );
	 
wire [3:0] ref; //Referencia que entra al comparador a partir del contador A/D
wire out_aumentar,out_disminuir;//Salida del registro al contador A/D
//wire [3:0]out_contador_AD;

	 
Comp_16bits Instancia_Comparador 
(
.in(ciclo_actual), 
.out(signal_out), 
.rst(rst), 
.ref(ref), 
.clk(clk_de_trabajo)
);
 
Registro_Universal Instancia_Reg_universal 
(
.aumentar(up), 
.disminuir(down), 
.clk(clk_100MHz), 
.reset(rst), 
.chip_select(chip_select), 
.out_aumentar(out_aumentar), 
.out_disminuir(out_disminuir)
);

  
Contador_Ascendente_Descendente Instancia_Contador_Ascendente_Descendente
(
.clk(clk_100MHz),
.reset(rst),
.enUP(out_aumentar),
.enDOWN(out_disminuir),
.q(ciclo_actual)
);
	 
Contador_conReset Instancia_Contador_conReset
(
.clk(clk_de_trabajo),
.reset(rst),
.q(ref)
 );
 
endmodule
