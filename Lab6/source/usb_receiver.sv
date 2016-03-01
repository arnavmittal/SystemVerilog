// $Id: $
// File name:   usb_receiver.sv
// Created:     2/26/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the wrapper file calling all the blocks for the USB Receiver to work appropriately following the block diagram.


module usb_receiver 
(
	input wire clk,
	input wire n_rst,
	input wire d_plus,
	input wire d_minus,
	input wire r_enable
	output reg [7:0]r_data,
	output reg empty,
	output reg full,
	output reg rcving,
	output reg r_error
);

	reg sync_d_plus;
	reg sync_d_minus;
	reg eop;
	reg d_edge;
	reg rcving;
	reg shift_enable;
	reg byte_received;
	reg d_orig;
	reg [7:0] rcv_data;
	reg r_enable;	
	reg w_enable;			
	reg empty;	
	reg full;

	//-----------------------------------Sync High d_plus
	sync_high SYNC_D_PLUS
	(
		.clk(clk),
		.n_rst(n_rst),
		.async_in(d_plus),
		.sync_out(sync_d_plus)
	);

	//-----------------------------------Sync low d_minus
	sync_low SYNC_D_MINUS
	(
		.clk(clk),
		.n_rst(n_rst),
		.async_in(d_minus),
		.sync_out(sync_d_minus)
	);
	
	//-----------------------------------EOP Detect 
	eop_detect EOP_DETECT
	(
		.d_plus(sync_d_plus),
		.d_minus(sync_d_minus),
		.eop(eop)
	);

	//-----------------------------------Edge Detect
	edge_detct EDGE_DETECT
	(
		.clk(clk),
		.n_rst(n_rst),
		.d_plus(sync_d_plus),
		.d_edge(d_edge)
	);

	//-----------------------------------Timer	
	timer Timer
	(
		.clk(clk),
 		.n_rst(n_rst),
		.d_edge(d_edge),
		.rcving(rcving),
		.shift_enable(shift_enable),
		.byte_received(byte_received)
	);

	//-----------------------------------Decode
	decode DECODE
	(
		.clk(clk),
		.n_rst(n_rst),
		.d_plus(sync_d_plus),
		.shift_enable(shift_enable),
		.eop(eop),
		.d_orig(d_orig)
	);

	//-----------------------------------Shift Register
	shift_register SHIFT_REGISTER
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(shift_enable),
		.d_orig(d_orig),
		.rcv_data(rcv_data)
	);

	//-----------------------------------RX FIFO
	rx_fifo RX_FIFO
	(
		.clk(clk),
		.n_rst(n_rst),
		.r_enable(r_enable),
		.w_enable(w_enable),
		.w_data(rcv_data),
		.r_data(r_data),
		.empty(empty),
		.full(full)
	);

	
	//-----------------------------------RCU

	rcu RCU
	(
		.clk(clk),
		.n_rst(n_rst),
		.d_edge(d_edge),
		.eop(eop),
		.shift_enable(shift_enable),
		.rcv_data(rcv_data),
		.byte_received(byte_received),
		.rcving(rcving),
		.w_enable(w_enable),
		.r_error(r_error)
	);
endmodule 