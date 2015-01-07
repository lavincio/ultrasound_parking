`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:44 03/10/2011
// Design Name:   ultra_pblaze
// Module Name:   ultra_pblaze_sim.v
// Project Name:  Ultra_sonic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ultra_pblaze
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ultra_pblaze_sim;

	// Inputs
	reg reset;
	reg clk;
	reg rxd;
	reg [7:0] dip_sw;

	// Outputs
	wire txd;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	ultra_pblaze uut (
		.reset(reset), 
		.clk(clk), 
		.txd(txd), 
		.rxd(rxd), 
		.dip_sw(dip_sw), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		rxd = 0;
		dip_sw = 0;

		// Wait 100 ns for global reset to finish
		#20;
        		dip_sw = 8'h80;
				rxd = 8'h52;
		#10;
        		dip_sw = 8'h80;
				rxd = 8'h30;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h31;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h32;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h0D;	
		#20;
       		dip_sw = 8'h80;
				rxd = 8'h52;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h33;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h34;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h35;
		#10;
       		dip_sw = 8'h80;
				rxd = 8'h0D;					
		#30;
				reset = 1;
	end
      
	always begin
		#5 clk = ~clk;
	end
	
endmodule

