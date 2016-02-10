// $Id: $
// File name:   sensor_d.sv
// Created:     1/22/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is sensor error detector with coding in Dataflow style.


module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);

	assign error = sensors[0] | (sensors[1] & sensors[3]) | (sensors[1] & sensors[2]);
endmodule 