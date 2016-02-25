// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for EOP Detect Module for the USB Lab.
// EOP Detect Test bench 

`timescale 1ns / 100ps

module tb_eop_detect ();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_eop;
	reg tb_d_minus;
	reg tb_d_plus;

	eop_detect DUT
	(
		.n_eop  (tb_eop),
		.d_minus (tb_d_minus),
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
		tb_d_plus = 1'b0;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_eop == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		@(negedge tb_clk);
		
		tb_d_plus = 1'b0;
		tb_d_minus = 1'b1;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 2 passed");
		else
			$info("-------------------TESTCASE 2 failed");
		@(negedge tb_clk);

		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 3 passed");
		else
			$info("-------------------TESTCASE 3 failed");
		@(negedge tb_clk);

		tb_d_plus = 1'b1;
		tb_d_minus = 1'b1;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 4 passed");
		else
			$info("-------------------TESTCASE 4 failed");
		@(negedge tb_clk);
	end
endmodule
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE END
/*`timescale 1ns / 100ps

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
*/