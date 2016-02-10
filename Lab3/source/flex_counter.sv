// $Id: $
// File name:   flex_counter.sv
// Created:     2/2/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for Flexible and Scalable counter with a Controlled Rollover


module flex_counter

#(
	parameter NUM_CNT_BITS = 4
)

(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [(NUM_CNT_BITS-1):0] rollover_val,
	output wire [(NUM_CNT_BITS-1):0]count_out,
	output reg rollover_flag
);
	reg [(NUM_CNT_BITS-1):0] next_count;
	reg [(NUM_CNT_BITS-1):0] curr_count;
	reg next_rollover_flag;
	reg curr_rollover_flag;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) //RESET == 0
		begin
			curr_rollover_flag <= 1'b0;
			curr_count <= '0; 
		end
		else //RESET == 1
		begin
			curr_rollover_flag <= next_rollover_flag;
			curr_count <= next_count; 
		end
	end

	always_comb
	begin
		next_count = curr_count;//CHANGED FROM 0;
		next_rollover_flag = curr_rollover_flag;//CHANGED FROM 0;
		if(clear == 1'b1) //CLEAR == 1
		begin
			next_count = '0;
			next_rollover_flag = '0;
		end
		else //CLEAR == 0
		begin
			if(count_enable == 1'b1) //COUNT_ENABLE == 1
			begin
				next_count = curr_count+1;
				next_rollover_flag = 1'b0;

				if (curr_count == rollover_val - 1)
				begin
					next_rollover_flag = 1'b1;
				end
				if (curr_count == rollover_val )
				begin
					next_rollover_flag = 1'b0;
					next_count = 1'b1;
				end
			end
		end
	end

	assign count_out = curr_count;
	assign rollover_flag = curr_rollover_flag;
endmodule 
