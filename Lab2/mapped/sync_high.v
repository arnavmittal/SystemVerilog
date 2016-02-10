/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 27 19:27:22 2016
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out)
         );
endmodule

