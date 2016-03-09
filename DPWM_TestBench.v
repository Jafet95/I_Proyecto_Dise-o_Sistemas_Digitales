`timescale 10ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:38:47 03/06/2016
// Design Name:   DPWM
// Module Name:   C:/Users/Jafet/Documents/Proyectos Dis.Sist.Digitales/I_Proyecto_Laboratorio_Sistemas_Digitales/DPWM_TestBench.v
// Project Name:  I_Proyecto_Laboratorio_Sistemas_Digitales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DPWM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DPWM_TestBench;

	// Inputs
	reg CLK_FPGA_BOARD;
	reg boton_aumentar;
	reg boton_disminuir;
	reg seleccion_funcion;
	reg seleccion_salida;
	reg reinicio;

	// Outputs
	wire BUCK_Gate;
	wire Full_Bridge;
	wire [3:0] anodos_7seg;
	wire [7:0] catodos_7seg;

	// Instantiate the Unit Under Test (UUT)
	DPWM uut (
		.CLK_FPGA_BOARD(CLK_FPGA_BOARD), 
		.boton_aumentar(boton_aumentar), 
		.boton_disminuir(boton_disminuir), 
		.seleccion_funcion(seleccion_funcion), 
		.seleccion_salida(seleccion_salida), 
		.reinicio(reinicio), 
		.BUCK_Gate(BUCK_Gate), 
		.Full_Bridge(Full_Bridge), 
		.anodos_7seg(anodos_7seg), 
		.catodos_7seg(catodos_7seg)
	);

	initial 
	begin
		// Initialize Inputs
		CLK_FPGA_BOARD = 0;
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
	end

		// Wait 100 ns for global reset to finish
		//#100;
		
			
			
	//this process block sets up the free running clock
		initial 
		begin
		CLK_FPGA_BOARD = 0;
		forever #5 CLK_FPGA_BOARD = ~CLK_FPGA_BOARD;
		end
        
		// Add stimulus here
		
		initial
		begin
		
		reinicio = 1;
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		#10
		
		reinicio = 0;
		#10
		
		reinicio = 0;
		boton_aumentar = 1;
		#50
		boton_aumentar = 0;
		#20
		boton_aumentar = 1;
		#20
		boton_aumentar = 0;
		boton_disminuir = 0;
		/*
		seleccion_funcion = 0;
		seleccion_salida = 0;
		#200
		*/ 
		//#1000000$stop;
		
		end
      
endmodule

