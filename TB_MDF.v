`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: Yermy Benavides
//
// Create Date:   21:40:24 02/29/2016
// Design Name:   MDF
// Module Name:   D:/ISE/Proyecto1/TB_MDF.v
// Project Name:  Proyecto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MDF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_MDF;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] entrada;

	// Outputs
	wire salida;
	wire [15:0]q;


	// Instantiate the Unit Under Test (UUT)
	MDF uut (
		.clk(clk), 
		.rst(rst), 
		.entrada(entrada), 
		.salida(salida),
		.q(q)
	);
  
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		entrada = 0;
		

		// Wait 100 ns for global reset to finish
		#10;
		entrada = 4'b1111;
		#10000;
		entrada = 4'b1010;
	end      
	always #1000 clk = ~clk;
	 
/*	initial   
		begin
		$monitor("%d,\t%b,\t%b,\t%b,\t%d",$time, clk,rst,div,clkd); 
		end 
  initial 
    #500  $finish;	
		 
*/		
endmodule

