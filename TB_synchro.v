`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:59:28 03/01/2016
// Design Name:   Synchro
// Module Name:   D:/ISE/Proyecto1/TB_synchro.v
// Project Name:  Proyecto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Synchro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_synchro;

	// Inputs
	reg dato;
	reg clk;

	// Outputs
	wire ds;

	// Instantiate the Unit Under Test (UUT)
	Synchro uut (
		.dato(dato), 
		.clk(clk), 
		.ds(ds)
	);

	initial begin
		// Initialize Inputs
		dato = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#30;
      dato = 1;
		#50;
      dato = 0;
		// Add stimulus here

	end
 
always #10 clk = ~clk;
endmodule

