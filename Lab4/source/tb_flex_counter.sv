// $Id: $
// File name:   tb_flex_counter.sv
// Created:     2/2/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for Flexible and Scalable Counter with COntrolled Rollover.


`timescale 1ns / 100ps

module tb_flex_counter ();

	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay
	localparam  	NUM_CNT_BITS	= 4;
	
	reg tb_clk;
	reg tb_n_rst;
	reg tb_clear;
	reg tb_count_enable;
	reg [(NUM_CNT_BITS-1):0] tb_rollover_val;
	reg [(NUM_CNT_BITS-1):0] tb_count_out;
	reg tb_rollover_flag;
	integer testcase;

	flex_counter DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.clear(tb_clear),
		.count_enable(tb_count_enable),
		.rollover_val(tb_rollover_val),
		.count_out(tb_count_out),
		.rollover_flag(tb_rollover_flag)
	);
	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	clocking cb @(posedge tb_clk);
 		// 1step means 1 time precision unit, 100ps for this module. We assume the hold time is less than 200ps.
		default input #1step output #100ps; // Setup time (01CLK -> 10D) is 94 ps
		output #800ps n_rst = tb_n_rst; // FIXME: Removal time (01CLK -> 01R) is 281.25ps, but this needs to be 800 to prevent metastable value warnings
		output clear = tb_clear,
			count_enable = tb_count_enable,
			rollover_val = tb_rollover_val;
		input count_out = tb_count_out,
			rollover_flag = tb_rollover_flag;
	endclocking
	
	initial
	begin
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 1 CLEAR CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0) && (tb_count_out == 0))
			$info("TESTCASE 1 PASSED");
		else
			$info("---------------------------------------TESTCASE 1 FAILED");

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

		if((tb_rollover_flag == 0) && (tb_count_out == 0))
			$info("TESTCASE 2 PASSED");
		else
			$info("---------------------------------------TESTCASE 2 FAILED");
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 3 CLEAR CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0) && (tb_count_out == 0))
			$info("TESTCASE 3 PASSED");
		else
			$info("---------------------------------------TESTCASE 3 FAILED");

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

		if((tb_rollover_flag == 1) && (tb_count_out == tb_rollover_val))
			$info("TESTCASE 4 PASSED");
		else
			$info("---------------------------------------TESTCASE 4 FAILED");

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////TESTCASE 5 CLEAR CASE
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0) && (tb_count_out == 0))
			$info("TESTCASE 5 PASSED");
		else
			$info("---------------------------------------TESTCASE 5 FAILED");

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
		@(posedge tb_clk);
		tb_count_enable = 1'b0;
		@(posedge tb_clk);

		if((tb_rollover_flag == 0) && (tb_count_out == 1))
			$info("TESTCASE 6 PASSED");
		else
			$info("---------------------------------------TESTCASE 6 FAILED");

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
		
	end
endmodule
