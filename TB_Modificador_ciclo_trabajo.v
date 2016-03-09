`timescale 10ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:02:39 03/03/2016
// Design Name:   Modificacion_Ciclo_Trabajo
// Module Name:   D:/ISE/PRIMER_PROYECTO/TB_Modificador_ciclo_trabajo.v
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

module TB_Modificador_ciclo_trabajo;

	// Inputs
	reg clk_100MHz;
	reg clk_de_trabajo;
	reg rst;
	reg up;
	reg down;
	reg func_select;
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
		.func_select(func_select), 
		.chip_select(chip_select), 
		.signal_out(signal_out), 
		.ciclo_actual(ciclo_actual) 
		
	);

	initial begin
		// Initialize Inputs
		clk_100MHz = 0;
		clk_de_trabajo = 0;
		rst = 0;
		up = 0;
		down = 0;
		func_select = 0;
		chip_select = 0;
 
		// Wait 100 ns for global reset to finish
		#10; 
		rst=1;
		#10
		rst=0;
		
		#10
		up=1;
		//#2
		/*
		up=0;
		#70
		down=1;
		
		*/
		 
        
		// Add stimulus here

	end

always #10 clk_100MHz = ~clk_100MHz;

always #60 clk_de_trabajo = ~clk_de_trabajo;
      
endmodule

