`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:44 03/09/2011 
// Design Name: 
// Module Name:    ultra_pblaze 
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
module ultra_pblaze(
    input 				reset,
    input 				clk,
    output				txd,
    input				rxd,
    input 	[7:0]		dip_sw,
	output reg[3:0] digit0,
	output reg[3:0] digit1,
	output reg[3:0] digit2,
	output reg[3:0] digit3
    );

reg [1:0] select;
// for simulation
//parameter BAUD9600 = 4; 	// 
// on board
  parameter BAUD9600 = 313;   // for 9600 at 50MHz
//
  parameter INTCNT   = 49;  	// to provide for 1uS interrupts at 50MHz
//
//
//----------------------------------------------------------------------------------
//
// Signals used to connect KCPSM3 to program ROM and I/O logic
//
wire [9:0] 	address;
wire [17:0]	instruction;
wire [7:0]	port_id;
wire [7:0] 	out_port;
reg [7:0] 	in_port;
wire  		write_strobe;
wire  		read_strobe;
reg  			interrupt;
wire  		interrupt_ack;

// Signals for connection of peripherals
wire [7:0] 	uart_status_port;

// Signals for UART connections

reg [9:0] 	baud_count;
reg  			en_16_x_baud;
wire  		write_to_uart;
wire  		tx_full;
wire  		tx_half_full;
reg  			read_from_uart;
wire [7:0] 	rx_data;
wire  		rx_data_present;
wire  		rx_full;
wire  		rx_half_full;
//
//
//      Signals for Baud Rate generators
//
reg [8:0]	baud_9600_count;	//   : integer range 0 to 500 := 0;
wire			en_9600_16_x_baud;

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Start of circuit description
//

//--------------------------------------------------------------------------------------------------------------------------------
// KCPSM3 and the program memory 
//--------------------------------------------------------------------------------------------------------------------------------
//

kcpsm3 processor (
		.address(address),
    	.instruction(instruction),
    	.port_id(port_id),
    	.write_strobe(write_strobe),
    	.out_port(out_port),
    	.read_strobe(read_strobe),
    	.in_port(in_port),
    	.interrupt(interrupt),
    	.interrupt_ack(interrupt_ack),
    	.reset(reset),
    	.clk(clk)
		);

ultrarxd program_rom (
		.address(address),
    	.instruction(instruction),
   	.clk(clk)
		);

//--------------------------------------------------------------------------------------------------------------------------------
// KCPSM3 input ports 
//--------------------------------------------------------------------------------------------------------------------------------
//
// UART FIFO status signals to form a bus
//

  assign uart_status_port = {3'b 000,rx_data_present,rx_full,rx_half_full,tx_full,tx_half_full};

//
// The inputs connect via a pipelined multiplexer
//

  always @(posedge clk) begin
    if (port_id[0] == 1'b1)
    // read UART status at address 01 hex
		in_port <= uart_status_port;

    // read UART receive data at address 02 hex
    if (port_id[1] == 1'b1)
      in_port <= rx_data;
		
	 // read DIP SW at address 80 hex
	 if (port_id[7] == 1'b1)
      in_port <= dip_sw;
   
    // Form read strobe for UART receiver FIFO buffer.
    // The fact that the read strobe will occur after the actual data is read by 
    // the KCPSM3 is acceptable because it is really means 'I have read you'!

    read_from_uart <= read_strobe & port_id[1] ;	// UART read at address 02

  end

//--------------------------------------------------------------------------------------------------------------------------------
// KCPSM3 output ports 
//--------------------------------------------------------------------------------------------------------------------------------
//
// adding the output registers 
  always @(posedge clk) begin
    if(write_strobe == 1'b 1) begin
      // data at address 01 hex
      if(port_id[1]  == 1'b 1) begin
			if(out_port == 8'h52) begin
				select <= 2'b01;
			end
			else if(out_port == 8'h0D) begin
				select <= 2'b01;
			end		
			else begin
				select <= select + 1;
			end
			
				case (select) 
					0 : begin
							digit3 <= 0;
						 end
					1 : begin
							digit2 <= out_port - 8'h30;
						 end
					2 : begin
							digit1 <= out_port - 8'h30;	
						 end
					3 : begin
							digit0 <= out_port - 8'h30;
						 end
					default:	begin
							digit3 <= 0;
						 end
				endcase 

      end
    end
  end

//
// write to UART transmitter FIFO buffer at address 01 hex.
// This is a combinatorial decode because the FIFO is the 'port register'.
//
assign write_to_uart = write_strobe & port_id[0] ;
//
//--------------------------------------------------------------------------------------------------------------------------------
// UART  
//--------------------------------------------------------------------------------------------------------------------------------
//
// Connect the 8-bit, 1 stop-bit, no parity transmit and receive macros.
// Each contains an embedded 16-byte FIFO buffer.
//
uart_tx transmit
(	.data_in(out_port),
    	.write_buffer(write_to_uart),
    	.reset_buffer(1'b0),
    	.en_16_x_baud(en_16_x_baud),
    	.serial_out(txd),
    	.buffer_full(tx_full),
    	.buffer_half_full(tx_half_full),
    	.clk(clk));

uart_rx receive
(	.serial_in(rxd),
    	.data_out(rx_data),
    	.read_buffer(read_from_uart),
    	.reset_buffer(1'b0),
    	.en_16_x_baud(en_16_x_baud),
    	.buffer_data_present(rx_data_present),
    	.buffer_full(rx_full),
    	.buffer_half_full(rx_half_full),
    	.clk(clk));
		
//  ----------------------------------------------------------------------------------------------------------------------------------
//  -- BAUD Rate Generators  
//  ----------------------------------------------------------------------------------------------------------------------------------
//  --
//  -- Set baud rate for the UART communications
//  -- Requires en_16_x_baud to be 614400Hz which is a single cycle pulse every 90 cycles at 55MHz 
//  --   --
//  -- NOTE : If the highest value for baud_count exceeds 127 you will need to adjust 
//  --        the range of integers in the signal declaration for baud_count.
//  --
//--------------------------------------------------------------------------------------------------------------------------------
  always @(posedge clk) 
  begin
      if (baud_9600_count == BAUD9600) 
			begin
           		baud_9600_count <= 1'b0;
      	     	en_16_x_baud <= 1'b1;
			end
      else
			begin
           		baud_9600_count <= baud_9600_count + 1;
           		en_16_x_baud <= 1'b0;
      	end
  end
endmodule