// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for EOP Detect Module for the USB Lab.
// EOP Detect Test bench 

`timescale 1ns / 100ps

module tb_eop_detect	();

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
	reg tb_dPlus;
	reg tb_dMinus;
	reg tb_eop;

	//	DUT port map
	eop_detect DUT (
		.d_plus		( tb_dPlus ),
		.d_minus	( tb_dMinus ),
		.eop		( tb_eop )
	);

	// Test bench process
	initial
	begin
	
		//	Test case 1
		@( negedge tb_clk );

		num_testcase = 		0;	

		tb_dPlus 		= 	1'b0;
		tb_dMinus 		= 	1'b0;


		@( negedge tb_clk );
		assert( tb_eop == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 2

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b1;
		tb_dMinus 		= 	1'b0;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 3

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b0;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 4

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b1;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		tb_dPlus 		= 	1'b0;
		tb_dMinus 		= 	1'b0;

		@( negedge tb_clk );
		assert( tb_eop == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 2

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b1;
		tb_dMinus 		= 	1'b0;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 3

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b0;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 4

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b1;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

				@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 3

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b0;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 4

		@( negedge tb_clk );

		tb_dPlus 		= 	1'b1;
		tb_dMinus 		= 	1'b1;

		@( negedge tb_clk );
		assert( tb_eop == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

	end

endmodule 