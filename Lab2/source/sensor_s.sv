// $Id: $
// File name:   sensor_s.sv
// Created:     1/22/2016
// Author:      Arnav Mittal
// Lab Section: 337-05
// Version:     1.0  Initial Design Entry
// Description: This is sensor error detector with coding in Structural style.

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);

	// Wire declarations for outputs
	wire out_bd;
	wire out_bc;
	wire out_abc;
	
	//making equation with gates
	//gate name start with G1,G2,...
	and G1 (out_bd, sensors[1], sensors[3]);
	and G2 (out_bc, sensors[1], sensors[2]);
	or  G3 (out_abc, out_bc, sensors[0]);
	or  G4 (error, out_abc, out_bd);
	
endmodule
