/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 25 12:17:20 2016
/////////////////////////////////////////////////////////////


module edge_detect ( clk, n_rst, d_plus, d_edge );
  input clk, n_rst, d_plus;
  output d_edge;
  wire   curr_d_plus, next_d_edge;

  DFFSR curr_d_plus_reg ( .D(d_plus), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        curr_d_plus) );
  DFFSR curr_d_edge_reg ( .D(next_d_edge), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        d_edge) );
  XOR2X1 U6 ( .A(d_plus), .B(curr_d_plus), .Y(next_d_edge) );
endmodule

