`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:09:32 02/29/2016
// Design Name:   Comp_16bits
// Module Name:   D:/ISE/Proyecto1/Comp_16bits_tb.v
// Project Name:  Proyecto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comp_16bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comp_16bits_tb;

	// Inputs
	reg [15:0] in;
	reg rst;
	reg [15:0] ref;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Comp_16bits uut (
		.in(in), 
		.out(out), 
		.rst(rst), 
		.ref(ref)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		rst = 0;
		ref = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		

	end
      
endmodule

