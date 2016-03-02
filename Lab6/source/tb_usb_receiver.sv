// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     3/1/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the tb for usb receiver.
// Timer Test bench 
// Timer Test bench 

`timescale 1ns / 100ps

module tb_usb_receiver	();

	//	Default Config Test Variables and Constants
	localparam SIZE = 4;
	localparam CLK_PERIOD = 10.4;
	localparam DELAY = 1;
	reg		tb_clk;	

	//	Clock generation block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#( CLK_PERIOD / 2.0 );
		tb_clk = 1'b1;
		#( CLK_PERIOD / 2.0 );
	end

	//	Declare Design Under Test (DUT) portmap signals
	integer	num_testcase;
	reg tb_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;

	//	DUT port map
	usb_receiver DUT (
		.clk		( tb_clk ),
		.n_rst		( tb_rst ), 
		.d_plus		( tb_d_plus ), 
		.d_minus	( tb_d_minus ), 
		.r_enable	( tb_r_enable ), 
		.r_data	( tb_r_data ),
		.empty		( tb_empty ),
		.full		( tb_full ),
		.rcving		( tb_rcving ),
		.r_error	( tb_r_error )
	);

	// Test bench process
	initial
	begin
	
		num_testcase = 		0;
		tb_rst 		= 1'b0;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		tb_r_enable = 1'b0;

		//	RESET
		@( negedge tb_clk );

		tb_rst 		= 1'b0;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		//	RESET DONE
		//	IDLE for two clocks
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Reset Done, Sending sync byte!");

		//	Sync Byte
		//	0
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		//	Sync Byte ends here	
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending sync byte, sending packet now!" );

		//	Packet 1: 11001010	
		//	0
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending first packet, sending EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent first EOP, sending second EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent second EOP, sending IDLE now!" );

		//	Send IDLE
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

//	-------------------------------------------------

		//	IDLE for two clocks
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		assert( 1 == 1 )
			$assert("Reset Done, Sending sync byte!" );

		//	Sync Byte
		//	0
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		//	Sync Byte ends here	
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending sync byte, sending packet now!" );

		//	Packet 1: 11001010	
		//	0
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending first packet, sending EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent first EOP, sending second EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent second EOP, sending IDLE now!" );

		//	Send IDLE
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

//	--------------------------------------------
		//	IDLE for two clocks
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_rst 		= 1'b1;
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Reset Done, Sending sync byte!" );

		//	Sync Byte
		//	0
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk ); 
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		//	Sync Byte ends here	
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending sync byte, sending packet now!" );

		//	Packet 1: 11001010	
		//	0
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;
		//	0
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;
		//	1
		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b1;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Done sending first packet, sending EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent first EOP, sending second EOP now!" );
		
		//	Send EOP
		@( negedge tb_clk );
		tb_d_plus 	= 1'b0;
		tb_d_minus 	= 1'b0;

		#( 8 * CLK_PERIOD );
		@( negedge tb_clk );
		if( 1 == 1 )
			$assert("Sent second EOP, sending IDLE now!" );

		//	Send IDLE
		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

		@( negedge tb_clk );
		tb_d_plus 	= 1'b1;
		tb_d_minus 	= 1'b0;

	end

endmodule

/*
`timescale 1ns / 100ps

module tb_usb_receiver();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;

	usb_receiver USB_RECEIVER
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.d_minus(tb_d_minus),
		.r_enable(tb_r_enable),
		.r_data(tb_r_data),
		.empty(tb_empty),
		.full(tb_full),
		.rcving(tb_rcving),
		.r_error(tb_r_error)
	);
	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end	
	initial
	begin
			tb_n_rst = 1'b1;
			tb_d_plus= 1'b1;
			tb_d_minus=1'b0;
			tb_r_enable=1'b0;
			@(negedge tb_clk);
	end
endmodule
*/