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

module tb_edge_detect ();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_edge;
	reg tb_d_plus;

	edge_detect DUT
	(
		.clk (tb_clk),
		.n_rst  (tb_n_rst),
		.d_edge (tb_d_edge),
		.d_plus (tb_d_plus)
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
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE START
		@(negedge tb_clk);
		tb_d_plus = 1'b1;
		tb_n_rst = 1'b1;
		@(negedge tb_clk);
		
		tb_n_rst = 1'b0;
		@(negedge tb_clk);

		tb_n_rst = 1'b1;
		@(negedge tb_clk);
		
		if((tb_d_plus == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		
		if((tb_d_edge == '0))
			$info("-------------------TESTCASE 2 passed");
		else
			$info("-------------------TESTCASE 2 failed");

		@(negedge tb_clk);
		@(negedge tb_clk);
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE END
		//----------------------------------------------------------------//
		tb_d_plus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_edge == '1))
			$info("-------------------TESTCASE 3 passed");
		else
			$info("-------------------TESTCASE 3 failed");

		tb_d_plus=1'b1;
		@(negedge tb_clk);
		
		if((tb_d_edge == '1))
			$info("-------------------TESTCASE 4 passed");
		else
			$info("-------------------TESTCASE 4 failed");


		@(negedge tb_clk);
		
		if((tb_d_edge == '0))
			$info("-------------------TESTCASE 5 passed");
		else
			$info("-------------------TESTCASE 5 failed");
	end
endmodule

		//----------------------------------------------------------------//

/*`timescale 1ns / 100ps

module tb_edge_detect	();

	//	Default Config Test Variables and Constants
	localparam SIZE = 4;
	localparam CLK_PERIOD = 10.4;
	localparam DELAY = 1;
	reg tb_clk;	

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
endmodule*/
