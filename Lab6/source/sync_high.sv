// $Id: $
// File name:   sync_high.sv
// Created:     1/26/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: It is the the Module for Reset to Logic Low Synchronizer
module sync_high
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);
	
	reg mid;
	always @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			mid <= 1'b1;
			sync_out <= 1'b1;
		end
		else
		begin
			mid <= async_in;
			sync_out <= mid;
		end
	end
endmodule 
