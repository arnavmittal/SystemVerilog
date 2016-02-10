// $Id: $
// File name:   tb_moore.sv
// Created:     2/9/2016
// Author:      Shubham Sandeep Rastogi
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Testbench for moore

`timescale 1ns / 10ps

module tb_moore ();
	localparam	CLK_PERIOD	= 2.5;
	localparam	NUM_CNT_BITS	= 4;
	reg tb_clk;
	reg tb_i;
	reg tb_o;
	reg tb_n_rst;
	moore DUT
	(
		.n_rst(tb_n_rst),
		.clk(tb_clk),
		.o(tb_o),
		.i(tb_i)
		
	);
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	initial
	begin
		//TEST 1
		tb_i = 1'b0;
		tb_n_rst = 1'b0;
		@(posedge tb_clk);
		if(tb_o == 0)
			$info("Test 1 passed");
		else
			$error("Test 1 failed");
		//Test 2
		tb_i = 1'b0;
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		if(tb_o == 0)
			$info("Test 2 passed");
		else
			$error("Test 2 failed");
		//Test 3
		tb_i = 1'b1;
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		if(tb_o == 0)
		begin
			tb_i = 1'b1;
			tb_n_rst = 1'b1;
			@(posedge tb_clk);
			if(tb_o == 0)
			begin
				tb_i = 1'b0;
				tb_n_rst = 1'b1;
				@(posedge tb_clk);
				if(tb_o == 0)
				begin
					tb_i = 1'b1;
					tb_n_rst = 1'b0;
					@(posedge tb_clk);
					#1
					if(tb_o == 0)
						$info("Test 3 passed");
					else
						$error("Test 3.1 fail");
				end
				else
					$error("Test 3.2 failed");
			end
			else
				$error("Test 3.3 failed");
		end
		else
			$error("Test 3.4 failed");
		//Test 4
		tb_i = 1'b1;
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		#1
		if(tb_o == 0)
		begin
			tb_i = 1'b1;
			tb_n_rst = 1'b1;
			@(posedge tb_clk);
			#1
			if(tb_o == 0)
			begin
				tb_i = 1'b0;
				tb_n_rst = 1'b1;
				@(posedge tb_clk);
				#1
				if(tb_o == 0)
				begin
					tb_i = 1'b1;
					tb_n_rst = 1'b1;
					@(posedge tb_clk);
					#1
					if(tb_o == 1)
						$info("Test 4 passed");
					else
						$error("Test 4.1 fail");
				end
				else
					$error("Test 4.2 failed");
			end
			else
				$error("Test 4.3 failed");
		end
		else
			$error("Test 4.4 failed");
		//Test 5
		tb_i = 1'b1;
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		#1
		if(tb_o == 0)
		begin
			tb_i = 1'b0;
			tb_n_rst = 1'b1;
			@(posedge tb_clk);
			#1
			if(tb_o == 0)
			begin
				tb_i = 1'b1;
				tb_n_rst = 1'b1;
				@(posedge tb_clk);
				#1
				if(tb_o == 1)	
					$info("Test 5 passed");
				else
					$error("Test 5.1 failed");
			end
			else
				$error("Test 5.2 failed");
		end
		else
			$error("Test 5.3 failed");
	end
endmodule
		
