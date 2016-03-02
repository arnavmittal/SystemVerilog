// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     3/1/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the tb for usb receiver.
// Timer Test bench 
// Timer Test bench 

`timescale 1ns / 100ps

module tb_usb_receiver();

	localparam	CLK_PERIOD	= 10.4;
	localparam	CHECK_DELAY 	= 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;
	reg tb_rcving;
	reg tb_r_error;

	usb_receiver USB_RECEIVER
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.d_minus(tb_d_minus),
		.r_enable(tb_r_enable),
		.r_data(tb_r_data),
		.empty(tb_empty),
		.full(tb_full),
		.rcving(tb_rcving),
		.r_error(tb_r_error)
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
			tb_n_rst = 1'b1;
			tb_d_plus= 1'b1;
			tb_d_minus=1'b0;
			tb_r_enable=1'b0;
			@(negedge tb_clk);
	end
endmodule 
