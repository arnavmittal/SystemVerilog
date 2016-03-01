// $Id: $
// File name:   decode.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the Decoder Module for the USB Lab.
module decode
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire shift_enable,
	input wire eop,
	output reg d_orig
);

	reg curr_d_plus;
	reg next_d_plus;
	reg curr_d_sync;
	reg next_d_sync;
	reg [1:0] ena;
	reg mid;


	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) //RESET == 0
		begin
			curr_d_plus <= 1'b1;
			curr_d_sync <= 1'b1; 
		end
		else //RESET == 1
		begin
			curr_d_plus <= next_d_plus;
			curr_d_sync <= next_d_sync;
		end
	end
	
	always_comb
	begin
		ena = {shift_enable,eop};
		next_d_sync = d_plus;
		if (ena == 2'b00 | ena == 2'b01)
		begin
			next_d_plus = curr_d_plus;
		end
		else if (ena == 2'b10)
		begin
			next_d_plus = d_plus;
		end
		else
		begin
			next_d_plus = 1'b1;
		end
		
		mid = curr_d_plus ~^ curr_d_sync;
	end
	assign d_orig = mid; 

	/*
	reg curr_d_plus;
	reg next_d_plus;
	reg curr_d_orig;
	reg next_d_orig;
	reg [1:0] ena;
	reg mid;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) //RESET == 0
		begin
			curr_d_plus <= 1'b1;
			curr_d_orig <= 1'b1; 
		end
		else //RESET == 1
		begin
			curr_d_plus <= next_d_plus;
			curr_d_orig <= next_d_orig;
		end
	end
	
	always_comb
	begin
		ena = {shift_enable,eop};
		if (ena == 2'b00 | ena == 2'b01)
		begin
			next_d_plus = curr_d_plus;
		end
		else if (ena == 2'b10)
		begin
			next_d_plus = d_plus;
		end
		else
		begin
			next_d_plus = 1'b1;
		end
		
		mid = curr_d_plus ~^ d_plus;

		if (ena == 2'b11)
		begin
			next_d_orig = 1'b1;
		end
		else
		begin
			next_d_orig = mid;
		end
	end
	assign d_orig = curr_d_orig; 
	*/
endmodule 