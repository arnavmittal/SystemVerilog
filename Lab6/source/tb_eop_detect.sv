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
	reg tb_d_eop;
	reg tb_d_minus;
	reg tb_d_plus;

	eop_detect DUT
	(
		.eop  (tb_d_eop),
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
		//----------------------------------------------------------------//
		@(negedge tb_clk);
		tb_d_plus = 1'b0;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_eop == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_d_plus = 1'b0;
		tb_d_minus = 1'b1;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 2 passed");
		else
			$info("-------------------TESTCASE 2 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 3 passed");
		else
			$info("-------------------TESTCASE 3 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		tb_d_plus = 1'b1;
		tb_d_minus = 1'b1;
		@(negedge tb_clk);
		
		if((tb_d_eop == '0))
			$info("-------------------TESTCASE 4 passed");
		else
			$info("-------------------TESTCASE 4 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		@(negedge tb_clk);
		tb_d_plus = 1'b0;
		tb_d_minus = 1'b0;
		@(negedge tb_clk);
		
		if((tb_d_eop == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		@(negedge tb_clk);
		//----------------------------------------------------------------//
	end
endmodule 
