// Description: This is the module for the SDA Selector

module sda_select
(
	input wire [1:0] sda_mode,
	input wire tx_out,
	output reg SDA_out_slave
);

	always_comb
	begin 
		if(sda_mode == 2'b00)		//IDLE
			SDA_out_slave = 1'b1;
		else if(sda_mode == 2'b01)	//ACK
			SDA_out_slave = 1'b0;
		else if(sda_mode == 2'b10)	//NACK
			SDA_out_slave = 1'b1;
		else if(sda_mode == 2'b11)	//TX_OUT
			SDA_out_slave = tx_out;
	end
	
endmodule 
