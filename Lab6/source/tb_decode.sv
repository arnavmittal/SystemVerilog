// $Id: $
// File name:   tb_decode.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for the decode block.

`timescale 1ns / 100ps

module tb_decode ();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_rst;
	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;	
	reg tb_d_orig;

	decode DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.shift_enable(tb_shift_enable),
		.rollover_val(tb_rollover_val),
		.count_eop(tb_eop),
		.d_orig(tb_d_orig)
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
		//////////////////////////////////////////////////////TESTCASE 1 RESET CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		tb_count_enable=1'b0;
		tb_rollover_val= 1;
		tb_n_rst=1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0))
			$info("TESTCASE 1 ssdsdsPASSED");
		else
			$info("--------------------sadsadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadasdasPASSED");
		else
			$info("-------------------dsfsddad--------------------TESTCASE 1 FAILED");

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 2 RESET CASE
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_n_rst = 1'b1;	
		@(posedge tb_clk);
		tb_n_rst = 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		@(posedge tb_clk);
		tb_n_rst = 1'b1; 	// Deactivate the chip reset
		@(posedge tb_clk);

		if((tb_rollover_flag == 0))
			$info("TESTCASE 1 ssddwdwdsdsPASSED");
		else
			$info("--------------------sadswdwdwdadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdwwdwdadasdasPASSED");
		else
			$info("-----------------wdwwd--dsfsddad--------------------TESTCASE 1 FAILED");
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 3 CLEAR CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0))
			$info("TESTsdsdaCASE 1 ssdsdsPASSED");
		else
			$info("--------------------sadsdsadsadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadasdasPASSED");
		else
			$info("--------sdsdsd-----------dsfsddad--------------------TESTCASE 1 FAILED");

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 4 COUNT_OUT = ROLLOVER and ROLLOVER_FLAG = 1
		@(posedge tb_clk);
		tb_rollover_val = 3;
		tb_count_enable = 1'b0;
		@(posedge tb_clk);
		tb_count_enable = 1'b1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0))
			$info("TESTCASdsfdsE 1 ssdsdsPASSED");
		else
			$info("--------------------sadsadad--sdfsdfd-----------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadssfsddasdasPASSED");
		else
			$info("-------------------dsfsddad----------sdfdss----------TESTCASE 1 FAILED");

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 5 CLEAR CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0))
			$info("TESTCASE 1 ssdsdsPASSED");
		else
			$info("--------------------sadsadad-------fsfsdfdf------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadasdasPASSED");
		else
			$info("-------------------dsfsddad-----dsfsdsddsfs---------------TESTCASE 1 FAILED");
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 6 COUNT_OUT = 1 and ROLLOVER_FLAG = 0
		@(posedge tb_clk);
		tb_rollover_val = 5;
		tb_count_enable = 1'b0;
		@(posedge tb_clk);
		tb_count_enable = 1'b1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_count_enable = 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);		
		@(posedge tb_clk);
		if((tb_rollover_flag == 0))
			$info("TESTCAdfdfSE 1 ssdsdsPASSED");
		else
			$info("----------------dfdfdsf----saddffdsadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xadfdfsdadasdasPASSED");
		else
			$info("--------------dfdfdfd-----dsfsddad--------------------TESTCASE 1 FAILED");

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE ACTUAL TIMING CHART		
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(negedge tb_clk);
			
		tb_rollover_val = 2;
		tb_n_rst = 1'b1;	
		@(posedge tb_clk);
		tb_n_rst = 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		@(posedge tb_clk);
		@(negedge tb_clk);
		tb_n_rst = 1'b1; 	// Deactivate the chip reset
		@(negedge tb_clk);
		tb_count_enable = 1'b1;		
		@(negedge tb_clk);
		tb_clear = 1'b1;
		@(negedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(negedge tb_clk);
		tb_count_enable = 1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		tb_clear = 1'b1;
		if((tb_rollover_flag == 0))
			$info("TESTCASE 1 ssdsdsPASSED");
		else
			$info("-----sdsdsds---------------sadsadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadasdasPASSED");
		else
			$info("------------sdsdsds-------dsfsddad--------------------TESTCASE 1 FAILED");
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE ACTUAL TIMING CHART		
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(negedge tb_clk);
			
		tb_rollover_val = 10;
		tb_n_rst = 1'b1;	
		@(posedge tb_clk);
		tb_n_rst = 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		@(posedge tb_clk);
		@(negedge tb_clk);
		tb_n_rst = 1'b1; 	// Deactivate the chip reset
		@(negedge tb_clk);
		tb_count_enable = 1'b1;		
		@(negedge tb_clk);
		tb_clear = 1'b1;
		@(negedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(negedge tb_clk);
		tb_count_enable = 1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		tb_clear = 1'b1;
		if((tb_rollover_flag == 0))
			$info("TESTCASE 1 ssdsdsPASSED");
		else
			$info("-----sdsdsds---------------sadsadad-------------------TESTCASE 1 FAILED");
		

		if((tb_count_out == 0))
			$info("TESTCASE 1 xasdadasdasPASSED");
		else
			$info("------------sdsdsds-------dsfsddad--------------------TESTCASE 1 FAILED");
		
	end
endmodule
/*module tb_decode	();

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
	reg	tb_d_plus;
	reg	tb_shift_enable;
	reg tb_eop;	
	reg	tb_d_orig;	
	
	//	DUT port map
	decode DUT (
		.clk			( tb_clk ),    // Clock
		.n_rst			( tb_rst ),
		.d_plus			( tb_d_plus ),
		.shift_enable	( tb_shift_enable ),
		.eop			( tb_eop ),
		.d_orig			( tb_d_orig )	
	);

	// Test bench process
	initial
	begin
	
		num_testcase = 		0;	

		//	Test case 1
		tb_rst 			= 1'b0;
		tb_d_plus 		= 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop 			= 1'b0;

		@( negedge tb_clk );

		assert( tb_d_orig == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 2

		@( negedge tb_clk );
		@( negedge tb_clk );

		tb_rst 			= 1'b1;
		tb_d_plus 		= 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop 			= 1'b1;

		@( negedge tb_clk );

		assert( tb_d_orig == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 3

		tb_d_plus 		= 1'b0;
		tb_eop=1'b0;
		@( negedge tb_clk );
		@( negedge tb_clk );
		tb_shift_enable = 1'b1;
		@( negedge tb_clk );
		tb_shift_enable = 1'b0;
		@( negedge tb_clk );


		assert( tb_d_orig == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 4

		@( negedge tb_clk );
		@( negedge tb_clk );
		@( negedge tb_clk );
		tb_d_plus 		= 1'b1;
		@( negedge tb_clk );
		tb_shift_enable = 1'b1;
		@( negedge tb_clk );
		tb_shift_enable = 1'b0;
		@( negedge tb_clk );
		@( negedge tb_clk );

		assert( tb_d_orig == 1'b1 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

		//	Test case 5

		@( negedge tb_clk );
		@( negedge tb_clk );
		@( negedge tb_clk );

		tb_d_plus = 1'b0;

		@( negedge tb_clk );

		assert( tb_d_orig == 1'b0 )
			$info(	"Test case %d: Passed", ++num_testcase );
		else
			$error( "Test case %d: Failed", ++num_testcase );

	end

endmodule*/
