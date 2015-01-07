`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:16:27 03/05/2011
// Design Name:   clk_div
// Module Name:   clk_sim.v
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_sim;

	// Inputs
	reg clk;

	// Outputs
	wire clk_mux;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk(clk), 
		.clk_mux(clk_mux)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		// Wait 100 ns for global reset to finish

		// Add stimulus here
		//#500000;  $finish;
	end
	
	always begin
		#1  clk = !clk;
	end
      
endmodule

