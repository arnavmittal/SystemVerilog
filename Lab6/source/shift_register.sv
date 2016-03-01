// $Id: $
// File name:   shift_register.sv
// Created:     2/26/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the Shift register of the USB Receiver Lab
//              which hold the 1 byte of data to be stored in the FIFO.

module shift_register
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire d_orig,
	output reg [7:0] rcv_data
);
	
	flex_stp_sr #(8,0) FLEX_STR_SR 
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(shift_enable),
		.serial_in(d_orig),
		.parallel_out(rcv_data)
	);
	
endmodule