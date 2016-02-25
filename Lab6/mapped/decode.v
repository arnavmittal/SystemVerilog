/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 25 12:15:35 2016
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   curr_d_plus, next_d_orig, n8, n9, n10, n11, n12;

  DFFSR curr_d_plus_reg ( .D(n8), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        curr_d_plus) );
  DFFSR curr_d_orig_reg ( .D(next_d_orig), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        d_orig) );
  NAND3X1 U12 ( .A(n9), .B(n10), .C(n11), .Y(next_d_orig) );
  XOR2X1 U13 ( .A(d_plus), .B(curr_d_plus), .Y(n11) );
  INVX1 U14 ( .A(shift_enable), .Y(n10) );
  NAND2X1 U15 ( .A(n12), .B(n9), .Y(n8) );
  INVX1 U16 ( .A(eop), .Y(n9) );
  MUX2X1 U17 ( .B(curr_d_plus), .A(d_plus), .S(shift_enable), .Y(n12) );
endmodule

