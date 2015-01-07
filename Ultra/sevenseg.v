`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:33 03/03/2011 
// Design Name: 
// Module Name:    sevenseg 
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
module sevenseg(
	input [3:0] num,
	output reg [6:0] a_to_g
    );

	always @(*) begin
		case (num)
			//		     abcdefg
			0: a_to_g=7'b0000001;
			1: a_to_g=7'b1001111;
			2: a_to_g=7'b0010010;
			3: a_to_g=7'b0000110;
			4: a_to_g=7'b1001100;
			5: a_to_g=7'b0100100;
			6: a_to_g=7'b0100000;
			7: a_to_g=7'b0001111;
			8: a_to_g=7'b0000000;
			9: a_to_g=7'b0000100;
			default: a_to_g=7'b0000001;
		endcase
	end
endmodule
