`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:41 03/01/2016 
// Design Name: 
// Module Name:    Registro_universal 
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
module Registro_Universal

	(
		input wire aumentar, //boton aumentar
		input wire disminuir, //boton disminuir
		input wire clk, //system clock
		input wire reset, //system reset
		input wire chip_select, //Control data
		output wire out_aumentar, //boton aumentar
		output wire out_disminuir //boton disminuir    
    );

//body

reg aumentar_actual,disminuir_actual,aumentar_next,disminuir_next;

//Combinacional
always@(posedge clk, posedge reset)
begin
	if(reset)
		begin
		aumentar_actual <= 0;
		disminuir_actual <= 0;
		end
	else
	begin
		aumentar_actual <= aumentar_next;
		disminuir_actual <= disminuir_next;
	end
end

//Secuencial
always@*
	begin
	
	case(chip_select)
	
	1'b0: //Hold
	begin
	aumentar_next = aumentar_actual;
	disminuir_next = disminuir_actual;
	end
	1'b1: //Load
	begin
	aumentar_next = aumentar;
	disminuir_next = disminuir;
	end
	endcase
	
	end

assign out_aumentar = aumentar_actual;
assign out_disminuir = disminuir_actual;

endmodule

