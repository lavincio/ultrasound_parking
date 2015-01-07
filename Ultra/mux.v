`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:58 03/03/2011 
// Design Name: 
// Module Name:    mux 
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
module mux4(
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] a2,
    input [3:0] a3,
    output reg[3:0] q,
	 input wire [1:0]select
    );
		
	always @ (select or a0 or a1 or a2 or a3)
	begin
		case (select)
		0: q = a0;
		1: q = a1;
		2: q = a2;
		3: q = a3;
		endcase
	end
endmodule
