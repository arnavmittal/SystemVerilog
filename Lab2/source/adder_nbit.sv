// $Id: $
// File name:   adder_4bit.sv
// Created:     1/26/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is the 1Bit adder Modules connected together to get the 4 Bit Full Adders
module adder_nbit
#(
  parameter NUM_BITS = 4
)
(

	input wire [(NUM_BITS-1):0] a,
	input wire [(NUM_BITS-1):0] b,
	input wire carry_in,
	output wire [(NUM_BITS-1):0] sum,
	output wire overflow

);

	wire [NUM_BITS:0] carrys;
	genvar i;
	
	assign carrys[0] = carry_in;
	generate
		for(i = 0; i <= (NUM_BITS-1); i = i + 1)
		begin
			always @ (a,b,carry_in)
			begin
				assert((a[i]==1'b1)||(a[i]==1'b0))
				else $error ("Input of 'a' of component is not a digital logic value");

				assert((b[i]==1'b1)||(b[i]==1'b0))
				else $error ("Input of 'b' of component is not a digital logic value");

				assert((carry_in==1'b1)||(carry_in==1'b0))
				else $error ("Input of 'carry_in' of component is not a digital logic value");
			end
			adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
		end
	endgenerate

	assign overflow = carrys[NUM_BITS];

endmodule 
