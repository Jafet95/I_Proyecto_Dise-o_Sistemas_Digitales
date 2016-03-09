`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:48 02/29/2016 
// Design Name: 
// Module Name:    DivFrec 
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
module DivFrec(clk,rst,div,clkd,clk_1kHz);
input wire clk,rst;
input wire [6:0]div;
output wire clkd;
output wire clk_1kHz;

reg [6:0]q = 0;
reg cd = 0;
reg [15:0]q_1kHz = 0;
reg cd_1kHz = 0;
/*reg [5:0]q_sincronizacion = 0;
reg cd_sincronizacion = 0;*/

// Para generar el clock dividido variable a partir de la cuenta
always@(posedge clk, posedge rst)
	if (rst)
		begin
		q <= 0;
		cd <=0;
		end
	else 
		if (q==div)
			begin
			q <= 0;
			cd <= ~cd;
			end
		else
			q <= q + 7'b1;
		
assign clkd = cd;

// Para generar el clock dividido fijo de 1 kHz

always@(posedge clk, posedge rst)
	if (rst)
		begin
		q_1kHz <= 0;
		cd_1kHz <=0;
		end
	else 
		if (q_1kHz==16'd49999)
			begin
			q_1kHz <= 0;
			cd_1kHz <= ~cd_1kHz;
			end
		else
			q_1kHz <= q_1kHz + 16'b1;
		
assign clk_1kHz = cd_1kHz;

/*// Para generar el clock dividido para el bloque de sincronizacion

always@(posedge clk, posedge rst)
	if (rst)
		begin
		q_sincronizacion <= 0;
		cd_sincronizacion <=0;
		end
	else 
		if (q_sincronizacion==6'd49)
			begin
			q_sincronizacion <= 0;
			cd_sincronizacion <= ~cd_sincronizacion;
			end
		else
			q_sincronizacion <= q_sincronizacion + 6'b1;
		
assign clk_sincronizacion = cd_sincronizacion;*/


endmodule 