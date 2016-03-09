`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:09 03/03/2016
// Design Name:   Universal_Binary_Counter
// Module Name:   D:/ISE/PRIMER_PROYECTO/TB_Contador_16bits.v
// Project Name:  PRIMER_PROYECTO
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Universal_Binary_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_Contador_16bits;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Universal_Binary_Counter uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	initial 
	begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		#10;
		rst = 0;  
		// Add stimulus here

	end
	
always #10 clk = ~clk;


      
endmodule

