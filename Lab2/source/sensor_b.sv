// $Id: $
// File name:   sensor_b.sv
// Created:     1/22/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is sensor error detector with coding in Behavioural style.

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);

	always_comb
	begin
		error = sensors[0] | (sensors[1] & sensors[3]) | (sensors[1] & sensors[2]);
	end

endmodule 
