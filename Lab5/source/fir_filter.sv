// $Id: $
// File name:   fir_filter.sv
// Created:     2/12/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is my module for the finite impulse response (FIR) filter.

module fir_filter
(
	input  wire clk,
	input  wire n_reset,
	input  wire [15:0] sample_data,	
	input  wire [15:0] fir_coefficient,
	input  wire data_ready,
	input  wire load_coeff,
	output wire one_k_samples,
	output wire modwait,
	output wire [15:0] fir_out,
	output wire err
);


