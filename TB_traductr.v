`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:05:17 02/29/2016
// Design Name:   Traductor
// Module Name:   D:/ISE/Proyecto1/TB_traductr.v
// Project Name:  Proyecto1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Traductor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_traductr;

	// Inputs
	reg [3:0] in;
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	Traductor uut (
		.in(in), 
		.out(out), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		in = 4'b0010;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #10 clk=~clk;
      
endmodule

