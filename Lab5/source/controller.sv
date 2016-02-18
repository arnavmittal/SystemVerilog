// $Id: $
// File name:   controller.sv
// Created:     2/12/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for the controller of the finite impulse response (FIR) filter.

module controller
(
	input  wire clk,
	input  wire n_reset,
	input  wire dr,
	input  wire lc,
	input  wire overflow,
	
	output reg cnt_up,
	output reg clear,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);
	
	typedef enum logic [4:0] { IDLE, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, SUB1, MUL2, ADD1, MUL3, SUB2, MUL4, ADD2, EIDLE, LOAD1, WAIT1, LOAD2, WAIT2, LOAD3, WAIT3, LOAD4} state_type;
	state_type curr_state, next_state;
	
	reg curr_modwait, next_modwait;

	always_ff @ (posedge clk, negedge n_reset)
	begin
		if(n_reset == 1'b0)
		begin
			curr_state <= IDLE;
			curr_modwait <= 0;
		end
		else
		begin
			curr_state <= next_state;
			curr_modwait <= next_modwait;
		end
	end

	always_comb
	begin
		case(curr_state)
			IDLE:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;
				if(lc == 1'b1)
				begin
					next_state = LOAD1;
					next_modwait = 1'b1;
				end
				else if(dr == 1'b1)
				begin
					next_state = STORE;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = IDLE;
					next_modwait = 1'b0;
				end
			end
			STORE:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b010;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0101;
				err = 1'b0;	
				if(dr == 1'b1)
				begin
					next_state = ZERO;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			ZERO:
			begin
				cnt_up = 1'b1;
				clear = 1'b0;
				op = 3'b101;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;	
				
				next_state = SORT1;
				next_modwait = 1'b1;
			end
			SORT1:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b001;
				src1 = 4'b0010;
				src2 = 4'b0000;
				dest = 4'b0001;
				err = 1'b0;	
				
				next_state = SORT2;
				next_modwait = 1'b1;
			end
			SORT2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b001;
				src1 = 4'b0011;
				src2 = 4'b0000;
				dest = 4'b0010;
				err = 1'b0;	
				
				next_state = SORT3;
				next_modwait = 1'b1;
			end
			SORT3:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b001;
				src1 = 4'b0100;
				src2 = 4'b0000;
				dest = 4'b0011;
				err = 1'b0;	
				
				next_state = SORT4;
				next_modwait = 1'b1;
			end
			SORT4:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b001;
				src1 = 4'b0101;
				src2 = 4'b0000;
				dest = 4'b0100;
				err = 1'b0;	
				
				next_state = MUL1;
				next_modwait = 1'b1;
			end
			MUL1:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b110;
				src1 = 4'b0001;
				src2 = 4'b0110;
				dest = 4'b1010;
				err = 1'b0;	
				
				next_state = SUB1;
				next_modwait = 1'b1;
			end
			SUB1:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b101;
				src1 = 4'b0000;
				src2 = 4'b1010;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(overflow == 1'b0)
				begin
					next_state = MUL2;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			MUL2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b110;
				src1 = 4'b0010;
				src2 = 4'b0111;
				dest = 4'b1010;
				err = 1'b0;	
				
				next_state = ADD1;
				next_modwait = 1'b1;
			end
			ADD1:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b100;
				src1 = 4'b0000;
				src2 = 4'b1010;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(overflow == 1'b0)
				begin
					next_state = MUL3;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			MUL3:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b110;
				src1 = 4'b0011;
				src2 = 4'b1000;
				dest = 4'b1010;
				err = 1'b0;	
				
				next_state = SUB2;
				next_modwait = 1'b1;
			end
			SUB2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b101;
				src1 = 4'b0000;
				src2 = 4'b1010;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(overflow == 1'b0)
				begin
					next_state = MUL4;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			MUL4:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b110;
				src1 = 4'b1001;
				src2 = 4'b0100;
				dest = 4'b1010;
				err = 1'b0;	
				
				next_state = ADD2;
				next_modwait = 1'b1;
			end
			ADD2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b100;
				src1 = 4'b0000;
				src2 = 4'b1010;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(overflow == 1'b0)
				begin
					next_state = IDLE;
					next_modwait = 1'b0;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			EIDLE:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b1;	
				
				if(dr == 1'b1)
				begin
					next_state = IDLE;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = EIDLE;
					next_modwait = 1'b0;
				end
			end
			LOAD1:
			begin
				cnt_up = 1'b0;
				clear = 1'b1;
				op = 3'b011;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0110;
				err = 1'b0;	
				
				next_state = WAIT1;
				next_modwait = 1'b0;
			end
			WAIT1:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(lc == 1'b1)
				begin
					next_state = LOAD2;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = WAIT1;
					next_modwait = 1'b0;
				end
			end
			LOAD2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b011;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0111;
				err = 1'b0;	
				
				next_state = WAIT2;
				next_modwait = 1'b0;
			end
			WAIT2:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(lc == 1'b1)
				begin
					next_state = LOAD3;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = WAIT2;
					next_modwait = 1'b0;
				end
			end
			LOAD3:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b011;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b1000;
				err = 1'b0;	
				
				next_state = WAIT3;
				next_modwait = 1'b0;
			end
			WAIT3:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;	
				
				if(lc == 1'b1)
				begin
					next_state = LOAD4;
					next_modwait = 1'b1;
				end
				else
				begin
					next_state = WAIT3;
					next_modwait = 1'b0;
				end
			end
			LOAD4:
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b011;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b1001;
				err = 1'b0;	
				
				next_state = IDLE;
				next_modwait = 1'b0;
			end
			default
			begin
				cnt_up = 1'b0;
				clear = 1'b0;
				op = 3'b000;
				src1 = 4'b0000;
				src2 = 4'b0000;
				dest = 4'b0000;
				err = 1'b0;	
				next_state = curr_state;				
				next_modwait = curr_modwait;
			end
		endcase	
	end
	assign modwait = curr_modwait;
endmodule
	
