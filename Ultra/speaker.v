`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:33 03/14/2011 
// Design Name: 
// Module Name:    speaker 
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
module speaker(
	input clk,
	input [7:0]dip_sw,	
	input [3:0]digit0,
	input [3:0]digit1,
	input [3:0]digit2,
	input [3:0]digit3,
	output reg sound,
	output reg led
	);

wire [16:0] tone = 17'b10000000000000000;
reg [16:0] counter;
reg [24:0] type;
reg [24:0] value;
reg [3:0] switch;
reg [7:0] number;
reg cnt_out;

always @(posedge clk) 
begin
	number = (digit1 * 10) + digit0;

	if(number > 36)
		switch = 0;
		else if (number > 25)
			switch = 7;
		else if (number > 20)
			switch = 6;				
		else if (number > 15)
			switch = 5;	
		else if (number > 11)
			switch = 4;	
		else if (number > 8)
			switch = 3;	
		else if (number > 6)
			switch = 2;				
		else
			switch = 1;
end

always @(switch)
begin
	case(switch)
		0:	type = 25'd0; 
		1: type = 25'd4194303;	
		2: type = 25'd6291455;		
		3: type = 25'd8388607;
		4: type = 25'd12582911;
		5: type = 25'd16777215;
		6: type = 25'd25165823;
		7: type = 25'd33554431;
	endcase
end	

always @(posedge clk) 
begin
	if(counter==0) 
		counter <= tone; 
	else 
		counter <= counter-1;
end		

always @(posedge clk) 
begin		
	if(switch!=0)
	begin
		if(value==type)
			begin
				cnt_out <= ~cnt_out;
				value <= 0;
			end
		else value <= value + 1;
	end
	else
		cnt_out <= 0;
end

always @(posedge clk) 
begin
		
		if(cnt_out)
			if(counter==0)
			begin
				led <= ~led;
				if(dip_sw[0])
					sound <= ~sound;
			end
end

endmodule