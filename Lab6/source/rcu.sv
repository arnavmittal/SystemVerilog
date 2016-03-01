// $Id: $
// File name:   rcu.sv
// Created:     2/29/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the main controller block for USB Receiver lab.

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire d_edge,
	input wire eop,
	input wire shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output wire rcving,
	output wire w_enable,
	output wire r_error
);

	typedef enum logic [3:0] {IDLE, START, CHECK, RCV_START, RCV_DONE, EOP_1, EOP_2, ERR_EOP_1, ERR_EOP_2, EIDLE} state_type;
	state_type state, next_state;
	reg [7:0] SYNC; 
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

	always_comb
	begin
		SYNC={7'b0,1'b1};
		next_state = state; // DEFAULT CASE
		case(state)
			IDLE:
			begin
				if (d_edge == 1'b1)
				begin
						next_state = START;
				end
				else:
				begin
						next_state = IDLE;
				end
			end
			START:
			begin
				if (byte_received == 1'b1)
				begin
						next_state = CHECK;
				end
				else:
				begin
						next_state = START;
				end
			end
			CHECK:
			begin
				if (rcv_data == SYNC)
				begin
						next_state = RCV_START;
				end
				else:
				begin
						next_state = ERR_EOP_1
				end
			end
			RCV_START:
			begin
				if (byte_received == 1'b1)
				begin
						next_state = RCV_DONE;
				end
				else if(shift_enable == 1'b1 && eop == 1'b1)
				begin
						next_state = EIDLE;
				end
				else:
				begin
						next_state = RCV_START;
				end
			end
			RCV_DONE:
			begin
					next_state = EOP_1
			end
			EOP_1:
			begin
				if (shift_enable == 1'b1 && eop == 1'b0)
				begin
						next_state = RCV_START;
				end
				else if(shift_enable == 1'b1 && eop == 1'b1)
				begin
						next_state = EOP_2;
				end
			end
			EOP_2:
			begin
				if (shift_enable == 1'b1 && eop == 1'b1)
				begin
						next_state = IDLE;
				end
				else if(shift_enable == 1'b1)
				begin
						next_state = RCV_START;
				end
			end
			ERR_EOP_1:
			begin
				if (shift_enable == 1'b1 && eop == 1'b1)
				begin
						next_state = ERR_EOP_2;
				end
				else
				begin
						next_state = ERR_EOP_1;
				end
			end
			ERR_EOP_2:
			begin
				if (shift_enable == 1'b1 && eop == 1'b0)
				begin
						next_state = EIDLE;
				end
				else
				begin
						next_state = ERR_EOP_2;
				end
			end
			EIDLE:
			begin
				if (d_edge == 1'b1)
				begin
						next_state = START;
				end
				else
				begin
						next_state = EIDLE;
				end
			end
		endcase
	end
	//{IDLE, START, CHECK, RCV_START, RCV_DONE, EOP_1, EOP_2, ERR_EOP_1, ERR_EOP_2, EIDLE} 
	assign rcving = (state == START) || (state == CHECK) || (state == RCV_START) || (state == RCV_DONE) || (state == EOP_1) || (state == EOP_2) || (state == ERR_EOP_1) || (state == ERR_EOP_2);
	assign w_enable = (state == RCV_DONE)
	assign r_error = (state == ERR_EOP_1) || (state == ERR_EOP_2) || (state == EIDLE);
endmodule 