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
	reg tb_n_rst;
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
		.eop(tb_eop),
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
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE START
		@(negedge tb_clk);
		tb_shift_enable=1'b0;
		tb_eop =1'b0;
		tb_d_plus=1'b0;
		tb_n_rst = 1'b1;
		@(negedge tb_clk);
		
		tb_n_rst = 1'b0;
		@(negedge tb_clk);

		tb_n_rst = 1'b1;
		
		if((tb_d_orig == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		
		@(negedge tb_clk);
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE END
		//----------------------------------------------------------------//
		tb_d_plus=1'b1;
		@(negedge tb_clk);
		
		tb_d_plus=1'b0;

		if((tb_d_orig == '1))
			$info("-------------------TESTCASE 3 passed");
		else
			$info("-------------------TESTCASE 3 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_shift_enable=1'b1;
		@(negedge tb_clk);
		
		if((tb_d_orig == '1))
			$info("-------------------TESTCASE 4 passed");
		else
			$info("-------------------TESTCASE 4 failed");
		@(negedge tb_clk);
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_d_plus=1'b1;
		@(negedge tb_clk);
		@(negedge tb_clk);
		if((tb_d_orig == '1))
			$info("-------------------TESTCASE 5 passed");
		else
			$info("-------------------TESTCASE 5 failed");
		//----------------------------------------------------------------//
		tb_shift_enable=1'b1;
		tb_eop=1'b1;
		@(negedge tb_clk);
		
		if((tb_d_orig == '1))
			$info("-------------------TESTCASE 6 passed");
		else
			$info("-------------------TESTCASE 6 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_eop=1'b0;
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_d_plus=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_shift_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		//----------------------------------------------------------------//
	end
endmodule
