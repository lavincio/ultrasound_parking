`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:34 03/03/2011 
// Design Name: 
// Module Name:    test_top 
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
module ultra_top(
	 input reset,
    input clk,
	 output txd,
	 input rxd,
	 input [7:0] dip_sw,
    output [3:0] an,
    output [6:0] a_to_g,
	 output led,
	 output sound
    );
	  
	wire clk_mux;
	wire [3:0] digit0, digit1, digit2, digit3;
	
	wire tmp;

	assign txd = 1;
	//always@(posedge clk)
	//	txd <= 1'b1;
	
clk_div clk_div(
    .clk (clk),
	 .clk_mux(clk_mux)
    );
	
ultra_pblaze ultra_pblaze(
	.reset(reset),
	.clk(clk),
	.txd(tmp),
	.rxd(rxd),
	.dip_sw(dip_sw),
   .digit0(digit0),
   .digit1(digit1),
   .digit2(digit2),
   .digit3(digit3)
	);
	
speaker speaker(
	.clk(clk),
	.dip_sw(dip_sw),
	.digit0(digit0),
   .digit1(digit1),
   .digit2(digit2),
   .digit3(digit3),
	.sound(sound),
	.led(led)
);

disp_count disp_count(
   .digit0(digit0),
   .digit1(digit1),
   .digit2(digit2),
   .digit3(digit3),
	.clk_mux(clk_mux),
	.an(an),
	.a_to_g(a_to_g)
   );

endmodule
