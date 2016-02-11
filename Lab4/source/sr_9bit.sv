// $Id: $
// File name:   sr_9bit.sv
// Created:     2/10/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the 9 bit shift register that will serially shift in the data received.

module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire shift_strobe,
	output wire [7:0] packet_data,
	output wire stop_bit
);

	reg [8:0]final_out;

	flex_stp_sr #(9,0) DUT(.clk(clk),.n_rst(n_rst),.shift_enable(shift_strobe),.serial_in(serial_in),.parallel_out(final_out));

	assign stop_bit = final_out[8];
	assign packet_data = final_out[7:0];

endmodule