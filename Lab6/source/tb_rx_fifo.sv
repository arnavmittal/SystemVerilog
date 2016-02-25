// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the test bench for the rx fifo module for the USB Lab.

`timescale 1ns / 100ps

module tb_rx_fifo ();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_n_rst;
	reg tb_r_enable;
	reg tb_w_enable;
	reg [7:0] tb_w_data;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	integer i;
	rx_fifo DUT
	(
		
		.clk (tb_clk),
		.n_rst (tb_n_rst),
		.r_enable (tb_r_enable),
		.w_enable (tb_w_enable),
		.w_data (tb_w_data),
		.r_data (tb_r_data),
		.empty (tb_empty),
		.full (tb_full)
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
		i = 0;
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE START
		@(negedge tb_clk);

		tb_n_rst = 1'b1;
		tb_r_enable = 1'b0;
		tb_w_enable = 1'b0;
		tb_w_data = 8'd0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		tb_n_rst = 1'b0;
		@(negedge tb_clk);
		
		tb_n_rst = 1'b1;
		@(negedge tb_clk);

		if((tb_empty == '1))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE END
		
		//----------------------------------------------------------------//
		//WRITE ENA = 1
		tb_w_enable = 1'b1;
		tb_w_data = 8'b01011111;
		@(negedge tb_clk);

		//WRITE ENA = 0
		tb_w_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);

		//READ ENA = 1
		tb_r_enable=1'b1;
		@(negedge tb_clk);

		//READ ENA = 0
		tb_r_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		if((tb_r_data == 8'b01011111))
			$info("-------------------TESTCASE 1 passed");
		else
			$info("-------------------TESTCASE 1 failed");

		//----------------------------------------------------------------//
		//WRITE ENA = 1
		tb_w_enable = 1'b1;
		tb_w_data = 8'b00001111;
		@(negedge tb_clk);

		//WRITE ENA = 0
		tb_w_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		//------------------------------------//
		//WRITE ENA = 1
		tb_w_enable = 1'b1;
		tb_w_data = 8'b11110000;
		@(negedge tb_clk);

		//WRITE ENA = 0
		tb_w_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		//------------------------------------//
		//WRITE ENA = 1
		tb_w_enable = 1'b1;
		tb_w_data = 8'b11111111;
		@(negedge tb_clk);

		//WRITE ENA = 0
		tb_w_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		//----------------------------------------------------------------//
		
		//READ ENA = 1
		tb_r_enable=1'b1;
		@(negedge tb_clk);

		//READ ENA = 0
		tb_r_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		if((tb_r_data == 8'b00001111))
			$info("-------------------TESTCASE 2 passed");
		else
			$info("-------------------TESTCASE 2 failed");
		
		@(negedge tb_clk);
		@(negedge tb_clk);
		//------------------------------------//
		//READ ENA = 1
		tb_r_enable=1'b1;
		@(negedge tb_clk);

		//READ ENA = 0
		tb_r_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		if((tb_r_data == 8'b11110000))
			$info("-------------------TESTCASE 3 passed");
		else
			$info("-------------------TESTCASE 3 failed");
		
		@(negedge tb_clk);
		@(negedge tb_clk);
		//-------------------------------------//
		//READ ENA = 1
		tb_r_enable=1'b1;
		@(negedge tb_clk);

		//READ ENA = 0
		tb_r_enable=1'b0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		if((tb_r_data == 8'b11111111))
			$info("-------------------TESTCASE 4 passed");
		else
			$info("-------------------TESTCASE 4 failed");
		
		@(negedge tb_clk);
		@(negedge tb_clk);
		//-------------------------------------//
		
		for(i=0;i<2000000;i++)
		begin
			@(negedge tb_clk);
			tb_w_enable=1'b1;
			if (tb_full == 1'b1)
			begin
				break;
			end				
		end

		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE START
		@(negedge tb_clk);

		tb_n_rst = 1'b1;
		tb_r_enable = 1'b0;
		tb_w_enable = 1'b0;
		tb_w_data = 8'd0;
		@(negedge tb_clk);
		@(negedge tb_clk);
		@(negedge tb_clk);
		
		tb_n_rst = 1'b0;
		@(negedge tb_clk);
		
		tb_n_rst = 1'b1;
		@(negedge tb_clk);

		if((tb_empty == '1))
			$info("-------------------TESTCASE 5 passed");
		else
			$info("-------------------TESTCASE 5 failed");
		/////////////////////////////////////////////////////////////////////////////////////////////RESET CASE END

	end
endmodule
