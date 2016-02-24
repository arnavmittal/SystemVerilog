// $Id: $
// File name:   edge_detect.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the Edge Detector Module for the USB Lab.
module edge_detect
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	output reg d_edge 
);

	reg curr_d_plus;
	reg next_d_plus;
	reg curr_d_edge;
	reg next_d_edge;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0)//RESET == 0
		begin
			curr_d_plus <= 1'b1;
			curr_d_edge <= '0; 
		end
		else		//RESET == 1
		begin
			curr_d_plus <= next_d_plus;
			curr_d_edge <= next_d_edge; 
		end
	end

	always_comb
	begin
		next_d_plus = d_plus;
		next_d_edge = curr_d_plus ^ d_plus;
	end
	
	assign d_edge = curr_d_edge;

endmodule 
