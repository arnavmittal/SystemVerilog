// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for the Edge Detector Module for USB Lab.
// Edge detect Test bench 
// Edge detect Test bench 

`timescale 1ns / 100ps

module tb_edge_detect	();

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
	reg tb_plus;
	reg tb_edge;

	//	DUT port map
	edge_detect DUT (
	 	.clk		( tb_clk ),
	 	.n_rst		( tb_rst ),
	 	.d_plus		( tb_plus ),
	 	.d_edge		( tb_edge )
	);

	// Test bench process
	initial
	begin
	
		num_testcase = 		0;	

		//	Test case 1: Test reset

		tb_rst 	= 1'b1;
		tb_plus = 1'b1;

		@( negedge tb_clk );

		tb_rst 	= 1'b0;
		tb_plus = 1'b1;		

		@( negedge tb_clk );

		tb_rst 	= 1'b0;
		tb_plus = 1'b0;

		@( negedge tb_clk );
		assert( tb_edge == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 2	:	False Edge

		@( negedge tb_clk );

		tb_rst 	= 1'b1;

		@( negedge tb_clk );
		assert( tb_edge == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 3	:	Edge 0 to 1

		@( negedge tb_clk );
		@( negedge tb_clk );

		tb_plus = 1'b1;

		@( negedge tb_clk );
		assert( tb_edge == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 4 : Edge 1 to 0

		tb_plus = 1'b0;

		@( negedge tb_clk );
		assert( tb_edge == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 5
		@( negedge tb_clk );
		@( negedge tb_clk );
		@( negedge tb_clk );

		tb_plus = 1'b1;
	end
endmodule
