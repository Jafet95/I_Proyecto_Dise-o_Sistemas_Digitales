`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:40:50 03/07/2016
// Design Name:   Modificacion_Ciclo_Trabajo
// Module Name:   D:/TEC/I 2016/Lab Digitales/Proyecto I/I-Proyecto-Laboratorio-de-Dise-o-Sistemas-Digitales/TB_CT.v
// Project Name:  PRIMER_PROYECTO
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Modificacion_Ciclo_Trabajo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_CT;

	// Inputs
	reg clk_100MHz;
	reg clk_de_trabajo;
	reg rst;
	reg up;
	reg down;
	reg chip_select;

	// Outputs
	wire signal_out;
	wire [3:0] ciclo_actual;

	// Instantiate the Unit Under Test (UUT)
	Modificacion_Ciclo_Trabajo uut (
		.clk_100MHz(clk_100MHz), 
		.clk_de_trabajo(clk_de_trabajo), 
		.rst(rst), 
		.up(up), 
		.down(down), 
		.chip_select(chip_select), 
		.signal_out(signal_out), 
		.ciclo_actual(ciclo_actual)
	);
initial begin
forever #5 clk_100MHz = ~clk_100MHz;
end

initial begin
forever #10 clk_de_trabajo = ~clk_de_trabajo;
end
	initial begin
		// Initialize Inputs
		clk_100MHz = 0;
		clk_de_trabajo = 0;
		rst = 1;
		up = 0;
		down = 0;
		chip_select = 1;

		// Wait 100 ns for global reset to finish
		#10;
		rst = 0;
		/*
		#10
		up = 1;
		#50
		up = 0;
       */ 
		// Add stimulus here

	end
      
endmodule

