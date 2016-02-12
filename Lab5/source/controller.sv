// $Id: $
// File name:   controller.sv
// Created:     2/12/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the controller of the finite impulse response (FIR) filter.

module controller
(
	input  wire clk,
	input  wire n_reset,
	input  wire dr,
	input  wire lc,
	input  wire overflow,
	
	output reg cnt_up,
	output reg clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

	
