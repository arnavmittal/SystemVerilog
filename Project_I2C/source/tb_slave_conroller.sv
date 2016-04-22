
`timescale 1ns / 10ps

module tb_slave_controller();

	// Define parameters
	parameter CLK_PERIOD				= 10;
	parameter SCL_PERIOD    = 300;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_start;
	reg tb_stop;
	reg [1:0] tb_address_match;
	reg tb_rw_mode;
	reg tb_SDA_sync;
	reg tb_address_mode;
	reg tb_TX_fifo_empty;
	reg tb_RX_fifo_full;
	reg tb_en_clock_strech;
	reg tb_RX_fifo_almost_full;
	reg tb_byte_received;
	reg tb_ack_prep;
	reg tb_ack_check;
	reg tb_ack_done;
	reg tb_rx_enable;
	reg tb_SCL_out_slave;
	reg tb_busy_slave;
	reg tb_TX_read_enable_slave;
	reg tb_RX_write_enable_slave;
	reg tb_ack_error_set_slave;
	reg [1:0] tb_sda_mode;
	reg tb_load_data;
	reg tb_tx_enable;

	controller DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.start(tb_start),
		.stop(tb_stop),
		.address_match(tb_address_match),
		.rw_mode(tb_rw_mode),
		.SDA_sync(tb_SDA_sync),
		.address_mode(tb_address_mode),
		.TX_fifo_empty(tb_TX_fifo_empty),
		.RX_fifo_full(tb_RX_fifo_full),
		.en_clock_strech(tb_en_clock_strech),
		.RX_fifo_almost_full(tb_RX_fifo_almost_full),
		.byte_received(tb_byte_received),
		.ack_prep(tb_ack_prep),
		.ack_check(tb_ack_check),
		.ack_done(tb_ack_done),
		.rx_enable(tb_rx_enable),
		.SCL_out_slave(tb_SCL_out_slave),
		.busy_slave(tb_busy_slave),
		.TX_read_enable_slave(tb_TX_read_enable_slave),
		.RX_write_enable_slave(tb_RX_write_enable_slave),
		.ack_error_set_slave(tb_ack_error_set_slave),
		.sda_mode(tb_sda_mode),
		.load_data(tb_load_data),
		.tx_enable(tb_tx_enable)
	);
	
endmodule
