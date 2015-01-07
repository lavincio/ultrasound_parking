`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:10 03/05/2011
// Design Name:   counter
// Module Name:   
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_sim;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] digit0;
	wire [3:0] digit1;
	wire [3:0] digit2;
	wire [3:0] digit3;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.reset(reset), 
		.digit0(digit0), 
		.digit1(digit1), 
		.digit2(digit2), 
		.digit3(digit3)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#500;
        reset = 0;
		// Add stimulus here
		#1000;  $finish;
	end
      
	always begin
		#5  clk =  ! clk;
	end
	
	
endmodule

