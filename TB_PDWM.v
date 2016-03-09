`timescale 10ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:50 03/07/2016
// Design Name:   DPWM
// Module Name:   D:/TEC/I 2016/Lab Digitales/Proyecto I/I-Proyecto-Laboratorio-de-Dise-o-Sistemas-Digitales/TB_PDWM.v
// Project Name:  PRIMER_PROYECTO
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

module TB_PDWM;
 
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

initial begin
forever #0.5 CLK_FPGA_BOARD = ~CLK_FPGA_BOARD;
end

	initial begin
		// Initialize Inputs
		CLK_FPGA_BOARD = 0;
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 1;
		#10
		
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		#10
		
		boton_aumentar = 1;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		#100
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		#10
		boton_aumentar = 1;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		#100
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		
				#10
		
		boton_aumentar = 1;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
		#100
		boton_aumentar = 0;
		boton_disminuir = 0;
		seleccion_funcion = 0;
		seleccion_salida = 0;
		reinicio = 0;
        
		// Add stimulus here
		#10000000$stop;
 
	end
      
endmodule

