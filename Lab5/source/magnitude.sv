// $Id: $
// File name:   magnitude.sv
// Created:     2/17/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the module for doing the 2's complement of the input data in the FIR Filter.
module magnitude
(
	input  wire [16:0] in,
	output wire [15:0] out
);
	reg [16:0]temp;
	
	always_comb
	begin
		if(in[16] == 1'b1)
		begin
			temp = ~in;
			temp += 16'b1;
		end
		else
		begin
			temp = in;
		end
	end
	assign out = temp[15:0];
endmodule 