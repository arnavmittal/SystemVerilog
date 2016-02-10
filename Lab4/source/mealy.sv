// $Id: $
// File name:   mealy.sv
// Created:     2/9/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the implementation of a mealy model of a 1101 detector FSM.


module mealy
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	typedef enum logic [1:0] { WAITING, RCV1, RCV11, RCV110} state_type;
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
	
	always_comb
	begin
		next_state = state; // DEFAULT CASE
		o = 1'b0;
		case(state)
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
				next_state=(i==1'b1)?RCV1:WAITING;
				if(next_state == RCV1)
				begin
					o = 1'b1;
				end
			end
			default:
			begin
				next_state = WAITING;
			end
		endcase
	end

endmodule 
