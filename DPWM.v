`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:46 03/03/2016 
// Design Name: 
// Module Name:    DPWM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DPWM
(
input wire CLK_FPGA_BOARD,
input wire boton_aumentar,
input wire boton_disminuir,
input wire seleccion_funcion,
input wire seleccion_salida,
input wire reinicio,
output wire BUCK_Gate,
output wire Full_Bridge,
output wire [3:0] anodos_7seg,
output wire [7:0] catodos_7seg
);

wire boton_aumentar_sincronizado;
wire boton_disminuir_sincronizado;
wire seleccion_funcion_sincronizado;
wire seleccion_salida_sincronizado;
wire reinicio_sincronizado;

wire [2:0] OutCuenta_Modificacion_Frec_Conmu_In_Control_visualizador_numerico;//Cuenta del modulo de modificacion de la frecuencia
wire [3:0] OutCuenta_Modificacion_CT_In_Control_visualizador_numerico;//Cuenta del modulo de modificacion del ciclo de trabajo
wire OutCLK1kHz_Modificacion_Frec_Conmu_In_Control_visualizador_numerico; //clock de  1 kHz fijo para la FSM
wire OutCLKVar_Modificacion_Frec_Conmu_In_Modificacion_CT;//Clock variable que entra al módulo de modificacion del ciclo de trabajo
wire OutSignal_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida; //Señal de conmutación hacia el bloque de distribución de salid
//wire OutBuffer_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida;

/*BUFG BUFG_inst 
( //Buffer de modificacion de frecuencia al demux
.O(OutBuffer_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida), // 1-bit output: Clock buffer output
.I(OutSignal_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida)  // 1-bit input: Clock buffer input
);*/

Sincronizador Instancia_Sincronizador(
.incambiarfuncion(seleccion_funcion),
.incambiarsalida(seleccion_salida),
.inrst(reinicio),
.inbtup(boton_aumentar),
.inbtdown(boton_disminuir),
.clk(CLK_FPGA_BOARD),
.outcambiarfuncion(seleccion_funcion_sincronizado),
.outcambiarsalida(seleccion_salida_sincronizado),
.outbtup(boton_aumentar_sincronizado),
.outbtdown(boton_disminuir_sincronizado),
.outrst(reinicio_sincronizado)
);

Modificacion_Frec_Conmu Instancia_Modificacion_Frec_Conmu
(
.CLK_100MHz(CLK_FPGA_BOARD),
.aumentar_Frec(boton_aumentar_sincronizado),
.disminuir_Frec(boton_disminuir_sincronizado),
.funct_select(seleccion_funcion_sincronizado),
.reset(reinicio_sincronizado),
.CLK_dividido(OutCLKVar_Modificacion_Frec_Conmu_In_Modificacion_CT),
.CLK_1kHz(OutCLK1kHz_Modificacion_Frec_Conmu_In_Control_visualizador_numerico),
.OutContadorAD_InMDF(OutCuenta_Modificacion_Frec_Conmu_In_Control_visualizador_numerico) //Conexiones entre contador y bloque MDF (traductor y divisor de clock), también para la FSM
);

Modificacion_Ciclo_Trabajo Instancia_Modificacion_Ciclo_Trabajo
(
.clk_100MHz(CLK_FPGA_BOARD),
.clk_de_trabajo(OutCLKVar_Modificacion_Frec_Conmu_In_Modificacion_CT),
.rst(reinicio_sincronizado),
.up(boton_aumentar_sincronizado),
.down(boton_disminuir_sincronizado),
.chip_select(seleccion_funcion_sincronizado),
.signal_out(OutSignal_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida),
.ciclo_actual(OutCuenta_Modificacion_CT_In_Control_visualizador_numerico)	
);

Control_visualizador_numerico Instancia_Control_visualizador_numerico
(
.cuenta_frec(OutCuenta_Modificacion_Frec_Conmu_In_Control_visualizador_numerico),
.cuenta_CT(OutCuenta_Modificacion_CT_In_Control_visualizador_numerico),
.clock(OutCLK1kHz_Modificacion_Frec_Conmu_In_Control_visualizador_numerico),
.reset(reinicio_sincronizado),
.funct_select(seleccion_funcion_sincronizado),
.code_digitos_decimal(catodos_7seg), //secuencia para mostrar el digito correcto
.code_7seg(anodos_7seg) //secuencia para encender el 7 segmentos correcto
);

Distribucion_Salida Instancia_Distribucion_Salida
(	 
.In_signal_conmutacion(OutSignal_Modificacion_Ciclo_Trabajo_In_Distribucion_Salida),
.select_salida(seleccion_salida_sincronizado),
.Out_signal_conmutacion({Full_Bridge,BUCK_Gate})//1 para full bridge y 0 para BUCK gate
);

endmodule
