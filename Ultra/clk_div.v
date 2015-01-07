`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:21 03/03/2011 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(
    input clk,
	 output reg clk_mux
    );

	reg [15:0] q_mux;
	
	initial
	 begin
		q_mux = 0;
		clk_mux = 0;
	end

	always @ (posedge clk)
		begin
				if(q_mux < 16'd50000)
					q_mux <= q_mux+1;
				else
					begin
						q_mux <= 0;
						clk_mux <= ~clk_mux;
					end
		end
		
endmodule
