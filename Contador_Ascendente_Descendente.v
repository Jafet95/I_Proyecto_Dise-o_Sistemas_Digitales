`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:15 02/21/2016 
// Design Name: 
// Module Name:    Contador_Ascendente_Descendente 
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
module Contador_Ascendente_Descendente

	# (parameter N = 4) // Para definir el número de bits del contador
	(
		input wire clk,
		input wire reset,
		input wire enUP,
		input wire enDOWN,
		output wire [N-1:0] q
    );

//Signal Declarations
reg [N-1:0] q_act;
reg banderaUP,banderaDOWN;

//Body of "state" registers
always@(posedge clk)
begin	
	if(reset)
	
	begin
		q_act = 0;
		banderaUP = 0;
		banderaDOWN = 0;
	end
	/*else
		q_act <= q_next;*/

//Specified functions of the counter 		
//always@*

	else if(enUP > banderaUP)
	begin
		q_act = q_act + 1'b1;
		banderaUP = 1;
	end
	
	else if (enDOWN > banderaDOWN)
	begin
		q_act = q_act - 1'b1;
		banderaDOWN = 1;
	end
	
	else if (enUP < banderaUP) banderaUP = 0;
	
	else if (enDOWN < banderaDOWN) banderaDOWN = 0;
	
end
//Output Logic
assign q = q_act;

endmodule
