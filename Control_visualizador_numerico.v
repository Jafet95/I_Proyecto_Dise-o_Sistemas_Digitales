`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:03 03/02/2016 
// Design Name: 
// Module Name:    Control_visualizador_numerico 
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
module Control_visualizador_numerico
(
input wire [2:0] cuenta_frec,
input wire [3:0] cuenta_CT,
input wire clock,
input wire reset,
input wire funct_select,
output wire [7:0] code_digitos_decimal, //secuencia para mostrar el digito correcto
output wire [3:0] code_7seg //secuencia para encender el 7 segmentos correcto
);

wire [3:0] OutFSM_InConversorBCD; //Conexion entre la maquina de estados y el conversor BCD a 7 segmentos

FSM Instancia_FSM
(
.clk(clock),
.rst(reset), 
.Funct_Select(funct_select),
.Count_CT(cuenta_CT),
.Count_F(cuenta_frec),
.C_Digit(OutFSM_InConversorBCD), 
.C_7Seg(code_7seg)  
); 

Conversor_BCD_7seg Instancia_Conversor_BCD_7seg
(
.Valor_Decimal(OutFSM_InConversorBCD),
.Code_7seg(code_digitos_decimal)   
);

endmodule
