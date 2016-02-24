// $Id: $
// File name:   eop_detect.sv
// Created:     2/24/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the EOP Detect Module for the USB Lab.
module eop_detect
(
	input wire d_plus,
	input wire d_minus,
	output reg eop
);
	
	always_comb
	begin
		eop = ~(d_plus | d_minus);
	end
	
endmodule 