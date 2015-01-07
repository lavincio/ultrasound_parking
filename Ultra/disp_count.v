`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:59:16 03/06/2011 
// Design Name: 
// Module Name:    disp_count 
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
module disp_count(
	input clk_mux,
	input [3:0]digit0,
	input [3:0]digit1,
	input [3:0]digit2,
	input [3:0]digit3,	
	output [3:0] an,
	output [6:0] a_to_g
    );

	reg [1:0] s;
	wire [3:0] num;
	
	mux4 mux_a_to_g(
		 .a0(digit0),
		 .a1(digit1),
		 .a2(digit2),
		 .a3(digit3),
		 .q(num),
		 .select(s)
		 );

	mux4 mux_an(
		 .a0(4'b0111),
		 .a1(4'b1011),
		 .a2(4'b1101),
		 .a3(4'b1110),
		 .q(an),
		 .select(s)
		 );
		 
	sevenseg seven(
		.num (num),
		.a_to_g(a_to_g)
		 );

	always @ (posedge clk_mux)
		s <= s + 1;
	 
endmodule
