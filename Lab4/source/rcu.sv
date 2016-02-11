// $Id: $
// File name:   rcu.sv
// Created:     2/10/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the receiver control unit (RCU) of the UART Module.

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input wire packet_done,
	input wire framing_error,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer
);

	typedef enum logic [2:0] { IDLE, START, SBC, CHECK, VALID} state_type;
	state_type state, next_state;
	
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			state <= IDLE;
		end
		else
		begin
			state <= next_state;
		end
	end

	assign sbc_clear = 1'b0;
	assign sbc_enable = 1'b0;
	assign load_buffer = 1'b0;
	assign enable_timer = 1'b0;	

	always_comb
	begin
		next_state = state; // DEFAULT CASE
		case(state)
			IDLE:
			begin
				if(start_bit_detected == 1'b1)
				begin
					enable_timer = 1'b1;
					sbc_clear = 1'b1;
					next_state = START;
				end
				else
				begin
					next_state = IDLE;
				end
			end
			START:
			begin
				if(packet_done == 1'b1)
				begin
					next_state = SBC;
				end
				else
				begin
					next_state = START;
				end
			end
			SBC:
			begin
				sbc_enable = 1'b1;
				next_state = CHECK;
			end
			CHECK:
			begin
				if(framing_error == 1'b1)
				begin
					next_state = IDLE;
				end
				else
				begin
					next_state = VALID;
				end
			end
			VALID:
			begin
				load_buffer = 1;
				next_state = IDLE;
			end
		endcase	
	end
endmodule
