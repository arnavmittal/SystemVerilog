/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Feb  5 13:14:18 2016
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83;

  DFFSR \curr_count_reg[0]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \curr_count_reg[1]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \curr_count_reg[2]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \curr_count_reg[3]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR curr_rollover_flag_reg ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U42 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n46) );
  OAI22X1 U43 ( .A(n51), .B(n48), .C(n52), .D(n50), .Y(n45) );
  XOR2X1 U44 ( .A(n53), .B(n49), .Y(n52) );
  NAND2X1 U45 ( .A(count_out[1]), .B(n54), .Y(n53) );
  OAI22X1 U46 ( .A(n55), .B(n48), .C(n56), .D(n50), .Y(n44) );
  XNOR2X1 U47 ( .A(n57), .B(n58), .Y(n56) );
  INVX1 U48 ( .A(count_out[2]), .Y(n55) );
  OAI22X1 U49 ( .A(n59), .B(n48), .C(n60), .D(n50), .Y(n43) );
  INVX1 U50 ( .A(n61), .Y(n50) );
  XOR2X1 U51 ( .A(n62), .B(n63), .Y(n60) );
  NOR2X1 U52 ( .A(n57), .B(n58), .Y(n63) );
  NAND2X1 U53 ( .A(count_out[2]), .B(n54), .Y(n58) );
  NAND2X1 U54 ( .A(n49), .B(count_out[1]), .Y(n57) );
  AND2X1 U55 ( .A(count_out[0]), .B(n54), .Y(n49) );
  INVX1 U56 ( .A(n64), .Y(n48) );
  INVX1 U57 ( .A(count_out[3]), .Y(n59) );
  OAI21X1 U58 ( .A(n65), .B(n66), .C(n67), .Y(n42) );
  NAND2X1 U59 ( .A(rollover_flag), .B(n64), .Y(n67) );
  NAND2X1 U60 ( .A(n68), .B(n69), .Y(n66) );
  MUX2X1 U61 ( .B(n62), .A(count_out[3]), .S(n70), .Y(n69) );
  OAI21X1 U62 ( .A(n71), .B(rollover_val[2]), .C(rollover_val[3]), .Y(n70) );
  INVX1 U63 ( .A(n72), .Y(n71) );
  NAND2X1 U64 ( .A(count_out[3]), .B(n54), .Y(n62) );
  NAND3X1 U65 ( .A(n73), .B(n74), .C(n75), .Y(n54) );
  AOI21X1 U66 ( .A(rollover_val[1]), .B(n51), .C(n76), .Y(n75) );
  XNOR2X1 U67 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n74) );
  XNOR2X1 U68 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n73) );
  MUX2X1 U69 ( .B(n77), .A(n78), .S(rollover_val[0]), .Y(n68) );
  OAI21X1 U70 ( .A(count_out[1]), .B(n79), .C(n47), .Y(n78) );
  INVX1 U71 ( .A(count_out[0]), .Y(n47) );
  INVX1 U72 ( .A(rollover_val[1]), .Y(n79) );
  OAI21X1 U73 ( .A(n72), .B(n51), .C(count_out[0]), .Y(n77) );
  NAND3X1 U74 ( .A(n61), .B(n80), .C(n81), .Y(n65) );
  MUX2X1 U75 ( .B(n76), .A(n82), .S(n72), .Y(n81) );
  NOR2X1 U76 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n82) );
  OAI21X1 U77 ( .A(rollover_val[1]), .B(n51), .C(n83), .Y(n76) );
  OAI21X1 U78 ( .A(n83), .B(n51), .C(n72), .Y(n80) );
  NOR2X1 U79 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n72) );
  INVX1 U80 ( .A(count_out[1]), .Y(n51) );
  XNOR2X1 U81 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n83) );
  NOR2X1 U82 ( .A(n64), .B(clear), .Y(n61) );
  NOR2X1 U83 ( .A(count_enable), .B(clear), .Y(n64) );
endmodule

