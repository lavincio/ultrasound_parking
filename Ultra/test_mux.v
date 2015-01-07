`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:51:21 03/05/2011
// Design Name:   mux4
// Module Name:   test_mux.v
// Project Name:  
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux;

	// Inputs
	reg [3:0] a0;
	reg [3:0] a1;
	reg [3:0] a2;
	reg [3:0] a3;
	reg [1:0] select;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	mux4 uut (
		.a0(a0), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.q(q), 
		.select(select)
	);

	initial begin
		// Initialize Inputs
		a0 = 0;
		a1 = 0;
		a2 = 0;
		a3 = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        a0 = 4'b0001;
		  select = 0;
		  a1 = 4'b0010;
		  a2 = 4'b0100;
		  a3 = 4'b1000;
		// Add stimulus here
		#200;
        a0 = 4'b0001;
		  select = 1;
		  a1 = 4'b0010;
		  a2 = 4'b0100;
		  a3 = 4'b1000;
		#400;
        a0 = 4'b0001;
		  select = 2;
		  a1 = 4'b0010;
		  a2 = 4'b0100;
		  a3 = 4'b1000;
		#800;
        a0 = 4'b0001;
		  select = 3;
		  a1 = 4'b0010;
		  a2 = 4'b0100;
		  a3 = 4'b1000;
	end
      
endmodule

