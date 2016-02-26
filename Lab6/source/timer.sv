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

	flex_counter COUNT1 
	#(4)
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear1),
		.count_enable(d_edge),
		.rollover_val(4'd8),
		.count_out(data_sync),
		.rollover_flag(shift_enable)
	);

	always_comb
	begin
			if(data_sync==4'd3)
			begin
				synced_enable=1'b1;
			end
			else
				synced_enable=1'b0;
			end
	end

	flex_counter COUNT2 
	#(4)
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear2),
		.count_enable(synced_enable),
		.rollover_val(4'd8),
		.count_out(count_out2),
		.rollover_flag(byte_received)
	);

endmodule 