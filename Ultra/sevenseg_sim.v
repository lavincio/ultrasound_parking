`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:16:42 03/05/2011
// Design Name:   sevenseg
// Module Name:   sevenseg_sim.v
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sevenseg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sevenseg_sim;

	// Inputs
	reg [3:0] num;

	// Outputs
	wire [6:0] a_to_g;

	// Instantiate the Unit Under Test (UUT)
	sevenseg uut (
		.num(num), 
		.a_to_g(a_to_g)
	);

	initial begin
		// Initialize Inputs
		num = 0;

		// Wait 100 ns for global reset to finish
		#100;
			num = 4'd0;
		#100;
			num = 4'd1;
		#100;
			num = 4'd2;
		#100;
			num = 4'd3;
		#100;
			num = 4'd4;			
		// Add stimulus here

	end
      
endmodule

