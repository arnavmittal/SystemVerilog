// $Id: $
// File name:   timer.sv
// Created:     2/10/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the timer block for the UART receiving module.


module timer
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output reg shift_strobe,
	output reg packet_done
);

	reg state;
	reg ce2;
	reg [3:0] count1; 
	reg [3:0] count2;
	reg clear1, clear2;

	always_ff@ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 1'b0)
		begin
			state <= 1'b0;
			clear1 = 1'b0;
			clear2 = 1'b0;
		end
		else
		begin
			state <= enable_timer;
			clear1 = packet_done;
			ce2 = shift_strobe;
		end
	end

	flex_counter #(4) DUT 
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear1),
		.count_enable(state),
		.rollover_val(4'b1010),
		.count_out(count1),
		.rollover_flag(shift_strobe)
	);

	flex_counter #(4) DUT1
	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear1),
		.count_enable(ce2),
		.rollover_val(4'b1001),
		.count_out(count2),
		.rollover_flag(packet_done)
	);

	/*always_comb
	begin
		$display("RESET");
		$display(n_rst);	
	end	
	//DEBUG CODE
	always_comb
	begin
		$display("ENABLE TIMER");
		$display(enable_timer);		
		$display("ROLL-FLAG = SHIFT_STROBE");
		$display(shift_strobe);
		$display("COUNT-OUT = COUNT-1");
		$display(count1);
		$display("COUNT_ENABLE");
		$display(state);
		$display("ROLL-FLAG = PACKET-DONE");
		$display(packet_done);
		$display("COUNT-OUT = COUNT-2");
		$display(count2);
		$display("COUNT_ENABLE");
		$display(shift_strobe);
	end*/
endmodule
