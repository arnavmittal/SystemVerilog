// $Id: $
// File name:   tb_moore.sv
// Created:     2/9/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for the moore model for FSM for a 1101 detector


`timescale 1ns / 100ps

module tb_moore ();

	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay
	reg tb_clk;
	reg tb_n_rst;
	reg tb_i;
	reg tb_o;
	
	moore DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.i(tb_i),
		.o(tb_o)
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
		//TESTCASE == 1 INITIALIZING ALL THE VALUES
		tb_n_rst = 1'b0;
		tb_i = 1'b0;
		@(posedge tb_clk);

		#1;

		if(tb_o == 1'b0)
			$info("TESTCASE 1 works.");
		else
			$error("TESTCASE 1 initializing doesn't work.");

		//TESTCASE == 2 INPUT = 1
		tb_i = 1'b1;
		tb_n_rst = 1'b1;
		@(posedge tb_clk);

		if(tb_o == 1'b0)
			$info("TESTCASE 2 works.");
		else
			$error("TESTCASE 2 RCV1 doesn't work.");
		
		//TESTCASE == 3 INPUT = 1
		tb_i = 1'b1;
		@(posedge tb_clk);

		if(tb_o == 1'b0)
			$info("TESTCASE 3 works.");
		else
			$error("TESTCASE 3 RCV11 doesn't work.");

		//TESTCASE == 4 INPUT = 0
		tb_i = 1'b0;
		@(posedge tb_clk);

		if(tb_o == 1'b0)
			$info("TESTCASE 4 works.");
		else
			$error("TESTCASE 4 RCV110 doesn't work.");
	
		//TESTCASE == 5 INPUT = 1
		tb_i = 1'b1;
		@(posedge tb_clk);
		#1;
		if(tb_o == 1'b1)
			$info("TESTCASE 5 works.");
		else
			$error("TESTCASE 5 RCV1101 doesn't work.");
		
		@(posedge tb_clk);
	end

endmodule
