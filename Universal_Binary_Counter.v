`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:22 02/15/2015 
// Design Name: 
// Module Name:    Universal_Binary_Counter 
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
module Universal_Binary_Counter(	
out     ,  // Output of the counter
clk     ,  // clock Input
rst      // reset Input
);

output reg [3:0] out;
input  clk, rst;
reg bandera;
	 
always @(posedge clk, posedge rst)
if (rst) begin
  out <= 8'b0;
  bandera = 0;
end 
else if (bandera == 0) 
	begin
	out <= out + 4'b1;
	if (out==16) out <=4 'b0;
	end
else if (bandera==1)
	begin
	out <= out - 4'b1;
	if(out==0) bandera =1;
	end

endmodule
