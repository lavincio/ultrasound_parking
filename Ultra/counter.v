`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:42 03/03/2011 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input clk,
    input reset,
    output reg[3:0] digit0,
    output reg[3:0] digit1,
    output reg[3:0] digit2,
    output reg[3:0] digit3
    );

	always @ (posedge clk)
		begin
			if(reset)
				begin
					digit0 <= 0;
					digit1 <= 0;
					digit2 <= 0;
					digit3 <= 0;
				end
			else begin
				if (digit0 < 4'b1001)
					digit0 <= digit0 + 1;
				else begin
					digit0 <= 0;
					if (digit1 < 4'b1001)
						digit1 <= digit1 + 1;
					else begin
						digit1 <= 0;
						if (digit2 < 4'b1001)
							digit2 <= digit2 + 1;
						else begin
							digit2 <= 0;
							if (digit3 < 4'b1001)
								digit3 <= digit3 + 1;
							else
								digit3 <= 0;
						end
					end
				end
			end
		end
endmodule
