// $Id: $
// File name:   moore.sv
// Created:     2/5/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the implementation of a moore model of a 1101 detector FSM.

module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	typedef enum logic [2:0] { WAITING, RCV1, RCV11, RCV110, RCV1101} state_type;
	state_type state, next_state;
	
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			state <= WAITING;
		end
		else
		begin
			state <= next_state;
		end
	end
	
	always_comb:
	next_state = state // DEFAULT CASE
	case(state):
		WAITING:
		begin
			next_state=(i==1'b1)?RCV1:WAITING;
		end
		RCV1:
		begin
			next_state=(i==1'b1)?RCV11:WAITING;
		end
		RCV11:
		begin
			next_state=(i==1'b0)?RCV110:RCV11;
		end
		RCV110:
		begin
			next_state=(i==1'b1)?RCV1101:WAITING;
		end
		RCV1101:
		begin
			next_state=(i==1'b1)?RCV11:WAITING;
		end

	assign o = (state == RCV1101)? 1'b1 : 1'b0;
endmodule 