`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:52:27 02/29/2016
// Design Name:   FSM
// Module Name:   C:/Users/Jafet/Documents/Proyectos Dis.Sist.Digitales/I_Proyecto_Laboratorio_Sistemas_Digitales/FSM_Testbench.v
// Project Name:  I_Proyecto_Laboratorio_Sistemas_Digitales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_Testbench;

	// Inputs
	reg clk;
	reg rst;
	reg Funct_Select;
	reg [3:0] Count_CT;
	reg [3:0] Count_F;

	// Outputs
	wire [3:0] C_Digit;
	wire [3:0] C_7Seg;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.rst(rst), 
		.Funct_Select(Funct_Select), 
		.Count_CT(Count_CT), 
		.Count_F(Count_F), 
		.C_Digit(C_Digit), 
		.C_7Seg(C_7Seg)
	);
	
	//this process block sets up the free running clock
	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		Funct_Select = 0;
		Count_CT = 0;
		Count_F = 0;
	
		end

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		
	initial begin
	
		rst = 1;
		Funct_Select = 1'b0;
		Count_CT = 4'b0000;
		Count_F = 4'b0000;
		#200
		rst = 0;
		Funct_Select = 1'b0;
		Count_CT = 4'b0000;
		Count_F = 4'b0000;
		#800
		rst = 0;
		Funct_Select = 1'b1;
		Count_CT = 4'b0000;
		Count_F = 4'b0000;
		#800
		rst = 0;
		Funct_Select = 1'b0;
		Count_CT = 4'b0001;
		Count_F = 4'b0001;
		#800
		rst = 0;
		Funct_Select = 1'b1;
		Count_CT = 4'b0001;
		Count_F = 4'b0001;
		#1000 $stop;
		
	end
	
	/*reg [3:0] i;
	
	initial begin
	
	rst = 1;
	Funct_Select = 1'b0;
	Count_CT = 4'b0000;
	Count_F = 4'b0000;

	#200
	rst = 0;
	Funct_Select = 1'b0;
	for(i=4'b0;i<16;i=i+1)
	always@ posedge clck
	begin
	Count_CT <= i;
	Count_F <= i;
	end
	#1000 $stop;
	end*/
	
endmodule

