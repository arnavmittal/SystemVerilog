// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for the rx fifo module for the USB Lab.

`timescale 1ns / 100ps
module tb_rx_fifo	();

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
	reg	tb_r_enable;
	reg tb_w_enable;
	reg	[7:0] tb_w_data;
	reg	[7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	
	//	DUT port map
	rx_fifo DUT (
		.clk		( tb_clk ),
		.n_rst		( tb_rst ),
		.r_enable	( tb_r_enable ),
		.w_enable	( tb_w_enable ),
		.w_data		( tb_w_data ),
		.r_data		( tb_r_data ),
		.empty		( tb_empty ),
		.full		( tb_full )
	);

	// Test bench process
	initial
	begin
	
		num_testcase = 		1;	

		//	Test case 1


		tb_rst 			= 1'b1;

		tb_r_enable		=	1'b0;
		tb_w_enable		=	1'b0;
		tb_w_data		=	8'b00000000;
		@( negedge tb_clk );

		tb_rst 			= 	1'b0;
		tb_r_enable		=	1'b0;
		tb_w_enable		=	1'b0;
		tb_w_data		=	8'b00000000;

		@( negedge tb_clk );

		assert( tb_empty == 1'b1 )
			$info(	"Test case %d: Passed", num_testcase++ );
		else
			$error( "Test case %d: Failed", num_testcase++ );

		tb_rst = 1'b1;
		tb_r_enable		=	1'b0;
		tb_w_enable		=	1'b1;
		tb_w_data		=	8'b11000011;

		@( negedge tb_clk );
		@( negedge tb_clk );
		assert( tb_full == 1'b0 )
			$info(	"Test case %d: Passed", num_testcase );
		else
			$error( "Test case %d: Failed", num_testcase );
		assert( tb_r_data == 8'b11000011 )
			$info(	"Test case %d: Passed", num_testcase++ );
		else
			$error( "Test case %d: Failed", num_testcase++ );

		@( negedge tb_clk );
		@( negedge tb_clk );
		tb_r_enable = 1'b1;
		tb_w_enable = 1'b0;
		tb_w_data	=	8'b11001100;
		@( negedge tb_clk );
		@( negedge tb_clk );

		assert( tb_empty == 1'b0 )
			$info(	"Test case %d: Passed", num_testcase );
		else
			$error( "Test case %d: Failed", num_testcase );
		assert( tb_r_data == 8'b11000011 )
			$info(	"Test case %d: Passed", num_testcase++ );
		else
			$error( "Test case %d: Failed", num_testcase++ );
	end
endmodule 