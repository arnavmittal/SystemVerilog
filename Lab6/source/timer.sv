// $Id: $
// File name:   timer.sv
// Created:     2/26/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the timer for USB Receiver Lab.

module timer
(
	input wire clk,
 	input wire n_rst,
	input wire d_edge,
	input wire rcving,
	output reg shift_enable,
	output reg byte_received
);

	reg [3:0] data_sync;
	reg [3:0] count_out2;
	reg synced_enable;
	reg clear1, count2;

	flex_counter #(4) COUNT1 
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(d_edge),
		.count_enable(rcving),
		.rollover_val(4'd8),
		.count_out(data_sync),
	);

assign shift_enable = (data_sync == 3);

	flex_counter #(4) COUNT2 
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(~rcving),
		.count_enable(shift_enable),
		.rollover_val(4'd8),
		.count_out(count_out2),
		.rollover_flag(byte_received)
	);

endmodule 