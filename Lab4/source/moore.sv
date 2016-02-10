// $Id: $
// File name:   moore.sv
// Created:     2/5/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the implementation of a moore model of a 1101 detector FSM.

module more
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	