// $Id: $
// File name:   timer.sv
// Created:     2/10/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the timer block for the UART receiving module.

module timer
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output wire shift_strobe,
	output wire packet_done
);

	reg state;
	reg [3:0] count1, count2;

	always_ff@ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			state <= 1'b0;
		end
		else
		begin
			state <= enable_timer;
		end
	end

	flex_counter #(.NUM_BITS(4)) DUT(.clk(clk),.n_rst(n_rst),.clear(packet_done),.count_enable(state),.rollover_val(4'b1010),.count_out(count1),.rollover_flag(shift_strobe));
	flex_counter #(.NUM_BITS(4)) DUT(.clk(clk),.n_rst(n_rst),.clear(packet_done),.count_enable(shift_strobe),.rollover_val(4'b1001),.count_out(count2),.rollover_flag(packet_done));

endmodule 
