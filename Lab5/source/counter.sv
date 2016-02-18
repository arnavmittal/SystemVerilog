// $Id: $
// File name:   counter.sv
// Created:     2/17/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the one_k_samples Output in the FIR Filter.
module counter
(
	input wire clk,
	input wire n_reset,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);

	reg [9:0] count1;

	flex_counter #(10) COUNTER 
	(
		.clk(clk),
		.n_rst(n_reset),
		.clear(clear),
		.count_enable(cnt_up),
		.rollover_val(10'd1000),
		.count_out(count1),
		.rollover_flag(one_k_samples)
	);
endmodule 