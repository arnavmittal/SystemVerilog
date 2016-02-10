/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 27 18:30:56 2016
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

