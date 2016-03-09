`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: ITCR	
// Engineer: Yermy Benavides
//
// Create Date:   18:24:48 02/29/2016
// Design Name:   DivFrec
// Module Name:   D:/ISE/Proyecto1/DivFrec_tb.v
// Project Name:  Proyecto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DivFrec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DivFrec_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] div;

	// Outputs
	wire clkd;
	// Instantiate the Unit Under Test (UUT)
	DivFrec uut (
		.clk(clk), 
		.rst(rst), 
		.div(div), 
		.clkd(clkd)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		div = 0;

 
		// Wait 10 ns for global reset to finish
		#10 div = 16'b111110011;
	
	end
	
	always #10 clk = ~clk;
      
endmodule

