// Description: This is the module for the Main Controller

module controller
(
	input wire clk,
	input wire n_rst,
	input wire start,
	input wire stop,
	input wire [1:0] address_match,
	input wire rw_mode,
	input wire SDA_sync,
	input wire address_mode,	// 7 bit or 10 bit mode
	input wire TX_fifo_empty,
	input wire RX_fifo_full,
	input wire en_clock_strech,
	input wire RX_fifo_almost_full,
	input wire byte_received,
	input wire ack_prep,
	input wire ack_check,
	input wire ack_done

	output reg rx_enable,
	output reg SCL_out_slave,
	output reg busy_slave,
	output reg TX_read_enable_slave,
	output reg RX_write_enable_slave,
	output reg ack_error_set_slave,
	output reg [1:0] sda_mode,
	output reg load_data,
	output reg tx_enable,
);

	typedef enum logic [4:0] {IDLE, GET_ADDR_1, CHECK_ADDR_1, NO_MATCH, ACK_SEND_1, GET_ADDR_2, CHECK_ADDR_2, ACK_SEND_2, FIFO_CHK_TX, LOAD, DATA_START, DATA_STOP, ACK_CHECK, READ_ENABLE, RE_NACK, RE_ACK, FIFO_CHK_RX, SEND_1, SEND_2, SEND_3, END_STATE} state_type;
	state_type state, next_state;

	always @(posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0)
		begin
			scl_mid1 <= 1'b0;
			scl_mid2 <= 1'b0;
			sda_mid1 <= 1'b0;
			sda_mid2 <= 1'b0;
			rw_mode <= 1'b0;
			address_match <= 1'b0;
			start <= 1'b0;
			stop <= 1'b0;
		end
		else
		begin
			scl_mid1 <= SCL_sync;
			scl_mid2 <= scl_mid1;
			sda_mid1 <= SDA_sync;
			sda_mid2 <= sda_mid1;
			rw_mode <= rx_data[0];
			address_match <= temp_address_match;
			start <= (scl_mid1 && scl_mid2 && !sda_mid1 && sda_mid2) ? 1'b1 : 1'b0;
			stop <= (scl_mid1 && scl_mid2 && sda_mid1 && !sda_mid2) ? 1'b1 : 1'b0;
		end
	end


	always_comb
	begin 
		if(address_mode == 1'b0)	// 7 Bit Mode
		begin 
			temp_address_match[1] = (rx_data[7:1] == bus_address[6:0]) ? 1'b1 : 1'b0;
			temp_address_match[0] = 0;
		end
		else
		begin 
			temp_address_match[1] = (rx_data[2:1] == bus_address[9:8]) ? 1'b1 : 1'b0;
			temp_address_match[0] = (rx_data[7:0] == bus_address[7:0]) ? 1'b1 : 1'b0;
		end
	end
	
endmodule 
