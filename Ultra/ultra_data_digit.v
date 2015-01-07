`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:34 03/09/2011 
// Design Name: 
// Module Name:    ultra_data_digit 
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
module ultra_data_digit(
	input reset,
	input clk,
   output	txd,
   input		rxd,	
	input [7:0] dip_sw,
	output reg[3:0] digit0,
	output reg[3:0] digit1,
	output reg[3:0] digit2,
	output reg[3:0] digit3,
	output [7:0] led
   );
	
ultra_pblaze ultra_pblaze(
	.reset(reset),
	.clk(clk),
	.txd(txd),
	.rxd(rxd),	
	.dip_sw(dip_sw),
	.data(data),
	.led(led),
	.select(select)
   );
	
always@(*)
begin
	if(reset)
	begin
		digit0 = 1;
		digit1 = 2;
		digit2 = 3;
		digit3 = 4;	
	end

	case (select) 
		1 : begin
				digit0 = 4'h9;
			 end
		2 : begin
				digit1 = 4'h7;//data - 8'h30;	
			 end
		3 : begin
				digit2 = 4'h5;//data - 8'h30;
			 end
		default:	begin
				digit3 = 4'h3;
			 end
	endcase 
end
endmodule
