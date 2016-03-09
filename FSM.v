`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: I.T.C.R
// Engineer: Jafet Chaves Barrantes
// 
// Create Date:    11:47:39 02/28/2016 
// Design Name: 
// Module Name:    FSM 
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


module FSM
(
	input wire clk,rst, //	Clock y reset
	input wire Funct_Select,// Entradas
	input wire [3:0] Count_CT,
	input wire [2:0] Count_F,
	output reg [3:0]C_Digit, //Current digit y current 7 segmentos
	output reg [3:0]C_7Seg  // Salidas, definidas como reg
);

wire [3:0] Multiplexed_Count;

//Mux_2x1 instancia_Mux_2x1 (.Seleccion(Funct_Select),.D1(Count_CT),.D0(Count_F),.Y(Multiplexed_Count));
Mux_2x1 instancia_MUX_2x1 (
    .Seleccion(Funct_Select), 
    .D1(Count_CT), 
    .D0(Count_F), 
    .Y(Multiplexed_Count)
    );
//*********************************************************

localparam [3:0]

// Codificación de los estados o etiquetas
Eval_Funct_Select = 4'b0000,
Send_PNumb_CT = 4'b0001, //Mandar primer dígito ciclo de trabajo
Send_SNumb_CT = 4'b0010, //Mandar segundo dígito ciclo de trabajo
Send_TNumb_CT = 4'b0011, //Mandar tercer dígito ciclo de trabajo
Send_CNumb_CT = 4'b0100, //Mandar cuarto dígito ciclo de trabajo
Send_PNumb_F = 4'b0101, //Mandar primer dígito frecuencia
Send_SNumb_F = 4'b0110, //Mandar segundo dígito frecuencia
Send_TNumb_F = 4'b0111, //Mandar tercer dígito frecuencia
Send_CNumb_F = 4'b1000; //Mandar cuarto dígito frecuencia


reg [3:0] state, state_next; 
// Reg, estado actual y siguiente

//*********************************************************


//Parte Secuencial

always@(posedge clk, posedge rst)

begin
	if(rst)
		state <= Eval_Funct_Select;
	else
		state <= state_next;
end


//*********************************************************

//Parte Combinacional

always@*

begin
	state_next = state;
	C_Digit = 4'b1111;
	C_7Seg = 4'b1111;
	
case(state)
//-------------------------------------------		
		Eval_Funct_Select:
		
		if(Funct_Select)
		begin
		state_next = Send_PNumb_CT; 
		end

		else
		begin
		state_next = Send_PNumb_F; 
		end
//-------------------------------------------			
      Send_PNumb_CT:
		
		begin
		state_next = Send_SNumb_CT;
		C_7Seg = 4'd7;		
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h0;
		4'h2: C_Digit = 4'h0;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h0;
		4'h5: C_Digit = 4'h0;
		4'h6: C_Digit = 4'h0;
		4'h7: C_Digit = 4'h0;
		4'h8: C_Digit = 4'h0;
		4'h9: C_Digit = 4'h0;
		4'hA: C_Digit = 4'h0;
		4'hB: C_Digit = 4'h0;
		4'hC: C_Digit = 4'h0;
		4'hD: C_Digit = 4'h0;
		4'hE: C_Digit = 4'h0;
		4'hF: C_Digit = 4'h1;
		endcase
		
		end
//-------------------------------------------		
      Send_SNumb_CT:
		
		begin
		state_next = Send_TNumb_CT; 
		C_7Seg = 4'd11;
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h0;
		4'h2: C_Digit = 4'h1;
		4'h3: C_Digit = 4'h2;
		4'h4: C_Digit = 4'h2;
		4'h5: C_Digit = 4'h3;
		4'h6: C_Digit = 4'h4;
		4'h7: C_Digit = 4'h4;
		4'h8: C_Digit = 4'h5;
		4'h9: C_Digit = 4'h6;
		4'hA: C_Digit = 4'h6;
		4'hB: C_Digit = 4'h7;
		4'hC: C_Digit = 4'h8;
		4'hD: C_Digit = 4'h8;
		4'hE: C_Digit = 4'h9;
		4'hF: C_Digit = 4'h0;
		endcase
		
		end
//-------------------------------------------
      Send_TNumb_CT:
		
		begin
		state_next = Send_CNumb_CT;
		C_7Seg = 4'd13;			
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h6;
		4'h2: C_Digit = 4'h3;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h6;
		4'h5: C_Digit = 4'h3;
		4'h6: C_Digit = 4'h0;
		4'h7: C_Digit = 4'h6;
		4'h8: C_Digit = 4'h3;
		4'h9: C_Digit = 4'h0;
		4'hA: C_Digit = 4'h6;
		4'hB: C_Digit = 4'h3;
		4'hC: C_Digit = 4'h0;
		4'hD: C_Digit = 4'h6;
		4'hE: C_Digit = 4'h3;
		4'hF: C_Digit = 4'h0;
		endcase
		
		end
//-------------------------------------------		
      Send_CNumb_CT:
		
		begin
		state_next = Eval_Funct_Select;
		C_7Seg = 4'd14;	
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h7;
		4'h2: C_Digit = 4'h3;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h7;
		4'h5: C_Digit = 4'h3;
		4'h6: C_Digit = 4'h0;
		4'h7: C_Digit = 4'h7;
		4'h8: C_Digit = 4'h3;
		4'h9: C_Digit = 4'h0;
		4'hA: C_Digit = 4'h7;
		4'hB: C_Digit = 4'h3;
		4'hC: C_Digit = 4'h0;
		4'hD: C_Digit = 4'h7;
		4'hE: C_Digit = 4'h3;
		4'hF: C_Digit = 4'h0;
		endcase
		
		end
//-------------------------------------------
      Send_PNumb_F:
		
		begin
		state_next = Send_SNumb_F;
		C_7Seg = 4'd7;	
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h0;
		4'h2: C_Digit = 4'h0;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h0;
		4'h5: C_Digit = 4'h0;
		4'h6: C_Digit = 4'h0;
		4'h7: C_Digit = 4'h0;
		default: C_Digit = 4'hF;

		endcase
		
		end
//-------------------------------------------
      Send_SNumb_F:
		
		begin
		state_next = Send_TNumb_F;
		C_7Seg = 4'd11;	
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h0;
		4'h2: C_Digit = 4'h0;
		4'h3: C_Digit = 4'h1;
		4'h4: C_Digit = 4'h1;
		4'h5: C_Digit = 4'h1;
		4'h6: C_Digit = 4'h1;
		4'h7: C_Digit = 4'h2;
		default: C_Digit = 4'hF;
		endcase
		
		end
//-------------------------------------------
      Send_TNumb_F:
		
		begin
		state_next = Send_CNumb_F;
		C_7Seg = 4'd13;	
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h3;
		4'h1: C_Digit = 4'h5;
		4'h2: C_Digit = 4'h7;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h2;
		4'h5: C_Digit = 4'h5;
		4'h6: C_Digit = 4'h7;
		4'h7: C_Digit = 4'h0;
		default: C_Digit = 4'hF;
		endcase
		
		end
//-------------------------------------------
      Send_CNumb_F:
		
		begin
		state_next = Eval_Funct_Select;
		C_7Seg = 4'd14;	
		
		case(Multiplexed_Count)
		
		4'h0: C_Digit = 4'h0;
		4'h1: C_Digit = 4'h0;
		4'h2: C_Digit = 4'h5;
		4'h3: C_Digit = 4'h0;
		4'h4: C_Digit = 4'h5;
		4'h5: C_Digit = 4'h0;
		4'h6: C_Digit = 4'h5;
		4'h7: C_Digit = 4'h0;
		default: C_Digit = 4'hF;
		endcase
		
		end
//-------------------------------------------

endcase

end

endmodule
