// Description: This is the Serial To Parallel Shift Register for the RX.

module stp_sr_rx
(
	input wire clk,
	input wire n_rst,
	input wire SDA_sync,
	input wire rising_edge,
	input wire rx_enable,
	output reg [7:0] rx_data
);

	flex_stp_sr #(8,1) STP_SR_RX
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(rx_enable && rising_edge),
		.serial_in(SDA_sync),
		.parallel_out(rx_data)
	);
endmodule 
