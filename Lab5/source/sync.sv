// $Id: $
// File name:   sync.sv
// Created:     2/17/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: It is the the Module for Reset to Logic Low Synchronizer
module sync
(
	input wire clk,
	input wire n_reset,
	input wire async_in,
	output reg sync_out
);
	
	reg mid;
	always_ff @ (posedge clk, negedge n_reset)
	begin
		if(n_reset == 1'b0)
		begin
			mid <= 1'b0;
			sync_out <= 1'b0;
		end
		else
		begin
			mid <= async_in;
			sync_out <= mid;
		end
	end
endmodule 
