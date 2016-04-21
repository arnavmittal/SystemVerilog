// Description: This is the Parallel To Serial Shift Register for the TX.

module pts_sr_tx
(
	input wire clk,
	input wire n_rst,
	input wire falling_edge,
	input wire tx_enable,
	input wire load_data,
	input wire [7:0] tx_data,
	output reg tx_out
);

	flex_pts_sr #(8,1) PTS_SR_TX
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(tx_enable && falling_edge),
		.load_enable(load_data),
		.parallel_in(tx_data),
		.serial_out(tx_out)
	);
endmodule 
