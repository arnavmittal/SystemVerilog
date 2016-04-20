// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/29/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for a N-Bit Serial-To-Parallel Shift register.

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 0

)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [(NUM_BITS-1):0] parallel_out
);

	integer i;
	reg [(NUM_BITS-1):0] next_state_logic;
	
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) //n_rst == 0
		begin
			for (i=0; i <=(NUM_BITS-1); i++)
			begin
				parallel_out[i] <= 1'b1;
			end 
		end
		else
		begin
			parallel_out <= next_state_logic;
		end
	end	
	
	always_comb
	begin
		if (shift_enable == 1'b1)
		begin
			if (SHIFT_MSB == 0)// SHIFT_MSB = 1 implies data goes LSB
			begin
				next_state_logic = {serial_in,parallel_out[(NUM_BITS-1):1]};
			end
			else// SHIFT_MSB = 0 implies data goes MSB first
			begin
				next_state_logic = {parallel_out[(NUM_BITS-2):0],serial_in};
			end
		end
		else		
		begin
			next_state_logic = parallel_out;
		end
	end
endmodule 
