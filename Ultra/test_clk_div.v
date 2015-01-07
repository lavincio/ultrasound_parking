`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:23:11 03/04/2011
// Design Name:   clk_div
// Module Name:   test_clk_div.v
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

module test_clk_div;

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
		#100;
        
		// Add stimulus here

	end
      
endmodule

