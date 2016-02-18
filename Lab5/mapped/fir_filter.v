/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 17 23:13:16 2016
/////////////////////////////////////////////////////////////


module sync_1 ( clk, n_reset, async_in, sync_out );
  input clk, n_reset, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n_reset), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n_reset), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_0 ( clk, n_reset, async_in, sync_out );
  input clk, n_reset, async_in;
  output sync_out;
  wire   mid;

  DFFSR mid_reg ( .D(async_in), .CLK(clk), .R(n_reset), .S(1'b1), .Q(mid) );
  DFFSR sync_out_reg ( .D(mid), .CLK(clk), .R(n_reset), .S(1'b1), .Q(sync_out)
         );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N17, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, N42, N41, N40, N39, N38, N37, N36,
         N35, N34, N33, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n91, n92, n93, n94,
         n95, n96, n97, n98;

  DFFSR \curr_count_reg[9]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \curr_count_reg[8]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \curr_count_reg[7]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \curr_count_reg[6]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \curr_count_reg[5]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \curr_count_reg[4]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \curr_count_reg[3]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \curr_count_reg[2]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \curr_count_reg[1]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \curr_count_reg[0]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR curr_rollover_flag_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AOI22X1 U28 ( .A(n36), .B(n37), .C(rollover_flag), .D(n38), .Y(n35) );
  NOR2X1 U29 ( .A(n39), .B(n40), .Y(n37) );
  NAND3X1 U30 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  XNOR2X1 U31 ( .A(count_out[3]), .B(N7), .Y(n43) );
  XNOR2X1 U32 ( .A(count_out[7]), .B(N11), .Y(n42) );
  XNOR2X1 U33 ( .A(count_out[5]), .B(N9), .Y(n41) );
  NAND3X1 U34 ( .A(n44), .B(n1), .C(n46), .Y(n39) );
  NOR2X1 U35 ( .A(N14), .B(n32), .Y(n46) );
  XNOR2X1 U36 ( .A(count_out[9]), .B(N13), .Y(n44) );
  NOR2X1 U37 ( .A(n47), .B(n48), .Y(n36) );
  NAND3X1 U38 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  XNOR2X1 U39 ( .A(count_out[1]), .B(N5), .Y(n51) );
  XNOR2X1 U40 ( .A(count_out[0]), .B(N4), .Y(n50) );
  XNOR2X1 U41 ( .A(count_out[4]), .B(N8), .Y(n49) );
  NAND3X1 U42 ( .A(n52), .B(n53), .C(n54), .Y(n47) );
  XNOR2X1 U43 ( .A(count_out[6]), .B(N10), .Y(n54) );
  XNOR2X1 U44 ( .A(count_out[2]), .B(N6), .Y(n53) );
  XNOR2X1 U45 ( .A(count_out[8]), .B(N12), .Y(n52) );
  OAI21X1 U46 ( .A(n97), .B(n98), .C(n55), .Y(n81) );
  NAND2X1 U47 ( .A(N19), .B(n1), .Y(n55) );
  OAI21X1 U48 ( .A(n96), .B(n98), .C(n56), .Y(n82) );
  NAND2X1 U49 ( .A(N20), .B(n1), .Y(n56) );
  OAI21X1 U50 ( .A(n95), .B(n98), .C(n57), .Y(n83) );
  NAND2X1 U51 ( .A(N21), .B(n1), .Y(n57) );
  OAI21X1 U52 ( .A(n94), .B(n98), .C(n58), .Y(n84) );
  NAND2X1 U53 ( .A(N22), .B(n1), .Y(n58) );
  OAI21X1 U54 ( .A(n93), .B(n98), .C(n59), .Y(n85) );
  NAND2X1 U55 ( .A(N23), .B(n1), .Y(n59) );
  OAI21X1 U56 ( .A(n92), .B(n98), .C(n60), .Y(n86) );
  NAND2X1 U57 ( .A(N24), .B(n1), .Y(n60) );
  OAI21X1 U58 ( .A(n91), .B(n98), .C(n61), .Y(n87) );
  NAND2X1 U59 ( .A(N25), .B(n1), .Y(n61) );
  OAI21X1 U60 ( .A(n34), .B(n98), .C(n62), .Y(n88) );
  NAND2X1 U61 ( .A(N26), .B(n1), .Y(n62) );
  OAI21X1 U62 ( .A(n33), .B(n98), .C(n63), .Y(n89) );
  NAND2X1 U63 ( .A(N27), .B(n1), .Y(n63) );
  OAI21X1 U64 ( .A(n30), .B(n98), .C(n64), .Y(n90) );
  NAND2X1 U65 ( .A(N28), .B(n1), .Y(n64) );
  NOR2X1 U66 ( .A(n38), .B(clear), .Y(n45) );
  NOR2X1 U67 ( .A(clear), .B(count_enable), .Y(n38) );
  NAND3X1 U68 ( .A(n65), .B(n66), .C(n67), .Y(N17) );
  NOR2X1 U69 ( .A(n68), .B(n69), .Y(n67) );
  NAND2X1 U70 ( .A(n70), .B(n71), .Y(n69) );
  XNOR2X1 U71 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n71) );
  XNOR2X1 U72 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n70) );
  NAND3X1 U73 ( .A(n72), .B(n73), .C(n74), .Y(n68) );
  XNOR2X1 U74 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n74) );
  XNOR2X1 U75 ( .A(count_out[7]), .B(rollover_val[7]), .Y(n73) );
  XNOR2X1 U76 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n72) );
  NOR2X1 U77 ( .A(n75), .B(n76), .Y(n66) );
  NAND2X1 U78 ( .A(n77), .B(n78), .Y(n76) );
  XNOR2X1 U79 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n78) );
  XNOR2X1 U80 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n77) );
  XNOR2X1 U81 ( .A(rollover_val[2]), .B(n95), .Y(n75) );
  NOR2X1 U82 ( .A(n79), .B(n80), .Y(n65) );
  XNOR2X1 U83 ( .A(rollover_val[0]), .B(n97), .Y(n80) );
  XNOR2X1 U84 ( .A(rollover_val[1]), .B(n96), .Y(n79) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_69_aco ( .A({N42, N41, N40, N39, 
        N38, N37, N36, N35, N34, N33}), .SUM({N28, N27, N26, N25, N24, N23, 
        N22, N21, N20, N19}) );
  INVX2 U7 ( .A(n38), .Y(n98) );
  BUFX2 U15 ( .A(n45), .Y(n1) );
  AND2X1 U16 ( .A(count_out[0]), .B(N17), .Y(N33) );
  AND2X1 U17 ( .A(count_out[1]), .B(N17), .Y(N34) );
  AND2X1 U18 ( .A(count_out[2]), .B(N17), .Y(N35) );
  AND2X1 U19 ( .A(count_out[3]), .B(N17), .Y(N36) );
  AND2X1 U20 ( .A(count_out[4]), .B(N17), .Y(N37) );
  AND2X1 U21 ( .A(count_out[5]), .B(N17), .Y(N38) );
  AND2X1 U22 ( .A(count_out[6]), .B(N17), .Y(N39) );
  AND2X1 U23 ( .A(count_out[7]), .B(N17), .Y(N40) );
  AND2X1 U24 ( .A(count_out[8]), .B(N17), .Y(N41) );
  AND2X1 U25 ( .A(N17), .B(count_out[9]), .Y(N42) );
  NOR2X1 U26 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n3) );
  NAND2X1 U27 ( .A(n3), .B(n27), .Y(n4) );
  NOR2X1 U85 ( .A(n4), .B(rollover_val[3]), .Y(n6) );
  NAND2X1 U86 ( .A(n6), .B(n26), .Y(n7) );
  NOR2X1 U87 ( .A(n7), .B(rollover_val[5]), .Y(n9) );
  NAND2X1 U88 ( .A(n9), .B(n29), .Y(n10) );
  NOR2X1 U89 ( .A(n10), .B(rollover_val[7]), .Y(n23) );
  NAND2X1 U90 ( .A(n23), .B(n28), .Y(n24) );
  NOR2X1 U91 ( .A(n24), .B(rollover_val[9]), .Y(N14) );
  AOI21X1 U92 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n3), .Y(n2) );
  OAI21X1 U93 ( .A(n3), .B(n27), .C(n4), .Y(N6) );
  AOI21X1 U94 ( .A(n4), .B(rollover_val[3]), .C(n6), .Y(n5) );
  OAI21X1 U95 ( .A(n6), .B(n26), .C(n7), .Y(N8) );
  AOI21X1 U96 ( .A(n7), .B(rollover_val[5]), .C(n9), .Y(n8) );
  OAI21X1 U97 ( .A(n9), .B(n29), .C(n10), .Y(N10) );
  AOI21X1 U98 ( .A(n10), .B(rollover_val[7]), .C(n23), .Y(n22) );
  OAI21X1 U99 ( .A(n23), .B(n28), .C(n24), .Y(N12) );
  AOI21X1 U100 ( .A(n24), .B(rollover_val[9]), .C(N14), .Y(n25) );
  INVX2 U101 ( .A(rollover_val[4]), .Y(n26) );
  INVX2 U102 ( .A(rollover_val[2]), .Y(n27) );
  INVX2 U103 ( .A(rollover_val[0]), .Y(N4) );
  INVX2 U104 ( .A(n2), .Y(N5) );
  INVX2 U105 ( .A(rollover_val[8]), .Y(n28) );
  INVX2 U106 ( .A(rollover_val[6]), .Y(n29) );
  INVX2 U107 ( .A(n8), .Y(N9) );
  INVX2 U108 ( .A(n22), .Y(N11) );
  INVX2 U109 ( .A(n25), .Y(N13) );
  INVX2 U110 ( .A(n5), .Y(N7) );
  INVX2 U111 ( .A(count_out[9]), .Y(n30) );
  INVX2 U112 ( .A(n35), .Y(n31) );
  INVX2 U113 ( .A(N17), .Y(n32) );
  INVX2 U114 ( .A(count_out[8]), .Y(n33) );
  INVX2 U115 ( .A(count_out[7]), .Y(n34) );
  INVX2 U116 ( .A(count_out[6]), .Y(n91) );
  INVX2 U117 ( .A(count_out[5]), .Y(n92) );
  INVX2 U118 ( .A(count_out[4]), .Y(n93) );
  INVX2 U119 ( .A(count_out[3]), .Y(n94) );
  INVX2 U120 ( .A(count_out[2]), .Y(n95) );
  INVX2 U121 ( .A(count_out[1]), .Y(n96) );
  INVX2 U122 ( .A(count_out[0]), .Y(n97) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 COUNTER ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n121, n122, n123, n124, n125, n126, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161;
  wire   [4:0] curr_state;

  DFFSR \curr_state_reg[0]  ( .D(n126), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr_state[0]) );
  DFFSR \curr_state_reg[3]  ( .D(n122), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr_state[3]) );
  DFFSR \curr_state_reg[2]  ( .D(n123), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr_state[2]) );
  DFFSR \curr_state_reg[1]  ( .D(n124), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr_state[1]) );
  DFFSR \curr_state_reg[4]  ( .D(n125), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        curr_state[4]) );
  DFFSR curr_modwait_reg ( .D(n121), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        modwait) );
  INVX1 U9 ( .A(n140), .Y(n7) );
  INVX2 U10 ( .A(n7), .Y(n8) );
  AND2X1 U11 ( .A(n97), .B(n45), .Y(n37) );
  INVX1 U12 ( .A(n89), .Y(n9) );
  INVX2 U13 ( .A(n65), .Y(n29) );
  NAND2X1 U14 ( .A(n89), .B(n35), .Y(n10) );
  INVX8 U15 ( .A(n19), .Y(n65) );
  BUFX4 U16 ( .A(curr_state[3]), .Y(n19) );
  OR2X1 U17 ( .A(n84), .B(n67), .Y(n11) );
  NAND2X1 U18 ( .A(n11), .B(overflow), .Y(n68) );
  AND2X1 U19 ( .A(n68), .B(n36), .Y(n69) );
  NAND2X1 U20 ( .A(n94), .B(n95), .Y(n12) );
  NAND2X1 U21 ( .A(n50), .B(n13), .Y(n126) );
  INVX2 U22 ( .A(n12), .Y(n13) );
  BUFX4 U23 ( .A(n29), .Y(n14) );
  AND2X1 U24 ( .A(n152), .B(n36), .Y(n21) );
  INVX2 U25 ( .A(curr_state[0]), .Y(n25) );
  AND2X2 U26 ( .A(curr_state[0]), .B(n66), .Y(n15) );
  AND2X2 U27 ( .A(n120), .B(n140), .Y(n16) );
  AND2X2 U28 ( .A(n76), .B(n160), .Y(n17) );
  AND2X2 U29 ( .A(n118), .B(n88), .Y(n18) );
  NAND2X1 U30 ( .A(n49), .B(n18), .Y(n122) );
  AND2X1 U31 ( .A(n86), .B(n47), .Y(n49) );
  OR2X2 U32 ( .A(n109), .B(n108), .Y(n123) );
  INVX1 U33 ( .A(curr_state[3]), .Y(n54) );
  INVX1 U34 ( .A(n45), .Y(n20) );
  INVX2 U35 ( .A(n45), .Y(n83) );
  INVX2 U36 ( .A(n64), .Y(n22) );
  NAND2X1 U37 ( .A(n41), .B(n21), .Y(src1[1]) );
  AND2X2 U38 ( .A(n65), .B(n37), .Y(n42) );
  AND2X1 U39 ( .A(n103), .B(n161), .Y(n90) );
  INVX2 U40 ( .A(n54), .Y(n23) );
  INVX2 U41 ( .A(n30), .Y(n24) );
  INVX1 U42 ( .A(n16), .Y(n26) );
  INVX1 U43 ( .A(n26), .Y(n27) );
  INVX1 U44 ( .A(n25), .Y(n28) );
  INVX1 U45 ( .A(n66), .Y(n30) );
  AND2X1 U46 ( .A(n30), .B(n25), .Y(n44) );
  INVX1 U47 ( .A(n151), .Y(n115) );
  INVX1 U48 ( .A(n57), .Y(n31) );
  INVX4 U49 ( .A(n46), .Y(n97) );
  AND2X1 U50 ( .A(n127), .B(n96), .Y(n53) );
  INVX1 U51 ( .A(n96), .Y(src1[3]) );
  NAND2X1 U52 ( .A(n52), .B(n15), .Y(n32) );
  AND2X2 U53 ( .A(n32), .B(n33), .Y(n48) );
  AND2X1 U54 ( .A(n153), .B(n96), .Y(n33) );
  INVX1 U55 ( .A(src1[2]), .Y(n101) );
  AND2X2 U56 ( .A(n25), .B(n66), .Y(n34) );
  AND2X2 U57 ( .A(n25), .B(n66), .Y(n35) );
  INVX1 U58 ( .A(overflow), .Y(n142) );
  BUFX2 U59 ( .A(n153), .Y(n36) );
  INVX1 U60 ( .A(src1[0]), .Y(n154) );
  AND2X2 U61 ( .A(n46), .B(n45), .Y(n38) );
  INVX1 U62 ( .A(n38), .Y(n64) );
  AND2X2 U63 ( .A(n65), .B(n97), .Y(n39) );
  INVX1 U64 ( .A(n39), .Y(n58) );
  AND2X2 U65 ( .A(n15), .B(n42), .Y(n40) );
  AND2X1 U66 ( .A(n52), .B(n44), .Y(n43) );
  AND2X2 U67 ( .A(n10), .B(n128), .Y(n41) );
  INVX4 U68 ( .A(n48), .Y(src2[2]) );
  INVX1 U69 ( .A(n120), .Y(n84) );
  BUFX4 U70 ( .A(curr_state[1]), .Y(n45) );
  BUFX4 U71 ( .A(curr_state[2]), .Y(n46) );
  BUFX2 U72 ( .A(n8), .Y(n47) );
  AND2X2 U73 ( .A(n86), .B(n47), .Y(n50) );
  BUFX2 U74 ( .A(n20), .Y(n51) );
  INVX2 U75 ( .A(n153), .Y(src2[0]) );
  AND2X2 U76 ( .A(n38), .B(n65), .Y(n52) );
  INVX1 U77 ( .A(src2[1]), .Y(n138) );
  INVX1 U78 ( .A(src2[2]), .Y(n118) );
  INVX2 U79 ( .A(curr_state[4]), .Y(n66) );
  NAND3X1 U80 ( .A(n46), .B(n65), .C(n83), .Y(n104) );
  INVX2 U81 ( .A(n104), .Y(n89) );
  NAND2X1 U82 ( .A(n15), .B(n89), .Y(n151) );
  NAND2X1 U83 ( .A(n52), .B(n35), .Y(n129) );
  NAND2X1 U84 ( .A(n151), .B(n129), .Y(src1[2]) );
  NAND3X1 U85 ( .A(n15), .B(n39), .C(n20), .Y(n134) );
  INVX2 U86 ( .A(n134), .Y(n112) );
  NAND2X1 U87 ( .A(n35), .B(n97), .Y(n55) );
  OAI21X1 U88 ( .A(n51), .B(n55), .C(n101), .Y(n56) );
  NOR2X1 U89 ( .A(n112), .B(n56), .Y(n74) );
  NAND3X1 U90 ( .A(n66), .B(curr_state[0]), .C(n23), .Y(n57) );
  INVX2 U91 ( .A(n57), .Y(n87) );
  NAND3X1 U92 ( .A(n46), .B(n87), .C(n83), .Y(n96) );
  NAND2X1 U93 ( .A(n44), .B(n42), .Y(n76) );
  INVX2 U94 ( .A(n76), .Y(n111) );
  NOR2X1 U95 ( .A(src1[3]), .B(n111), .Y(n73) );
  NAND2X1 U96 ( .A(n22), .B(n31), .Y(n110) );
  NAND2X1 U97 ( .A(n28), .B(n30), .Y(n63) );
  INVX2 U98 ( .A(n63), .Y(n60) );
  NAND2X1 U99 ( .A(n60), .B(n42), .Y(n77) );
  INVX2 U100 ( .A(n77), .Y(n100) );
  OAI21X1 U101 ( .A(n45), .B(n58), .C(n9), .Y(n59) );
  NAND2X1 U102 ( .A(n60), .B(n59), .Y(n78) );
  INVX2 U103 ( .A(n78), .Y(n61) );
  MUX2X1 U104 ( .B(n100), .A(n61), .S(lc), .Y(n62) );
  OAI21X1 U105 ( .A(dr), .B(n110), .C(n62), .Y(n71) );
  OAI22X1 U106 ( .A(n24), .B(n65), .C(n64), .D(n63), .Y(n149) );
  INVX2 U107 ( .A(n149), .Y(n98) );
  NAND3X1 U108 ( .A(n46), .B(n14), .C(n34), .Y(n120) );
  NAND3X1 U109 ( .A(n14), .B(n35), .C(n51), .Y(n132) );
  INVX2 U110 ( .A(n132), .Y(n67) );
  NAND3X1 U111 ( .A(n83), .B(n97), .C(n87), .Y(n153) );
  OAI21X1 U112 ( .A(n98), .B(n51), .C(n69), .Y(n70) );
  NOR2X1 U113 ( .A(n71), .B(n70), .Y(n72) );
  NAND3X1 U114 ( .A(n74), .B(n73), .C(n72), .Y(n124) );
  NAND3X1 U115 ( .A(n35), .B(n39), .C(n51), .Y(n91) );
  INVX2 U116 ( .A(lc), .Y(n75) );
  NAND2X1 U117 ( .A(n89), .B(n44), .Y(n119) );
  OAI21X1 U118 ( .A(n91), .B(n75), .C(n119), .Y(n81) );
  NAND3X1 U119 ( .A(n44), .B(n39), .C(n20), .Y(n160) );
  NAND2X1 U120 ( .A(n78), .B(n77), .Y(n150) );
  INVX2 U121 ( .A(n150), .Y(n79) );
  NAND3X1 U122 ( .A(n98), .B(n17), .C(n79), .Y(n80) );
  OR2X1 U123 ( .A(n81), .B(n80), .Y(n125) );
  NAND2X1 U124 ( .A(n15), .B(n52), .Y(n127) );
  NAND2X1 U125 ( .A(n110), .B(n134), .Y(n148) );
  INVX2 U126 ( .A(dr), .Y(n82) );
  AOI22X1 U127 ( .A(n148), .B(n82), .C(overflow), .D(n84), .Y(n85) );
  NAND2X1 U128 ( .A(n84), .B(n51), .Y(n141) );
  NAND2X1 U129 ( .A(n141), .B(n85), .Y(n109) );
  INVX2 U130 ( .A(n109), .Y(n86) );
  NAND3X1 U131 ( .A(n14), .B(n97), .C(n34), .Y(n140) );
  NAND3X1 U132 ( .A(n31), .B(n45), .C(n97), .Y(n128) );
  INVX2 U133 ( .A(n128), .Y(n136) );
  AOI21X1 U134 ( .A(n14), .B(n149), .C(n136), .Y(n88) );
  NAND2X1 U135 ( .A(n89), .B(n35), .Y(n103) );
  NAND2X1 U136 ( .A(n35), .B(n42), .Y(n161) );
  NAND3X1 U137 ( .A(n119), .B(n90), .C(n17), .Y(n130) );
  INVX2 U138 ( .A(n130), .Y(n95) );
  INVX2 U139 ( .A(n91), .Y(n139) );
  AOI21X1 U140 ( .A(dr), .B(n139), .C(n150), .Y(n92) );
  OAI21X1 U141 ( .A(lc), .B(n92), .C(n129), .Y(n93) );
  AOI21X1 U142 ( .A(n28), .B(n149), .C(n93), .Y(n94) );
  OAI21X1 U143 ( .A(n98), .B(n97), .C(n96), .Y(n99) );
  AOI21X1 U144 ( .A(n100), .B(lc), .C(n99), .Y(n102) );
  NAND2X1 U145 ( .A(n102), .B(n101), .Y(n106) );
  NAND2X1 U146 ( .A(n15), .B(n42), .Y(n152) );
  NAND3X1 U147 ( .A(n152), .B(n104), .C(n41), .Y(n105) );
  NOR2X1 U148 ( .A(n106), .B(n105), .Y(n107) );
  OAI21X1 U149 ( .A(n142), .B(n47), .C(n107), .Y(n108) );
  INVX2 U150 ( .A(n110), .Y(err) );
  NOR2X1 U151 ( .A(n112), .B(n111), .Y(n114) );
  NOR2X1 U152 ( .A(n40), .B(n43), .Y(n113) );
  NAND3X1 U153 ( .A(n114), .B(n151), .C(n113), .Y(dest[0]) );
  NOR2X1 U154 ( .A(src2[2]), .B(n115), .Y(n116) );
  NAND3X1 U155 ( .A(n17), .B(n41), .C(n116), .Y(dest[1]) );
  NAND3X1 U156 ( .A(n17), .B(n129), .C(n134), .Y(dest[2]) );
  NOR2X1 U157 ( .A(n136), .B(n43), .Y(n117) );
  NAND3X1 U158 ( .A(n119), .B(n118), .C(n117), .Y(dest[3]) );
  NAND3X1 U159 ( .A(n127), .B(n153), .C(n16), .Y(src2[1]) );
  NAND2X1 U160 ( .A(n128), .B(n27), .Y(src2[3]) );
  NAND3X1 U161 ( .A(n53), .B(n129), .C(n41), .Y(src1[0]) );
  NOR2X1 U162 ( .A(src1[2]), .B(n130), .Y(n133) );
  NOR2X1 U163 ( .A(n40), .B(n43), .Y(n131) );
  NAND3X1 U164 ( .A(n133), .B(n132), .C(n131), .Y(op[0]) );
  INVX2 U165 ( .A(dest[3]), .Y(n135) );
  NAND3X1 U166 ( .A(n17), .B(n135), .C(n134), .Y(op[1]) );
  NOR2X1 U167 ( .A(n136), .B(src1[3]), .Y(n137) );
  NAND3X1 U168 ( .A(n161), .B(n138), .C(n137), .Y(op[2]) );
  OAI21X1 U169 ( .A(lc), .B(dr), .C(n139), .Y(n146) );
  INVX2 U170 ( .A(n47), .Y(n144) );
  INVX2 U171 ( .A(n141), .Y(n143) );
  OAI21X1 U172 ( .A(n144), .B(n143), .C(n142), .Y(n145) );
  NAND2X1 U173 ( .A(n146), .B(n145), .Y(n147) );
  AOI21X1 U174 ( .A(dr), .B(n148), .C(n147), .Y(n159) );
  AOI22X1 U175 ( .A(lc), .B(n150), .C(modwait), .D(n149), .Y(n158) );
  NAND2X1 U176 ( .A(n152), .B(n151), .Y(n156) );
  NAND3X1 U177 ( .A(n161), .B(n154), .C(n36), .Y(n155) );
  NOR2X1 U178 ( .A(n156), .B(n155), .Y(n157) );
  NAND3X1 U179 ( .A(n157), .B(n158), .C(n159), .Y(n121) );
  INVX2 U180 ( .A(n160), .Y(clear) );
  INVX2 U181 ( .A(n161), .Y(cnt_up) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_20_b0/carry[15] , \sub_add_20_b0/carry[14] ,
         \sub_add_20_b0/carry[13] , \sub_add_20_b0/carry[12] ,
         \sub_add_20_b0/carry[11] , \sub_add_20_b0/carry[10] ,
         \sub_add_20_b0/carry[9] , \sub_add_20_b0/carry[8] ,
         \sub_add_20_b0/carry[7] , \sub_add_20_b0/carry[6] ,
         \sub_add_20_b0/carry[5] , \sub_add_20_b0/carry[4] ,
         \sub_add_20_b0/carry[3] , \sub_add_20_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  INVX1 U4 ( .A(in[13]), .Y(n16) );
  XOR2X1 U5 ( .A(n18), .B(\sub_add_20_b0/carry[15] ), .Y(N17) );
  AND2X1 U6 ( .A(n17), .B(\sub_add_20_b0/carry[14] ), .Y(
        \sub_add_20_b0/carry[15] ) );
  XOR2X1 U7 ( .A(\sub_add_20_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U8 ( .A(n16), .B(\sub_add_20_b0/carry[13] ), .Y(
        \sub_add_20_b0/carry[14] ) );
  XOR2X1 U9 ( .A(\sub_add_20_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U10 ( .A(n15), .B(\sub_add_20_b0/carry[12] ), .Y(
        \sub_add_20_b0/carry[13] ) );
  XOR2X1 U11 ( .A(\sub_add_20_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U12 ( .A(n14), .B(\sub_add_20_b0/carry[11] ), .Y(
        \sub_add_20_b0/carry[12] ) );
  XOR2X1 U13 ( .A(\sub_add_20_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U14 ( .A(n13), .B(\sub_add_20_b0/carry[10] ), .Y(
        \sub_add_20_b0/carry[11] ) );
  XOR2X1 U15 ( .A(\sub_add_20_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U16 ( .A(n12), .B(\sub_add_20_b0/carry[9] ), .Y(
        \sub_add_20_b0/carry[10] ) );
  XOR2X1 U17 ( .A(\sub_add_20_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U18 ( .A(n11), .B(\sub_add_20_b0/carry[8] ), .Y(
        \sub_add_20_b0/carry[9] ) );
  XOR2X1 U19 ( .A(\sub_add_20_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U20 ( .A(n10), .B(\sub_add_20_b0/carry[7] ), .Y(
        \sub_add_20_b0/carry[8] ) );
  XOR2X1 U21 ( .A(\sub_add_20_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U38 ( .A(n9), .B(\sub_add_20_b0/carry[6] ), .Y(
        \sub_add_20_b0/carry[7] ) );
  XOR2X1 U39 ( .A(\sub_add_20_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U40 ( .A(n8), .B(\sub_add_20_b0/carry[5] ), .Y(
        \sub_add_20_b0/carry[6] ) );
  XOR2X1 U41 ( .A(\sub_add_20_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U42 ( .A(n7), .B(\sub_add_20_b0/carry[4] ), .Y(
        \sub_add_20_b0/carry[5] ) );
  XOR2X1 U43 ( .A(\sub_add_20_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U44 ( .A(n6), .B(\sub_add_20_b0/carry[3] ), .Y(
        \sub_add_20_b0/carry[4] ) );
  XOR2X1 U45 ( .A(\sub_add_20_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U46 ( .A(n5), .B(\sub_add_20_b0/carry[2] ), .Y(
        \sub_add_20_b0/carry[3] ) );
  XOR2X1 U47 ( .A(\sub_add_20_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U48 ( .A(n4), .B(n3), .Y(\sub_add_20_b0/carry[2] ) );
  XOR2X1 U49 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U50 ( .A(N2), .Y(n3) );
  INVX2 U51 ( .A(in[1]), .Y(n4) );
  INVX2 U52 ( .A(in[2]), .Y(n5) );
  INVX2 U53 ( .A(in[3]), .Y(n6) );
  INVX2 U54 ( .A(in[4]), .Y(n7) );
  INVX2 U55 ( .A(in[5]), .Y(n8) );
  INVX2 U56 ( .A(in[6]), .Y(n9) );
  INVX2 U57 ( .A(in[7]), .Y(n10) );
  INVX2 U58 ( .A(in[8]), .Y(n11) );
  INVX2 U59 ( .A(in[9]), .Y(n12) );
  INVX2 U60 ( .A(in[10]), .Y(n13) );
  INVX2 U61 ( .A(in[11]), .Y(n14) );
  INVX2 U62 ( .A(in[12]), .Y(n15) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n1), .B(n2), .C(n3), .Y(w_en) );
  NOR2X1 U7 ( .A(n3), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n2), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n2), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n1), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n3), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n2), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[1]), .Y(n1) );
  INVX2 U4 ( .A(op[2]), .Y(n2) );
  INVX2 U5 ( .A(op[0]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n57, n59, n61, n62, n63, n64, n65, n67, n69, n70, n71, n72,
         n73, n74, n76, n78, n80, n82, n84, n86, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185;

  FAX1 U3 ( .A(A[15]), .B(n89), .C(n74), .YC(n16), .YS(DIFF[15]) );
  XNOR2X1 U5 ( .A(n169), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n184), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n184), .Y(n1) );
  NAND2X1 U12 ( .A(n90), .B(A[14]), .Y(n21) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n76), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(n91), .Y(n23) );
  NAND2X1 U18 ( .A(A[13]), .B(n91), .Y(n24) );
  XNOR2X1 U19 ( .A(n168), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n30), .B(n183), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n183), .Y(n3) );
  NAND2X1 U26 ( .A(n92), .B(A[12]), .Y(n29) );
  XOR2X1 U27 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n78), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(n93), .Y(n31) );
  NAND2X1 U32 ( .A(A[11]), .B(n93), .Y(n32) );
  XNOR2X1 U33 ( .A(n38), .B(n5), .Y(DIFF[10]) );
  AOI21X1 U34 ( .A(n182), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n182), .Y(n5) );
  NAND2X1 U40 ( .A(n94), .B(A[10]), .Y(n37) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n80), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(n95), .Y(n39) );
  NAND2X1 U46 ( .A(A[9]), .B(n95), .Y(n40) );
  XNOR2X1 U47 ( .A(n171), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n179), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n179), .Y(n7) );
  NAND2X1 U54 ( .A(n96), .B(A[8]), .Y(n45) );
  XOR2X1 U55 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n82), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(n97), .Y(n47) );
  NAND2X1 U60 ( .A(A[7]), .B(n97), .Y(n48) );
  XNOR2X1 U61 ( .A(n170), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n54), .B(n181), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n181), .Y(n9) );
  NAND2X1 U68 ( .A(n98), .B(A[6]), .Y(n53) );
  XOR2X1 U69 ( .A(n164), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n57), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n56), .B(n84), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(n99), .Y(n55) );
  NAND2X1 U74 ( .A(A[5]), .B(n99), .Y(n56) );
  XNOR2X1 U75 ( .A(n173), .B(n11), .Y(DIFF[4]) );
  AOI21X1 U76 ( .A(n180), .B(n62), .C(n59), .Y(n57) );
  NAND2X1 U79 ( .A(n61), .B(n180), .Y(n11) );
  NAND2X1 U82 ( .A(n100), .B(A[4]), .Y(n61) );
  XOR2X1 U83 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  OAI21X1 U84 ( .A(n65), .B(n63), .C(n64), .Y(n62) );
  NAND2X1 U85 ( .A(n64), .B(n86), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(n101), .Y(n63) );
  NAND2X1 U88 ( .A(A[3]), .B(n101), .Y(n64) );
  AOI21X1 U90 ( .A(n166), .B(n70), .C(n67), .Y(n65) );
  NAND2X1 U93 ( .A(n69), .B(n166), .Y(n13) );
  NAND2X1 U96 ( .A(n102), .B(A[2]), .Y(n69) );
  XOR2X1 U97 ( .A(n14), .B(n185), .Y(DIFF[1]) );
  OAI21X1 U98 ( .A(n71), .B(n185), .C(n72), .Y(n70) );
  NAND2X1 U99 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(n103), .Y(n71) );
  NAND2X1 U102 ( .A(A[1]), .B(n103), .Y(n72) );
  XNOR2X1 U103 ( .A(A[0]), .B(n104), .Y(DIFF[0]) );
  NOR2X1 U104 ( .A(n104), .B(A[0]), .Y(n73) );
  INVX1 U125 ( .A(B[12]), .Y(n92) );
  INVX2 U126 ( .A(n17), .Y(n74) );
  BUFX2 U127 ( .A(n57), .Y(n164) );
  BUFX2 U128 ( .A(n25), .Y(n165) );
  BUFX2 U129 ( .A(n73), .Y(n185) );
  OR2X2 U130 ( .A(n102), .B(A[2]), .Y(n166) );
  INVX1 U131 ( .A(B[14]), .Y(n90) );
  INVX1 U132 ( .A(B[0]), .Y(n104) );
  BUFX2 U133 ( .A(n41), .Y(n167) );
  BUFX2 U134 ( .A(n30), .Y(n168) );
  BUFX2 U135 ( .A(n22), .Y(n169) );
  BUFX2 U136 ( .A(n54), .Y(n170) );
  BUFX2 U137 ( .A(n46), .Y(n171) );
  INVX1 U138 ( .A(n62), .Y(n172) );
  INVX2 U139 ( .A(n172), .Y(n173) );
  INVX1 U140 ( .A(B[8]), .Y(n96) );
  FAX1 U141 ( .A(A[15]), .B(n89), .C(n74), .YC(n174) );
  XOR2X1 U142 ( .A(n105), .B(B[16]), .Y(n175) );
  XOR2X1 U143 ( .A(n174), .B(n175), .Y(DIFF[16]) );
  NAND2X1 U144 ( .A(n16), .B(n105), .Y(n176) );
  NAND2X1 U145 ( .A(n16), .B(B[16]), .Y(n177) );
  NAND2X1 U146 ( .A(n105), .B(B[16]), .Y(n178) );
  NAND3X1 U147 ( .A(n177), .B(n176), .C(n178), .Y(n15) );
  XOR2X1 U148 ( .A(n165), .B(n2), .Y(DIFF[13]) );
  XOR2X1 U149 ( .A(n167), .B(n6), .Y(DIFF[9]) );
  XNOR2X1 U150 ( .A(n70), .B(n13), .Y(DIFF[2]) );
  OR2X1 U151 ( .A(n96), .B(A[8]), .Y(n179) );
  OR2X1 U152 ( .A(n100), .B(A[4]), .Y(n180) );
  OR2X1 U153 ( .A(n98), .B(A[6]), .Y(n181) );
  OR2X1 U154 ( .A(n94), .B(A[10]), .Y(n182) );
  OR2X1 U155 ( .A(n92), .B(A[12]), .Y(n183) );
  OR2X1 U156 ( .A(n90), .B(A[14]), .Y(n184) );
  INVX1 U157 ( .A(B[15]), .Y(n89) );
  INVX1 U158 ( .A(B[4]), .Y(n100) );
  INVX1 U159 ( .A(B[5]), .Y(n99) );
  INVX1 U160 ( .A(B[7]), .Y(n97) );
  INVX1 U161 ( .A(B[3]), .Y(n101) );
  INVX1 U162 ( .A(B[13]), .Y(n91) );
  INVX1 U163 ( .A(B[1]), .Y(n103) );
  INVX1 U164 ( .A(B[11]), .Y(n93) );
  INVX1 U165 ( .A(B[9]), .Y(n95) );
  INVX2 U166 ( .A(B[6]), .Y(n98) );
  INVX2 U167 ( .A(B[10]), .Y(n94) );
  INVX2 U168 ( .A(n71), .Y(n88) );
  INVX2 U169 ( .A(n63), .Y(n86) );
  INVX2 U170 ( .A(n55), .Y(n84) );
  INVX2 U171 ( .A(n47), .Y(n82) );
  INVX2 U172 ( .A(n39), .Y(n80) );
  INVX2 U173 ( .A(n31), .Y(n78) );
  INVX2 U174 ( .A(n23), .Y(n76) );
  INVX2 U175 ( .A(n69), .Y(n67) );
  INVX2 U176 ( .A(n61), .Y(n59) );
  INVX2 U177 ( .A(n53), .Y(n51) );
  INVX2 U178 ( .A(n45), .Y(n43) );
  INVX2 U179 ( .A(n37), .Y(n35) );
  INVX2 U180 ( .A(n29), .Y(n27) );
  INVX2 U181 ( .A(n21), .Y(n19) );
  INVX2 U182 ( .A(A[17]), .Y(n105) );
  INVX2 U183 ( .A(B[2]), .Y(n102) );
  INVX2 U184 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n176), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n176), .Y(n1) );
  NAND2X1 U12 ( .A(B[14]), .B(A[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n24) );
  NAND2X1 U18 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n175), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n175), .Y(n3) );
  NAND2X1 U26 ( .A(B[12]), .B(A[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n158), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2X1 U32 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n174), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n174), .Y(n5) );
  NAND2X1 U40 ( .A(B[10]), .B(A[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n152), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n40) );
  NAND2X1 U46 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n47), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n47), .B(n172), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n172), .Y(n7) );
  NAND2X1 U54 ( .A(B[8]), .B(A[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U60 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n171), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n171), .Y(n9) );
  NAND2X1 U68 ( .A(B[6]), .B(A[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n160), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NAND2X1 U74 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n153), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n173), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n173), .Y(n11) );
  NAND2X1 U82 ( .A(B[4]), .B(A[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U88 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n161), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n161), .Y(n13) );
  NAND2X1 U96 ( .A(B[2]), .B(A[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n75), .B(n14), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(B[0]), .B(A[0]), .Y(n75) );
  OR2X2 U113 ( .A(B[12]), .B(A[12]), .Y(n175) );
  INVX2 U114 ( .A(A[15]), .Y(n156) );
  BUFX2 U115 ( .A(n42), .Y(n152) );
  BUFX2 U116 ( .A(n63), .Y(n153) );
  INVX1 U117 ( .A(A[0]), .Y(n154) );
  INVX2 U118 ( .A(n154), .Y(n155) );
  OR2X1 U119 ( .A(n156), .B(n18), .Y(n165) );
  INVX1 U120 ( .A(n34), .Y(n157) );
  INVX2 U121 ( .A(n157), .Y(n158) );
  INVX1 U122 ( .A(n58), .Y(n159) );
  INVX2 U123 ( .A(n159), .Y(n160) );
  AND2X1 U124 ( .A(n75), .B(n177), .Y(SUM[0]) );
  OR2X2 U125 ( .A(B[2]), .B(A[2]), .Y(n161) );
  OR2X2 U126 ( .A(B[0]), .B(n155), .Y(n177) );
  XOR2X1 U127 ( .A(A[15]), .B(B[15]), .Y(n163) );
  XOR2X1 U128 ( .A(n163), .B(n76), .Y(SUM[15]) );
  NAND2X1 U129 ( .A(A[15]), .B(B[15]), .Y(n164) );
  NAND2X1 U130 ( .A(B[15]), .B(n76), .Y(n166) );
  NAND3X1 U131 ( .A(n164), .B(n165), .C(n166), .Y(n17) );
  XOR2X1 U132 ( .A(n92), .B(n93), .Y(n167) );
  XOR2X1 U133 ( .A(n167), .B(n17), .Y(SUM[16]) );
  NAND2X1 U134 ( .A(n92), .B(n93), .Y(n168) );
  NAND2X1 U135 ( .A(n92), .B(n17), .Y(n169) );
  NAND2X1 U136 ( .A(n93), .B(n17), .Y(n170) );
  NAND3X1 U137 ( .A(n168), .B(n169), .C(n170), .Y(n16) );
  INVX1 U138 ( .A(n72), .Y(n90) );
  OR2X2 U139 ( .A(B[8]), .B(A[8]), .Y(n172) );
  OR2X1 U140 ( .A(B[6]), .B(A[6]), .Y(n171) );
  OR2X1 U141 ( .A(B[4]), .B(A[4]), .Y(n173) );
  OR2X1 U142 ( .A(B[10]), .B(A[10]), .Y(n174) );
  OR2X1 U143 ( .A(B[14]), .B(A[14]), .Y(n176) );
  INVX2 U144 ( .A(A[17]), .Y(n93) );
  INVX2 U145 ( .A(B[17]), .Y(n92) );
  INVX2 U146 ( .A(n64), .Y(n88) );
  INVX2 U147 ( .A(n56), .Y(n86) );
  INVX2 U148 ( .A(n48), .Y(n84) );
  INVX2 U149 ( .A(n40), .Y(n82) );
  INVX2 U150 ( .A(n32), .Y(n80) );
  INVX2 U151 ( .A(n24), .Y(n78) );
  INVX2 U152 ( .A(n18), .Y(n76) );
  INVX2 U153 ( .A(n70), .Y(n68) );
  INVX2 U154 ( .A(n62), .Y(n60) );
  INVX2 U155 ( .A(n54), .Y(n52) );
  INVX2 U156 ( .A(n46), .Y(n44) );
  INVX2 U157 ( .A(n38), .Y(n36) );
  INVX2 U158 ( .A(n30), .Y(n28) );
  INVX2 U159 ( .A(n22), .Y(n20) );
  INVX2 U160 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_3 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n19, n25, n28, n31, n34, n37, n40, n42, n46, n49,
         n51, n52, n53, n56, n57, n61, n64, n65, n67, n68, n69, n70, n72, n73,
         n74, n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n109, n111, n112, n113, n114, n115,
         n116, n120, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n133, n134, n135, n136, n137, n140, n142, n144, n145, n146, n147,
         n148, n149, n151, n154, n155, n156, n159, n160, n161, n162, n163,
         n164, n165, n166, n169, n170, n171, n172, n173, n174, n177, n178,
         n179, n181, n182, n183, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n197, n198, n199, n200, n201, n202, n205, n206,
         n207, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n248, n249, n250, n251, n256,
         n257, n258, n259, n264, n265, n266, n267, n275, n279, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n545, n546, n548, n551, n554, n557, n558,
         n560, n563, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n733, n738,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n893, n894, n895, n896,
         n897, n898, n899, n900, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299;
  assign n1 = b[1];
  assign n7 = b[3];
  assign n13 = b[5];
  assign n19 = b[7];
  assign n25 = b[9];
  assign n31 = b[11];
  assign n37 = b[13];
  assign n49 = a[15];
  assign n541 = b[15];
  assign n877 = a[30];
  assign n878 = a[29];
  assign n879 = a[28];
  assign n880 = a[27];
  assign n881 = a[26];
  assign n882 = a[25];
  assign n883 = a[24];
  assign n884 = a[23];
  assign n885 = a[22];
  assign n886 = a[21];
  assign n887 = a[20];
  assign n888 = a[19];
  assign n889 = a[18];
  assign n890 = a[17];
  assign n891 = a[16];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1250), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1186), .B(n1184), .Y(n74) );
  OAI21X1 U62 ( .A(n1206), .B(n1186), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1250), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1184), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1205), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1250), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1184), .Y(n96) );
  OAI21X1 U90 ( .A(n1206), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1193), .B(n1055), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1193), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1193), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1250), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1184), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1205), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1055), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1055), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  AOI21X1 U122 ( .A(n1250), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1184), .Y(n124) );
  OAI21X1 U124 ( .A(n1206), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1250), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1169), .B(n1184), .Y(n135) );
  OAI21X1 U138 ( .A(n1169), .B(n1206), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1187), .B(n1116), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1187), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1250), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1184), .Y(n146) );
  OAI21X1 U152 ( .A(n1205), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1116), .Y(n61) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  AOI21X1 U162 ( .A(n1250), .B(n155), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n349), .B(n340), .Y(n161) );
  NAND2X1 U172 ( .A(n1080), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n1250), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1162), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1162), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  AOI21X1 U184 ( .A(n171), .B(n1250), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1139), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1017), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1250), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1103), .B(n197), .C(n190), .Y(n188) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n1004), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n194), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n1019), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n1004), .C(n1144), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n1145), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n1004), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n1004), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1185), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1190), .B(n1188), .Y(n223) );
  AOI21X1 U258 ( .A(n1189), .B(n1188), .C(n1191), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1195), .B(n248), .C(n1196), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1194), .C(n1197), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1198), .C(n1199), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n571), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n571), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1200), .B(n1053), .C(n1059), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n574), .B(n305), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n575), .B(n319), .C(n603), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n605), .B(n589), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n576), .B(n337), .C(n621), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U330 ( .A(n606), .B(n638), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n622), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U335 ( .A(n639), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n591), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n577), .B(n359), .C(n623), .YC(n347), .YS(n348) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n656), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n1174), .B(n624), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U345 ( .A(n368), .B(n379), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U346 ( .A(n1074), .B(n1083), .C(n370), .YC(n365), .YS(n366) );
  FAX1 U348 ( .A(n625), .B(n593), .C(n673), .YC(n369), .YS(n370) );
  FAX1 U349 ( .A(n578), .B(n385), .C(n609), .YC(n371), .YS(n372) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n1001), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U353 ( .A(n658), .B(n399), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U354 ( .A(n626), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n1183), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U357 ( .A(n392), .B(n403), .C(n390), .YC(n387), .YS(n388) );
  FAX1 U361 ( .A(n659), .B(n643), .C(n709), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n611), .B(n595), .C(n691), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n579), .B(n627), .C(n675), .YC(n399), .YS(n400) );
  FAX1 U365 ( .A(n1115), .B(n408), .C(n419), .YC(n403), .YS(n404) );
  FAX1 U374 ( .A(n428), .B(n441), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U375 ( .A(n677), .B(n661), .C(n613), .YC(n423), .YS(n424) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n646), .YC(n439), .YS(n440) );
  FAX1 U385 ( .A(n448), .B(n459), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U388 ( .A(n615), .B(n456), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U389 ( .A(n695), .B(n631), .C(n663), .YC(n451), .YS(n452) );
  FAX1 U390 ( .A(n679), .B(n647), .C(n599), .YC(n453), .YS(n454) );
  HAX1 U391 ( .A(n711), .B(n565), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n477), .B(n1007), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n696), .B(n632), .C(n648), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n712), .B(n616), .C(n600), .YC(n467), .YS(n468) );
  FAX1 U398 ( .A(n474), .B(n483), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U400 ( .A(n480), .B(n489), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n566), .B(n617), .C(n665), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n697), .C(n649), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n681), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U407 ( .A(n698), .B(n682), .C(n650), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n714), .B(n634), .C(n618), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n667), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n567), .B(n635), .C(n651), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n683), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n668), .C(n652), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n716), .B(n684), .C(n636), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n653), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n701), .B(n669), .C(n568), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n685), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n670), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n686), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n703), .B(n671), .C(n569), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n719), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n688), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n705), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n721), .B(n570), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n707), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n726), .Y(n573) );
  NOR2X1 U435 ( .A(n1294), .B(n918), .Y(n295) );
  NOR2X1 U436 ( .A(n1292), .B(n918), .Y(n574) );
  NOR2X1 U437 ( .A(n1290), .B(n918), .Y(n305) );
  NOR2X1 U438 ( .A(n1289), .B(n918), .Y(n575) );
  NOR2X1 U439 ( .A(n1287), .B(n918), .Y(n319) );
  NOR2X1 U440 ( .A(n1285), .B(n918), .Y(n576) );
  NOR2X1 U441 ( .A(n733), .B(n918), .Y(n337) );
  NOR2X1 U442 ( .A(n1281), .B(n918), .Y(n577) );
  NOR2X1 U444 ( .A(n1278), .B(n918), .Y(n578) );
  NOR2X1 U446 ( .A(n738), .B(n918), .Y(n579) );
  NOR2X1 U447 ( .A(n1274), .B(n918), .Y(n580) );
  OAI22X1 U466 ( .A(n1246), .B(n757), .C(n918), .D(n1247), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1246), .C(n741), .D(n1248), .Y(n584) );
  OAI22X1 U470 ( .A(n1246), .B(n741), .C(n742), .D(n1248), .Y(n585) );
  OAI22X1 U471 ( .A(n1246), .B(n742), .C(n743), .D(n1248), .Y(n586) );
  OAI22X1 U472 ( .A(n1246), .B(n743), .C(n744), .D(n1248), .Y(n587) );
  OAI22X1 U473 ( .A(n1246), .B(n744), .C(n745), .D(n1248), .Y(n588) );
  OAI22X1 U474 ( .A(n1246), .B(n745), .C(n746), .D(n1248), .Y(n589) );
  OAI22X1 U475 ( .A(n1246), .B(n746), .C(n747), .D(n1248), .Y(n590) );
  OAI22X1 U476 ( .A(n1246), .B(n747), .C(n748), .D(n1248), .Y(n591) );
  OAI22X1 U477 ( .A(n1246), .B(n748), .C(n749), .D(n1248), .Y(n592) );
  OAI22X1 U478 ( .A(n1246), .B(n749), .C(n750), .D(n1247), .Y(n593) );
  OAI22X1 U479 ( .A(n1246), .B(n750), .C(n751), .D(n1247), .Y(n594) );
  OAI22X1 U480 ( .A(n1246), .B(n751), .C(n752), .D(n1247), .Y(n595) );
  OAI22X1 U481 ( .A(n1246), .B(n752), .C(n753), .D(n1247), .Y(n596) );
  OAI22X1 U482 ( .A(n1246), .B(n753), .C(n754), .D(n1247), .Y(n597) );
  OAI22X1 U483 ( .A(n1246), .B(n754), .C(n755), .D(n1248), .Y(n598) );
  OAI22X1 U484 ( .A(n1246), .B(n755), .C(n756), .D(n1248), .Y(n599) );
  AND2X1 U485 ( .A(n1297), .B(n1245), .Y(n600) );
  XNOR2X1 U487 ( .A(n1296), .B(n997), .Y(n741) );
  XNOR2X1 U488 ( .A(n997), .B(n878), .Y(n742) );
  XNOR2X1 U489 ( .A(n997), .B(n1293), .Y(n743) );
  XNOR2X1 U490 ( .A(n997), .B(n1291), .Y(n744) );
  XNOR2X1 U491 ( .A(n997), .B(n881), .Y(n745) );
  XNOR2X1 U492 ( .A(n997), .B(n1288), .Y(n746) );
  XNOR2X1 U493 ( .A(n997), .B(n1286), .Y(n747) );
  XNOR2X1 U494 ( .A(n997), .B(n1284), .Y(n748) );
  XNOR2X1 U495 ( .A(n996), .B(n1282), .Y(n749) );
  XNOR2X1 U496 ( .A(n996), .B(n886), .Y(n750) );
  XNOR2X1 U497 ( .A(n996), .B(n1279), .Y(n751) );
  XNOR2X1 U498 ( .A(n996), .B(n888), .Y(n752) );
  XNOR2X1 U499 ( .A(n996), .B(n1277), .Y(n753) );
  XNOR2X1 U500 ( .A(n997), .B(n1275), .Y(n754) );
  XNOR2X1 U501 ( .A(n997), .B(n1273), .Y(n755) );
  XNOR2X1 U502 ( .A(n1297), .B(n997), .Y(n756) );
  OR2X1 U503 ( .A(n1297), .B(n918), .Y(n757) );
  OAI22X1 U505 ( .A(n1211), .B(n774), .C(n919), .D(n1061), .Y(n566) );
  OAI22X1 U508 ( .A(n919), .B(n1211), .C(n758), .D(n1163), .Y(n602) );
  OAI22X1 U509 ( .A(n1211), .B(n758), .C(n759), .D(n1163), .Y(n603) );
  OAI22X1 U510 ( .A(n1211), .B(n759), .C(n760), .D(n1163), .Y(n604) );
  OAI22X1 U511 ( .A(n1211), .B(n760), .C(n761), .D(n1163), .Y(n605) );
  OAI22X1 U512 ( .A(n1211), .B(n761), .C(n762), .D(n1163), .Y(n606) );
  OAI22X1 U513 ( .A(n1242), .B(n762), .C(n763), .D(n1163), .Y(n607) );
  OAI22X1 U514 ( .A(n1211), .B(n763), .C(n764), .D(n1163), .Y(n608) );
  OAI22X1 U515 ( .A(n1242), .B(n764), .C(n765), .D(n1163), .Y(n609) );
  OAI22X1 U516 ( .A(n1211), .B(n765), .C(n766), .D(n1244), .Y(n610) );
  OAI22X1 U517 ( .A(n1242), .B(n766), .C(n767), .D(n1244), .Y(n611) );
  OAI22X1 U518 ( .A(n1211), .B(n767), .C(n768), .D(n1061), .Y(n612) );
  OAI22X1 U519 ( .A(n1211), .B(n768), .C(n769), .D(n1061), .Y(n613) );
  OAI22X1 U520 ( .A(n1211), .B(n769), .C(n770), .D(n1061), .Y(n614) );
  OAI22X1 U521 ( .A(n1242), .B(n770), .C(n771), .D(n1163), .Y(n615) );
  OAI22X1 U522 ( .A(n1211), .B(n771), .C(n772), .D(n1244), .Y(n616) );
  OAI22X1 U523 ( .A(n1211), .B(n772), .C(n773), .D(n1061), .Y(n617) );
  XNOR2X1 U526 ( .A(n1296), .B(n1269), .Y(n758) );
  XNOR2X1 U527 ( .A(n1269), .B(n878), .Y(n759) );
  XNOR2X1 U528 ( .A(n1269), .B(n1293), .Y(n760) );
  XNOR2X1 U529 ( .A(n1269), .B(n1291), .Y(n761) );
  XNOR2X1 U530 ( .A(n1269), .B(n881), .Y(n762) );
  XNOR2X1 U531 ( .A(n1269), .B(n1288), .Y(n763) );
  XNOR2X1 U532 ( .A(n1269), .B(n1286), .Y(n764) );
  XNOR2X1 U533 ( .A(n1269), .B(n1284), .Y(n765) );
  XNOR2X1 U534 ( .A(n1269), .B(n1282), .Y(n766) );
  XNOR2X1 U536 ( .A(n1269), .B(n1279), .Y(n768) );
  XNOR2X1 U537 ( .A(n1269), .B(n888), .Y(n769) );
  XNOR2X1 U539 ( .A(n1269), .B(n1275), .Y(n771) );
  XNOR2X1 U540 ( .A(n1269), .B(n1273), .Y(n772) );
  XNOR2X1 U541 ( .A(n1297), .B(n1269), .Y(n773) );
  OR2X1 U542 ( .A(n1297), .B(n919), .Y(n774) );
  OAI22X1 U544 ( .A(n1238), .B(n791), .C(n920), .D(n1005), .Y(n567) );
  OAI22X1 U547 ( .A(n920), .B(n1238), .C(n775), .D(n1240), .Y(n620) );
  OAI22X1 U548 ( .A(n1238), .B(n775), .C(n776), .D(n1005), .Y(n621) );
  OAI22X1 U549 ( .A(n1238), .B(n776), .C(n777), .D(n1240), .Y(n622) );
  OAI22X1 U550 ( .A(n1238), .B(n777), .C(n778), .D(n1239), .Y(n623) );
  OAI22X1 U551 ( .A(n1238), .B(n778), .C(n779), .D(n1240), .Y(n624) );
  OAI22X1 U552 ( .A(n1238), .B(n779), .C(n780), .D(n1239), .Y(n625) );
  OAI22X1 U553 ( .A(n1238), .B(n780), .C(n781), .D(n1240), .Y(n626) );
  OAI22X1 U554 ( .A(n1238), .B(n781), .C(n782), .D(n1239), .Y(n627) );
  OAI22X1 U555 ( .A(n1238), .B(n782), .C(n783), .D(n1240), .Y(n628) );
  OAI22X1 U556 ( .A(n1238), .B(n783), .C(n784), .D(n1005), .Y(n629) );
  OAI22X1 U557 ( .A(n1238), .B(n784), .C(n785), .D(n1240), .Y(n630) );
  OAI22X1 U558 ( .A(n1238), .B(n785), .C(n786), .D(n1239), .Y(n631) );
  OAI22X1 U559 ( .A(n1238), .B(n786), .C(n787), .D(n1240), .Y(n632) );
  OAI22X1 U560 ( .A(n1238), .B(n787), .C(n788), .D(n1239), .Y(n633) );
  OAI22X1 U561 ( .A(n1238), .B(n788), .C(n789), .D(n1240), .Y(n634) );
  OAI22X1 U562 ( .A(n1238), .B(n789), .C(n790), .D(n1005), .Y(n635) );
  AND2X1 U563 ( .A(n1298), .B(n1237), .Y(n636) );
  XNOR2X1 U565 ( .A(n1296), .B(n1000), .Y(n775) );
  XNOR2X1 U566 ( .A(n1000), .B(n878), .Y(n776) );
  XNOR2X1 U567 ( .A(n1000), .B(n1293), .Y(n777) );
  XNOR2X1 U568 ( .A(n1000), .B(n1291), .Y(n778) );
  XNOR2X1 U570 ( .A(n1000), .B(n1288), .Y(n780) );
  XNOR2X1 U571 ( .A(n1000), .B(n1286), .Y(n781) );
  XNOR2X1 U572 ( .A(n1265), .B(n1284), .Y(n782) );
  XNOR2X1 U573 ( .A(n1265), .B(n1282), .Y(n783) );
  XNOR2X1 U575 ( .A(n1265), .B(n1279), .Y(n785) );
  XNOR2X1 U576 ( .A(n1265), .B(n888), .Y(n786) );
  XNOR2X1 U577 ( .A(n1265), .B(n1277), .Y(n787) );
  XNOR2X1 U579 ( .A(n1000), .B(n1273), .Y(n789) );
  XNOR2X1 U580 ( .A(n1297), .B(n1000), .Y(n790) );
  OAI22X1 U583 ( .A(n1233), .B(n808), .C(n921), .D(n1236), .Y(n568) );
  OAI22X1 U586 ( .A(n921), .B(n1034), .C(n792), .D(n1236), .Y(n638) );
  OAI22X1 U587 ( .A(n1034), .B(n792), .C(n793), .D(n1236), .Y(n639) );
  OAI22X1 U588 ( .A(n793), .B(n1233), .C(n794), .D(n1236), .Y(n640) );
  OAI22X1 U589 ( .A(n794), .B(n1034), .C(n795), .D(n1236), .Y(n641) );
  OAI22X1 U591 ( .A(n796), .B(n1034), .C(n1117), .D(n1235), .Y(n643) );
  OAI22X1 U592 ( .A(n1117), .B(n1233), .C(n798), .D(n1235), .Y(n644) );
  OAI22X1 U593 ( .A(n798), .B(n1034), .C(n799), .D(n1236), .Y(n645) );
  OAI22X1 U594 ( .A(n799), .B(n1034), .C(n800), .D(n1236), .Y(n646) );
  OAI22X1 U595 ( .A(n800), .B(n1233), .C(n801), .D(n1235), .Y(n647) );
  OAI22X1 U596 ( .A(n801), .B(n1034), .C(n802), .D(n1088), .Y(n648) );
  OAI22X1 U597 ( .A(n802), .B(n1233), .C(n803), .D(n1235), .Y(n649) );
  OAI22X1 U598 ( .A(n803), .B(n1034), .C(n804), .D(n1236), .Y(n650) );
  OAI22X1 U599 ( .A(n804), .B(n1233), .C(n805), .D(n1236), .Y(n651) );
  OAI22X1 U600 ( .A(n805), .B(n1034), .C(n806), .D(n1236), .Y(n652) );
  OAI22X1 U601 ( .A(n806), .B(n1233), .C(n807), .D(n1236), .Y(n653) );
  AND2X1 U602 ( .A(n1298), .B(n1214), .Y(n654) );
  XNOR2X1 U604 ( .A(n1296), .B(n1262), .Y(n792) );
  XNOR2X1 U605 ( .A(n1262), .B(n878), .Y(n793) );
  XNOR2X1 U606 ( .A(n1262), .B(n1293), .Y(n794) );
  XNOR2X1 U607 ( .A(n1262), .B(n1291), .Y(n795) );
  XNOR2X1 U610 ( .A(n1263), .B(n1286), .Y(n798) );
  XNOR2X1 U611 ( .A(n1263), .B(n1284), .Y(n799) );
  XNOR2X1 U612 ( .A(n1263), .B(n1282), .Y(n800) );
  XNOR2X1 U613 ( .A(n1263), .B(n886), .Y(n801) );
  XNOR2X1 U614 ( .A(n1263), .B(n1279), .Y(n802) );
  XNOR2X1 U615 ( .A(n1263), .B(n888), .Y(n803) );
  XNOR2X1 U616 ( .A(n1263), .B(n1277), .Y(n804) );
  XNOR2X1 U617 ( .A(n1263), .B(n1275), .Y(n805) );
  XNOR2X1 U618 ( .A(n1263), .B(n1273), .Y(n806) );
  XNOR2X1 U619 ( .A(n1298), .B(n1262), .Y(n807) );
  OR2X1 U620 ( .A(n1298), .B(n921), .Y(n808) );
  OAI22X1 U622 ( .A(n1209), .B(n825), .C(n922), .D(n1231), .Y(n569) );
  OAI22X1 U625 ( .A(n922), .B(n1209), .C(n809), .D(n1231), .Y(n656) );
  OAI22X1 U626 ( .A(n1209), .B(n809), .C(n810), .D(n1231), .Y(n657) );
  OAI22X1 U627 ( .A(n1209), .B(n810), .C(n811), .D(n1231), .Y(n658) );
  OAI22X1 U628 ( .A(n1209), .B(n811), .C(n812), .D(n1230), .Y(n659) );
  OAI22X1 U629 ( .A(n1209), .B(n812), .C(n813), .D(n1230), .Y(n660) );
  OAI22X1 U630 ( .A(n1209), .B(n813), .C(n814), .D(n1230), .Y(n661) );
  OAI22X1 U631 ( .A(n1209), .B(n814), .C(n815), .D(n1230), .Y(n662) );
  OAI22X1 U632 ( .A(n1209), .B(n815), .C(n816), .D(n1230), .Y(n663) );
  OAI22X1 U633 ( .A(n1209), .B(n816), .C(n817), .D(n1231), .Y(n664) );
  OAI22X1 U634 ( .A(n1209), .B(n817), .C(n818), .D(n1230), .Y(n665) );
  OAI22X1 U635 ( .A(n1209), .B(n818), .C(n819), .D(n1231), .Y(n666) );
  OAI22X1 U636 ( .A(n1209), .B(n819), .C(n820), .D(n1231), .Y(n667) );
  OAI22X1 U637 ( .A(n1209), .B(n820), .C(n821), .D(n1230), .Y(n668) );
  OAI22X1 U638 ( .A(n1209), .B(n821), .C(n822), .D(n1230), .Y(n669) );
  OAI22X1 U639 ( .A(n1209), .B(n822), .C(n823), .D(n1231), .Y(n670) );
  OAI22X1 U640 ( .A(n1209), .B(n823), .C(n824), .D(n1231), .Y(n671) );
  AND2X1 U641 ( .A(n1298), .B(n1201), .Y(n672) );
  XNOR2X1 U643 ( .A(n1260), .B(n1296), .Y(n809) );
  XNOR2X1 U644 ( .A(n1260), .B(n878), .Y(n810) );
  XNOR2X1 U645 ( .A(n1260), .B(n1293), .Y(n811) );
  XNOR2X1 U646 ( .A(n1260), .B(n1291), .Y(n812) );
  XNOR2X1 U648 ( .A(n1260), .B(n1288), .Y(n814) );
  XNOR2X1 U649 ( .A(n1260), .B(n1286), .Y(n815) );
  XNOR2X1 U650 ( .A(n1260), .B(n1284), .Y(n816) );
  XNOR2X1 U651 ( .A(n1260), .B(n1282), .Y(n817) );
  XNOR2X1 U652 ( .A(n1260), .B(n886), .Y(n818) );
  XNOR2X1 U653 ( .A(n1260), .B(n1138), .Y(n819) );
  XNOR2X1 U654 ( .A(n1260), .B(n888), .Y(n820) );
  XNOR2X1 U655 ( .A(n1260), .B(n1277), .Y(n821) );
  XNOR2X1 U656 ( .A(n1260), .B(n1275), .Y(n822) );
  XNOR2X1 U657 ( .A(n1260), .B(n1273), .Y(n823) );
  XNOR2X1 U658 ( .A(n1298), .B(n1260), .Y(n824) );
  OR2X1 U659 ( .A(n1298), .B(n922), .Y(n825) );
  OAI22X1 U661 ( .A(n1228), .B(n842), .C(n923), .D(n1182), .Y(n570) );
  OAI22X1 U664 ( .A(n923), .B(n1036), .C(n1229), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1228), .B(n826), .C(n827), .D(n1229), .Y(n675) );
  OAI22X1 U667 ( .A(n1228), .B(n828), .C(n829), .D(n1229), .Y(n677) );
  OAI22X1 U668 ( .A(n1228), .B(n829), .C(n830), .D(n1181), .Y(n678) );
  OAI22X1 U669 ( .A(n1228), .B(n830), .C(n831), .D(n1229), .Y(n679) );
  OAI22X1 U670 ( .A(n1228), .B(n831), .C(n832), .D(n1182), .Y(n680) );
  OAI22X1 U671 ( .A(n1228), .B(n832), .C(n833), .D(n1182), .Y(n681) );
  OAI22X1 U672 ( .A(n1228), .B(n833), .C(n834), .D(n1182), .Y(n682) );
  OAI22X1 U673 ( .A(n1228), .B(n834), .C(n835), .D(n1181), .Y(n683) );
  OAI22X1 U674 ( .A(n1228), .B(n835), .C(n836), .D(n1182), .Y(n684) );
  OAI22X1 U675 ( .A(n1228), .B(n836), .C(n837), .D(n1182), .Y(n685) );
  OAI22X1 U676 ( .A(n1228), .B(n837), .C(n838), .D(n1182), .Y(n686) );
  OAI22X1 U677 ( .A(n1228), .B(n838), .C(n839), .D(n1182), .Y(n687) );
  OAI22X1 U678 ( .A(n1228), .B(n839), .C(n840), .D(n1182), .Y(n688) );
  OAI22X1 U679 ( .A(n1228), .B(n840), .C(n841), .D(n1182), .Y(n689) );
  AND2X1 U680 ( .A(n1298), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1296), .B(n1210), .Y(n826) );
  XNOR2X1 U684 ( .A(n1210), .B(n1293), .Y(n828) );
  XNOR2X1 U685 ( .A(n1210), .B(n1291), .Y(n829) );
  XNOR2X1 U686 ( .A(n1210), .B(n881), .Y(n830) );
  XNOR2X1 U687 ( .A(n1210), .B(n1288), .Y(n831) );
  XNOR2X1 U688 ( .A(n1258), .B(n1286), .Y(n832) );
  XNOR2X1 U689 ( .A(n1210), .B(n1284), .Y(n833) );
  XNOR2X1 U690 ( .A(n1210), .B(n1282), .Y(n834) );
  XNOR2X1 U691 ( .A(n1258), .B(n886), .Y(n835) );
  XNOR2X1 U692 ( .A(n1210), .B(n1279), .Y(n836) );
  XNOR2X1 U693 ( .A(n1210), .B(n888), .Y(n837) );
  XNOR2X1 U694 ( .A(n1258), .B(n1277), .Y(n838) );
  XNOR2X1 U695 ( .A(n1258), .B(n1275), .Y(n839) );
  XNOR2X1 U696 ( .A(n1210), .B(n1273), .Y(n840) );
  XNOR2X1 U697 ( .A(n1298), .B(n1210), .Y(n841) );
  OR2X1 U698 ( .A(n1298), .B(n923), .Y(n842) );
  OAI22X1 U700 ( .A(n1208), .B(n859), .C(n924), .D(n1226), .Y(n571) );
  OAI22X1 U703 ( .A(n924), .B(n1208), .C(n843), .D(n1227), .Y(n692) );
  OAI22X1 U704 ( .A(n1208), .B(n843), .C(n844), .D(n1176), .Y(n693) );
  OAI22X1 U705 ( .A(n1208), .B(n844), .C(n845), .D(n1227), .Y(n694) );
  OAI22X1 U706 ( .A(n1208), .B(n845), .C(n846), .D(n1226), .Y(n695) );
  OAI22X1 U707 ( .A(n1208), .B(n846), .C(n847), .D(n1176), .Y(n696) );
  OAI22X1 U708 ( .A(n1208), .B(n847), .C(n848), .D(n1176), .Y(n697) );
  OAI22X1 U709 ( .A(n1208), .B(n848), .C(n849), .D(n1226), .Y(n698) );
  OAI22X1 U710 ( .A(n1208), .B(n849), .C(n850), .D(n1227), .Y(n699) );
  OAI22X1 U711 ( .A(n1208), .B(n850), .C(n851), .D(n1227), .Y(n700) );
  OAI22X1 U712 ( .A(n1208), .B(n851), .C(n852), .D(n1226), .Y(n701) );
  OAI22X1 U713 ( .A(n1208), .B(n852), .C(n853), .D(n1226), .Y(n702) );
  OAI22X1 U714 ( .A(n1208), .B(n853), .C(n854), .D(n1226), .Y(n703) );
  OAI22X1 U715 ( .A(n1208), .B(n854), .C(n855), .D(n1227), .Y(n704) );
  OAI22X1 U716 ( .A(n1208), .B(n855), .C(n856), .D(n1226), .Y(n705) );
  OAI22X1 U717 ( .A(n1208), .B(n856), .C(n857), .D(n1227), .Y(n706) );
  OAI22X1 U718 ( .A(n1208), .B(n857), .C(n858), .D(n1227), .Y(n707) );
  AND2X1 U719 ( .A(n1298), .B(n1225), .Y(n708) );
  XNOR2X1 U722 ( .A(n1002), .B(n878), .Y(n844) );
  XNOR2X1 U723 ( .A(n1002), .B(n1293), .Y(n845) );
  XNOR2X1 U726 ( .A(n1002), .B(n1288), .Y(n848) );
  XNOR2X1 U727 ( .A(n1003), .B(n1286), .Y(n849) );
  XNOR2X1 U728 ( .A(n1003), .B(n1284), .Y(n850) );
  XNOR2X1 U729 ( .A(n1003), .B(n1282), .Y(n851) );
  XNOR2X1 U730 ( .A(n1003), .B(n886), .Y(n852) );
  XNOR2X1 U731 ( .A(n1003), .B(n1138), .Y(n853) );
  XNOR2X1 U732 ( .A(n1003), .B(n888), .Y(n854) );
  XNOR2X1 U733 ( .A(n1003), .B(n1065), .Y(n855) );
  XNOR2X1 U734 ( .A(n1003), .B(n1275), .Y(n856) );
  XNOR2X1 U735 ( .A(n1003), .B(n1273), .Y(n857) );
  XNOR2X1 U736 ( .A(n1298), .B(n1003), .Y(n858) );
  OAI22X1 U739 ( .A(n917), .B(n876), .C(n925), .D(n1223), .Y(n572) );
  OAI22X1 U743 ( .A(n917), .B(n860), .C(n861), .D(n1223), .Y(n711) );
  OAI22X1 U744 ( .A(n917), .B(n861), .C(n862), .D(n1224), .Y(n712) );
  OAI22X1 U745 ( .A(n917), .B(n862), .C(n863), .D(n1223), .Y(n713) );
  OAI22X1 U746 ( .A(n917), .B(n863), .C(n864), .D(n1224), .Y(n714) );
  OAI22X1 U747 ( .A(n917), .B(n864), .C(n865), .D(n1223), .Y(n715) );
  OAI22X1 U748 ( .A(n917), .B(n865), .C(n866), .D(n1224), .Y(n716) );
  OAI22X1 U749 ( .A(n917), .B(n866), .C(n867), .D(n1223), .Y(n717) );
  OAI22X1 U750 ( .A(n917), .B(n867), .C(n868), .D(n1224), .Y(n718) );
  OAI22X1 U751 ( .A(n917), .B(n868), .C(n869), .D(n1223), .Y(n719) );
  OAI22X1 U752 ( .A(n917), .B(n869), .C(n870), .D(n1224), .Y(n720) );
  OAI22X1 U753 ( .A(n917), .B(n870), .C(n871), .D(n1223), .Y(n721) );
  OAI22X1 U754 ( .A(n917), .B(n871), .C(n872), .D(n1224), .Y(n722) );
  OAI22X1 U755 ( .A(n917), .B(n872), .C(n873), .D(n1223), .Y(n723) );
  OAI22X1 U756 ( .A(n917), .B(n873), .C(n874), .D(n1224), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n875), .D(n1223), .Y(n725) );
  XNOR2X1 U758 ( .A(n1253), .B(n877), .Y(n860) );
  XNOR2X1 U759 ( .A(n1252), .B(n878), .Y(n861) );
  XNOR2X1 U760 ( .A(n1252), .B(n1293), .Y(n862) );
  XNOR2X1 U761 ( .A(n1252), .B(n1291), .Y(n863) );
  XNOR2X1 U762 ( .A(n1252), .B(n881), .Y(n864) );
  XNOR2X1 U763 ( .A(n1252), .B(n1288), .Y(n865) );
  XNOR2X1 U764 ( .A(n1252), .B(n1286), .Y(n866) );
  XNOR2X1 U765 ( .A(n1064), .B(n1284), .Y(n867) );
  XNOR2X1 U766 ( .A(n1064), .B(n1282), .Y(n868) );
  XNOR2X1 U767 ( .A(n1252), .B(n886), .Y(n869) );
  XNOR2X1 U768 ( .A(n1064), .B(n1138), .Y(n870) );
  XNOR2X1 U769 ( .A(n1064), .B(n888), .Y(n871) );
  XNOR2X1 U770 ( .A(n1064), .B(n1065), .Y(n872) );
  XNOR2X1 U771 ( .A(n1064), .B(n1275), .Y(n873) );
  XNOR2X1 U772 ( .A(n1064), .B(n1273), .Y(n874) );
  XNOR2X1 U773 ( .A(n1298), .B(n1252), .Y(n875) );
  OR2X1 U774 ( .A(n1298), .B(n925), .Y(n876) );
  XOR2X1 U802 ( .A(n541), .B(b[14]), .Y(n893) );
  NAND2X1 U804 ( .A(n894), .B(n40), .Y(n42) );
  XOR2X1 U805 ( .A(n1268), .B(b[12]), .Y(n894) );
  XNOR2X1 U806 ( .A(n1265), .B(b[12]), .Y(n40) );
  XOR2X1 U808 ( .A(n1265), .B(b[10]), .Y(n895) );
  XNOR2X1 U812 ( .A(n19), .B(b[8]), .Y(n28) );
  XOR2X1 U817 ( .A(n1257), .B(b[4]), .Y(n898) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  INVX8 U828 ( .A(n1271), .Y(n995) );
  INVX8 U829 ( .A(n995), .Y(n996) );
  INVX8 U830 ( .A(n995), .Y(n997) );
  INVX8 U831 ( .A(n1245), .Y(n1246) );
  BUFX2 U832 ( .A(n563), .Y(n998) );
  BUFX2 U833 ( .A(n563), .Y(n999) );
  INVX8 U834 ( .A(n1225), .Y(n1208) );
  BUFX4 U835 ( .A(n1266), .Y(n1000) );
  INVX1 U836 ( .A(n1264), .Y(n1266) );
  BUFX4 U837 ( .A(n384), .Y(n1001) );
  INVX8 U838 ( .A(n1259), .Y(n1260) );
  INVX8 U839 ( .A(n1202), .Y(n1228) );
  INVX8 U840 ( .A(n1237), .Y(n1238) );
  BUFX4 U841 ( .A(n1255), .Y(n1002) );
  BUFX4 U842 ( .A(n1255), .Y(n1003) );
  INVX2 U843 ( .A(n1254), .Y(n1255) );
  INVX4 U844 ( .A(n1267), .Y(n1268) );
  INVX4 U845 ( .A(n37), .Y(n1267) );
  BUFX4 U846 ( .A(n1279), .Y(n1138) );
  BUFX4 U847 ( .A(n212), .Y(n1004) );
  INVX8 U848 ( .A(n1241), .Y(n1211) );
  INVX2 U849 ( .A(n886), .Y(n1067) );
  BUFX2 U850 ( .A(n439), .Y(n1204) );
  INVX2 U851 ( .A(n28), .Y(n1232) );
  INVX4 U852 ( .A(n1292), .Y(n1293) );
  INVX4 U853 ( .A(n877), .Y(n1295) );
  INVX4 U854 ( .A(n541), .Y(n918) );
  INVX2 U855 ( .A(n1256), .Y(n1257) );
  INVX2 U856 ( .A(n889), .Y(n1276) );
  INVX4 U857 ( .A(n1256), .Y(n1210) );
  INVX2 U858 ( .A(n887), .Y(n1278) );
  INVX2 U859 ( .A(n1261), .Y(n1262) );
  INVX2 U860 ( .A(n891), .Y(n1272) );
  INVX4 U861 ( .A(n1276), .Y(n1277) );
  INVX2 U862 ( .A(n1056), .Y(n1247) );
  INVX4 U863 ( .A(n1278), .Y(n1279) );
  INVX4 U864 ( .A(n1283), .Y(n1284) );
  INVX2 U865 ( .A(n884), .Y(n1283) );
  INVX4 U866 ( .A(n1299), .Y(n1297) );
  INVX2 U867 ( .A(n1114), .Y(n1115) );
  INVX2 U868 ( .A(n1174), .Y(n359) );
  INVX2 U869 ( .A(n1090), .Y(n1235) );
  BUFX2 U870 ( .A(n407), .Y(n1207) );
  INVX2 U871 ( .A(n1073), .Y(n1074) );
  INVX2 U872 ( .A(n1268), .Y(n919) );
  INVX2 U873 ( .A(n342), .Y(n1016) );
  INVX4 U874 ( .A(n541), .Y(n1270) );
  INVX1 U875 ( .A(n1104), .Y(n1005) );
  INVX2 U876 ( .A(n1104), .Y(n1239) );
  INVX1 U877 ( .A(n222), .Y(n221) );
  INVX2 U878 ( .A(n475), .Y(n1006) );
  INVX4 U879 ( .A(n1006), .Y(n1007) );
  INVX1 U880 ( .A(n182), .Y(n285) );
  XOR2X1 U881 ( .A(n431), .B(n420), .Y(n1008) );
  XOR2X1 U882 ( .A(n418), .B(n1008), .Y(n416) );
  NAND2X1 U883 ( .A(n418), .B(n431), .Y(n1009) );
  NAND2X1 U884 ( .A(n418), .B(n420), .Y(n1010) );
  NAND2X1 U885 ( .A(n431), .B(n420), .Y(n1011) );
  NAND3X1 U886 ( .A(n1010), .B(n1009), .C(n1011), .Y(n415) );
  XOR2X1 U887 ( .A(n630), .B(n662), .Y(n1012) );
  XOR2X1 U888 ( .A(n614), .B(n1012), .Y(n438) );
  NAND2X1 U889 ( .A(n614), .B(n630), .Y(n1013) );
  NAND2X1 U890 ( .A(n614), .B(n662), .Y(n1014) );
  NAND2X1 U891 ( .A(n630), .B(n662), .Y(n1015) );
  NAND3X1 U892 ( .A(n1014), .B(n1013), .C(n1015), .Y(n437) );
  XNOR2X1 U893 ( .A(n1038), .B(n1016), .Y(n340) );
  INVX1 U894 ( .A(n1249), .Y(n1017) );
  INVX1 U895 ( .A(n402), .Y(n1018) );
  INVX1 U896 ( .A(n1018), .Y(n1019) );
  XOR2X1 U897 ( .A(n417), .B(n406), .Y(n1020) );
  XOR2X1 U898 ( .A(n404), .B(n1020), .Y(n402) );
  NAND2X1 U899 ( .A(n404), .B(n417), .Y(n1021) );
  NAND2X1 U900 ( .A(n404), .B(n406), .Y(n1022) );
  NAND2X1 U901 ( .A(n417), .B(n406), .Y(n1023) );
  NAND3X1 U902 ( .A(n1022), .B(n1021), .C(n1023), .Y(n401) );
  XOR2X1 U903 ( .A(n676), .B(n612), .Y(n1024) );
  XOR2X1 U904 ( .A(n1024), .B(n660), .Y(n410) );
  NAND2X1 U905 ( .A(n676), .B(n612), .Y(n1025) );
  NAND2X1 U906 ( .A(n676), .B(n660), .Y(n1026) );
  NAND2X1 U907 ( .A(n612), .B(n660), .Y(n1027) );
  NAND3X1 U908 ( .A(n1025), .B(n1026), .C(n1027), .Y(n409) );
  XOR2X1 U909 ( .A(n413), .B(n411), .Y(n1028) );
  XOR2X1 U910 ( .A(n1028), .B(n409), .Y(n394) );
  NAND2X1 U911 ( .A(n413), .B(n411), .Y(n1029) );
  NAND2X1 U912 ( .A(n413), .B(n409), .Y(n1030) );
  NAND2X1 U913 ( .A(n411), .B(n409), .Y(n1031) );
  NAND3X1 U914 ( .A(n1029), .B(n1030), .C(n1031), .Y(n393) );
  OR2X1 U915 ( .A(n1228), .B(n827), .Y(n1032) );
  OR2X2 U916 ( .A(n828), .B(n1229), .Y(n1033) );
  NAND2X1 U917 ( .A(n1032), .B(n1033), .Y(n676) );
  INVX4 U918 ( .A(n1075), .Y(n1229) );
  INVX2 U919 ( .A(n886), .Y(n1068) );
  INVX4 U920 ( .A(n885), .Y(n1281) );
  INVX4 U921 ( .A(n1054), .Y(n1230) );
  INVX1 U922 ( .A(n999), .Y(n709) );
  INVX4 U923 ( .A(n25), .Y(n1261) );
  BUFX4 U924 ( .A(n1234), .Y(n1034) );
  INVX4 U925 ( .A(n1232), .Y(n1234) );
  XNOR2X1 U926 ( .A(n134), .B(n1035), .Y(product[41]) );
  AND2X2 U927 ( .A(n133), .B(n279), .Y(n1035) );
  XOR2X1 U928 ( .A(n1254), .B(b[4]), .Y(n1036) );
  INVX2 U929 ( .A(n1036), .Y(n1202) );
  XOR2X1 U930 ( .A(n355), .B(n346), .Y(n1037) );
  XOR2X1 U931 ( .A(n1037), .B(n353), .Y(n342) );
  XOR2X1 U932 ( .A(n344), .B(n1085), .Y(n1038) );
  NAND2X1 U933 ( .A(n355), .B(n346), .Y(n1039) );
  NAND2X1 U934 ( .A(n355), .B(n353), .Y(n1040) );
  NAND2X1 U935 ( .A(n346), .B(n353), .Y(n1041) );
  NAND3X1 U936 ( .A(n1039), .B(n1040), .C(n1041), .Y(n341) );
  NAND2X1 U937 ( .A(n344), .B(n1085), .Y(n1042) );
  NAND2X1 U938 ( .A(n344), .B(n342), .Y(n1043) );
  NAND2X1 U939 ( .A(n1085), .B(n342), .Y(n1044) );
  NAND3X1 U940 ( .A(n1042), .B(n1043), .C(n1044), .Y(n339) );
  INVX2 U941 ( .A(n49), .Y(n1299) );
  XOR2X1 U942 ( .A(n363), .B(n354), .Y(n1045) );
  XOR2X1 U943 ( .A(n352), .B(n1045), .Y(n350) );
  NAND2X1 U944 ( .A(n352), .B(n363), .Y(n1046) );
  NAND2X1 U945 ( .A(n352), .B(n354), .Y(n1047) );
  NAND2X1 U946 ( .A(n363), .B(n354), .Y(n1048) );
  NAND3X1 U947 ( .A(n1047), .B(n1046), .C(n1048), .Y(n349) );
  INVX8 U948 ( .A(n1295), .Y(n1296) );
  XOR2X1 U949 ( .A(n998), .B(n580), .Y(n1049) );
  XOR2X1 U950 ( .A(n692), .B(n1049), .Y(n414) );
  NAND2X1 U951 ( .A(n692), .B(n999), .Y(n1050) );
  NAND2X1 U952 ( .A(n692), .B(n580), .Y(n1051) );
  NAND2X1 U953 ( .A(n999), .B(n580), .Y(n1052) );
  NAND3X1 U954 ( .A(n1051), .B(n1050), .C(n1052), .Y(n413) );
  INVX2 U955 ( .A(n890), .Y(n1274) );
  INVX1 U956 ( .A(n886), .Y(n1280) );
  INVX2 U957 ( .A(n878), .Y(n1294) );
  INVX2 U958 ( .A(n880), .Y(n1290) );
  OR2X2 U959 ( .A(n724), .B(n708), .Y(n1053) );
  AND2X2 U960 ( .A(n1164), .B(n897), .Y(n1054) );
  OR2X2 U961 ( .A(n308), .B(n313), .Y(n1055) );
  AND2X2 U962 ( .A(n46), .B(n893), .Y(n1056) );
  AND2X2 U963 ( .A(n169), .B(n283), .Y(n1057) );
  AND2X2 U964 ( .A(n190), .B(n286), .Y(n1058) );
  INVX2 U965 ( .A(n34), .Y(n1237) );
  INVX4 U966 ( .A(n1285), .Y(n1286) );
  INVX2 U967 ( .A(n883), .Y(n1285) );
  INVX2 U968 ( .A(n882), .Y(n1287) );
  AND2X2 U969 ( .A(n724), .B(n708), .Y(n1059) );
  INVX2 U970 ( .A(n879), .Y(n1292) );
  OR2X2 U971 ( .A(n292), .B(n293), .Y(n1060) );
  INVX2 U972 ( .A(n557), .Y(n673) );
  XNOR2X1 U973 ( .A(n447), .B(n1071), .Y(n1152) );
  INVX2 U974 ( .A(n1071), .Y(n1072) );
  BUFX4 U975 ( .A(n42), .Y(n1061) );
  INVX2 U976 ( .A(n42), .Y(n1243) );
  XNOR2X1 U977 ( .A(n1259), .B(b[6]), .Y(n897) );
  INVX2 U978 ( .A(n19), .Y(n1259) );
  XOR2X1 U979 ( .A(n1267), .B(b[14]), .Y(n46) );
  NAND2X1 U980 ( .A(n898), .B(n1036), .Y(n1062) );
  INVX2 U981 ( .A(n1235), .Y(n1063) );
  INVX2 U982 ( .A(n925), .Y(n1064) );
  INVX2 U983 ( .A(n1253), .Y(n925) );
  INVX2 U984 ( .A(n1251), .Y(n1253) );
  INVX1 U985 ( .A(n1276), .Y(n1065) );
  XOR2X1 U986 ( .A(n1261), .B(n1289), .Y(n1066) );
  INVX1 U987 ( .A(n1066), .Y(n796) );
  XNOR2X1 U988 ( .A(n1277), .B(n1268), .Y(n770) );
  INVX1 U989 ( .A(n128), .Y(n126) );
  XNOR2X1 U990 ( .A(n86), .B(n1069), .Y(product[45]) );
  AND2X2 U991 ( .A(n85), .B(n275), .Y(n1069) );
  XOR2X1 U992 ( .A(n1000), .B(n1289), .Y(n779) );
  BUFX2 U993 ( .A(n454), .Y(n1070) );
  INVX2 U994 ( .A(n449), .Y(n1071) );
  INVX1 U995 ( .A(n130), .Y(n279) );
  XOR2X1 U996 ( .A(n1260), .B(n1289), .Y(n813) );
  INVX1 U997 ( .A(n1277), .Y(n738) );
  XOR2X1 U998 ( .A(n1265), .B(n1274), .Y(n788) );
  INVX2 U999 ( .A(n383), .Y(n1073) );
  AND2X2 U1000 ( .A(n898), .B(n1036), .Y(n1075) );
  XOR2X1 U1001 ( .A(n375), .B(n366), .Y(n1076) );
  XOR2X1 U1002 ( .A(n364), .B(n1076), .Y(n362) );
  NAND2X1 U1003 ( .A(n364), .B(n375), .Y(n1077) );
  NAND2X1 U1004 ( .A(n364), .B(n366), .Y(n1078) );
  NAND2X1 U1005 ( .A(n375), .B(n366), .Y(n1079) );
  NAND3X1 U1006 ( .A(n1078), .B(n1077), .C(n1079), .Y(n361) );
  XNOR2X1 U1007 ( .A(n1081), .B(n1067), .Y(n784) );
  AND2X2 U1008 ( .A(n1298), .B(n546), .Y(n618) );
  INVX1 U1009 ( .A(n129), .Y(n127) );
  INVX1 U1010 ( .A(n101), .Y(n99) );
  XOR2X1 U1011 ( .A(n1002), .B(n1289), .Y(n847) );
  XNOR2X1 U1012 ( .A(n1251), .B(b[0]), .Y(n900) );
  INVX2 U1013 ( .A(n1251), .Y(n1252) );
  INVX1 U1014 ( .A(n183), .Y(n181) );
  BUFX2 U1015 ( .A(n340), .Y(n1080) );
  INVX1 U1016 ( .A(n1265), .Y(n1081) );
  XOR2X1 U1017 ( .A(n1269), .B(n1068), .Y(n767) );
  INVX2 U1018 ( .A(n381), .Y(n1082) );
  INVX4 U1019 ( .A(n1082), .Y(n1083) );
  INVX2 U1020 ( .A(n351), .Y(n1084) );
  INVX4 U1021 ( .A(n1084), .Y(n1085) );
  AND2X2 U1022 ( .A(n917), .B(n900), .Y(n1086) );
  INVX4 U1023 ( .A(n1243), .Y(n1163) );
  INVX8 U1024 ( .A(n1201), .Y(n1209) );
  XNOR2X1 U1025 ( .A(n163), .B(n1087), .Y(product[38]) );
  AND2X2 U1026 ( .A(n162), .B(n282), .Y(n1087) );
  XOR2X1 U1027 ( .A(n1002), .B(n1290), .Y(n846) );
  INVX2 U1028 ( .A(n1003), .Y(n924) );
  OR2X2 U1029 ( .A(n1298), .B(n924), .Y(n859) );
  XOR2X1 U1030 ( .A(n1251), .B(b[2]), .Y(n9) );
  INVX1 U1031 ( .A(n1089), .Y(n1088) );
  INVX4 U1032 ( .A(n1089), .Y(n1236) );
  INVX4 U1033 ( .A(n1105), .Y(n1240) );
  INVX1 U1034 ( .A(n1260), .Y(n922) );
  AND2X2 U1035 ( .A(n896), .B(n1234), .Y(n1089) );
  AND2X2 U1036 ( .A(n896), .B(n1234), .Y(n1090) );
  XNOR2X1 U1037 ( .A(n1254), .B(b[2]), .Y(n899) );
  INVX2 U1038 ( .A(n1203), .Y(n1176) );
  XOR2X1 U1039 ( .A(n461), .B(n463), .Y(n1091) );
  XOR2X1 U1040 ( .A(n450), .B(n1091), .Y(n446) );
  NAND2X1 U1041 ( .A(n450), .B(n461), .Y(n1092) );
  NAND2X1 U1042 ( .A(n450), .B(n463), .Y(n1093) );
  NAND2X1 U1043 ( .A(n461), .B(n463), .Y(n1094) );
  NAND3X1 U1044 ( .A(n1093), .B(n1092), .C(n1094), .Y(n445) );
  XOR2X1 U1045 ( .A(n423), .B(n410), .Y(n1095) );
  XOR2X1 U1046 ( .A(n1095), .B(n412), .Y(n406) );
  NAND2X1 U1047 ( .A(n423), .B(n410), .Y(n1096) );
  NAND2X1 U1048 ( .A(n423), .B(n412), .Y(n1097) );
  NAND2X1 U1049 ( .A(n410), .B(n412), .Y(n1098) );
  NAND3X1 U1050 ( .A(n1096), .B(n1097), .C(n1098), .Y(n405) );
  XOR2X1 U1051 ( .A(n394), .B(n1207), .Y(n1099) );
  XOR2X1 U1052 ( .A(n1099), .B(n405), .Y(n390) );
  NAND2X1 U1053 ( .A(n1207), .B(n394), .Y(n1100) );
  NAND2X1 U1054 ( .A(n1207), .B(n405), .Y(n1101) );
  NAND2X1 U1055 ( .A(n394), .B(n405), .Y(n1102) );
  NAND3X1 U1056 ( .A(n1100), .B(n1101), .C(n1102), .Y(n389) );
  NOR2X1 U1057 ( .A(n401), .B(n388), .Y(n1103) );
  AND2X2 U1058 ( .A(n895), .B(n34), .Y(n1104) );
  AND2X2 U1059 ( .A(n34), .B(n895), .Y(n1105) );
  XOR2X1 U1060 ( .A(n666), .B(n499), .Y(n1106) );
  XOR2X1 U1061 ( .A(n1106), .B(n497), .Y(n486) );
  NAND2X1 U1062 ( .A(n666), .B(n499), .Y(n1107) );
  NAND2X1 U1063 ( .A(n666), .B(n497), .Y(n1108) );
  NAND2X1 U1064 ( .A(n499), .B(n497), .Y(n1109) );
  NAND3X1 U1065 ( .A(n1107), .B(n1108), .C(n1109), .Y(n485) );
  XOR2X1 U1066 ( .A(n476), .B(n478), .Y(n1110) );
  XOR2X1 U1067 ( .A(n1110), .B(n485), .Y(n472) );
  NAND2X1 U1068 ( .A(n476), .B(n478), .Y(n1111) );
  NAND2X1 U1069 ( .A(n476), .B(n485), .Y(n1112) );
  NAND2X1 U1070 ( .A(n478), .B(n485), .Y(n1113) );
  NAND3X1 U1071 ( .A(n1111), .B(n1112), .C(n1113), .Y(n471) );
  OR2X2 U1072 ( .A(n1297), .B(n920), .Y(n791) );
  INVX2 U1073 ( .A(n421), .Y(n1114) );
  XNOR2X1 U1074 ( .A(n191), .B(n1058), .Y(product[34]) );
  OR2X2 U1075 ( .A(n339), .B(n330), .Y(n1116) );
  INVX1 U1076 ( .A(n1116), .Y(n148) );
  XNOR2X1 U1077 ( .A(n1256), .B(n1294), .Y(n827) );
  XNOR2X1 U1078 ( .A(n1262), .B(n1288), .Y(n1117) );
  XOR2X1 U1079 ( .A(n629), .B(n597), .Y(n1118) );
  XOR2X1 U1080 ( .A(n1118), .B(n645), .Y(n426) );
  XOR2X1 U1081 ( .A(n1204), .B(n424), .Y(n1119) );
  XOR2X1 U1082 ( .A(n1119), .B(n426), .Y(n420) );
  NAND2X1 U1083 ( .A(n629), .B(n597), .Y(n1120) );
  NAND2X1 U1084 ( .A(n629), .B(n645), .Y(n1121) );
  NAND2X1 U1085 ( .A(n597), .B(n645), .Y(n1122) );
  NAND3X1 U1086 ( .A(n1120), .B(n1121), .C(n1122), .Y(n425) );
  NAND2X1 U1087 ( .A(n1204), .B(n424), .Y(n1123) );
  NAND2X1 U1088 ( .A(n1204), .B(n426), .Y(n1124) );
  NAND2X1 U1089 ( .A(n424), .B(n426), .Y(n1125) );
  NAND3X1 U1090 ( .A(n1123), .B(n1124), .C(n1125), .Y(n419) );
  XOR2X1 U1091 ( .A(n442), .B(n438), .Y(n1126) );
  XOR2X1 U1092 ( .A(n1126), .B(n440), .Y(n434) );
  NAND2X1 U1093 ( .A(n442), .B(n438), .Y(n1127) );
  NAND2X1 U1094 ( .A(n442), .B(n440), .Y(n1128) );
  NAND2X1 U1095 ( .A(n438), .B(n440), .Y(n1129) );
  NAND3X1 U1096 ( .A(n1127), .B(n1128), .C(n1129), .Y(n433) );
  XOR2X1 U1097 ( .A(n435), .B(n422), .Y(n1130) );
  XOR2X1 U1098 ( .A(n1130), .B(n433), .Y(n418) );
  NAND2X1 U1099 ( .A(n435), .B(n422), .Y(n1131) );
  NAND2X1 U1100 ( .A(n433), .B(n435), .Y(n1132) );
  NAND2X1 U1101 ( .A(n422), .B(n433), .Y(n1133) );
  NAND3X1 U1102 ( .A(n1131), .B(n1132), .C(n1133), .Y(n417) );
  XOR2X1 U1103 ( .A(n1295), .B(n1002), .Y(n843) );
  XOR2X1 U1104 ( .A(n465), .B(n1070), .Y(n1134) );
  XOR2X1 U1105 ( .A(n452), .B(n1134), .Y(n448) );
  NAND2X1 U1106 ( .A(n452), .B(n465), .Y(n1135) );
  NAND2X1 U1107 ( .A(n452), .B(n454), .Y(n1136) );
  NAND2X1 U1108 ( .A(n465), .B(n454), .Y(n1137) );
  NAND3X1 U1109 ( .A(n1136), .B(n1135), .C(n1137), .Y(n447) );
  INVX1 U1110 ( .A(n1211), .Y(n546) );
  NOR2X1 U1111 ( .A(n373), .B(n362), .Y(n1139) );
  XOR2X1 U1112 ( .A(n641), .B(n657), .Y(n1140) );
  XOR2X1 U1113 ( .A(n372), .B(n1140), .Y(n368) );
  NAND2X1 U1114 ( .A(n372), .B(n641), .Y(n1141) );
  NAND2X1 U1115 ( .A(n372), .B(n657), .Y(n1142) );
  NAND2X1 U1116 ( .A(n641), .B(n657), .Y(n1143) );
  NAND3X1 U1117 ( .A(n1142), .B(n1141), .C(n1143), .Y(n367) );
  INVX8 U1118 ( .A(n1272), .Y(n1273) );
  BUFX2 U1119 ( .A(n200), .Y(n1144) );
  NOR2X1 U1120 ( .A(n429), .B(n416), .Y(n1145) );
  INVX1 U1121 ( .A(n1296), .Y(n726) );
  AND2X2 U1122 ( .A(n1273), .B(n996), .Y(n581) );
  XNOR2X1 U1123 ( .A(n123), .B(n1146), .Y(product[42]) );
  AND2X2 U1124 ( .A(n122), .B(n1055), .Y(n1146) );
  XNOR2X1 U1125 ( .A(n145), .B(n1147), .Y(product[40]) );
  AND2X2 U1126 ( .A(n144), .B(n1187), .Y(n1147) );
  XNOR2X1 U1127 ( .A(n170), .B(n1057), .Y(product[37]) );
  INVX1 U1128 ( .A(n213), .Y(n212) );
  INVX2 U1129 ( .A(n1203), .Y(n1227) );
  INVX1 U1130 ( .A(n210), .Y(n289) );
  INVX1 U1131 ( .A(n1185), .Y(n290) );
  XOR2X1 U1132 ( .A(n451), .B(n455), .Y(n1148) );
  XOR2X1 U1133 ( .A(n453), .B(n1148), .Y(n436) );
  NAND2X1 U1134 ( .A(n453), .B(n451), .Y(n1149) );
  NAND2X1 U1135 ( .A(n453), .B(n455), .Y(n1150) );
  NAND2X1 U1136 ( .A(n451), .B(n455), .Y(n1151) );
  NAND3X1 U1137 ( .A(n1150), .B(n1149), .C(n1151), .Y(n435) );
  XOR2X1 U1138 ( .A(n436), .B(n1152), .Y(n432) );
  NAND2X1 U1139 ( .A(n436), .B(n447), .Y(n1153) );
  NAND2X1 U1140 ( .A(n436), .B(n1072), .Y(n1154) );
  NAND2X1 U1141 ( .A(n447), .B(n1072), .Y(n1155) );
  NAND3X1 U1142 ( .A(n1154), .B(n1153), .C(n1155), .Y(n431) );
  XOR2X1 U1143 ( .A(n694), .B(n582), .Y(n1156) );
  XOR2X1 U1144 ( .A(n710), .B(n1156), .Y(n442) );
  NAND2X1 U1145 ( .A(n710), .B(n694), .Y(n1157) );
  NAND2X1 U1146 ( .A(n710), .B(n582), .Y(n1158) );
  NAND2X1 U1147 ( .A(n694), .B(n582), .Y(n1159) );
  NAND3X1 U1148 ( .A(n1158), .B(n1157), .C(n1159), .Y(n441) );
  OR2X2 U1149 ( .A(n917), .B(n925), .Y(n1160) );
  OR2X1 U1150 ( .A(n860), .B(n1224), .Y(n1161) );
  NAND2X1 U1151 ( .A(n1160), .B(n1161), .Y(n710) );
  AND2X2 U1152 ( .A(n1297), .B(n997), .Y(n582) );
  INVX8 U1153 ( .A(b[0]), .Y(n917) );
  INVX4 U1154 ( .A(n1086), .Y(n1224) );
  INVX2 U1155 ( .A(n283), .Y(n1162) );
  INVX8 U1156 ( .A(n13), .Y(n1256) );
  XOR2X1 U1157 ( .A(n1256), .B(b[6]), .Y(n1164) );
  INVX2 U1158 ( .A(n1164), .Y(n1201) );
  XOR2X1 U1159 ( .A(n414), .B(n427), .Y(n1165) );
  XOR2X1 U1160 ( .A(n425), .B(n1165), .Y(n408) );
  NAND2X1 U1161 ( .A(n425), .B(n414), .Y(n1166) );
  NAND2X1 U1162 ( .A(n425), .B(n427), .Y(n1167) );
  NAND2X1 U1163 ( .A(n414), .B(n427), .Y(n1168) );
  NAND3X1 U1164 ( .A(n1167), .B(n1166), .C(n1168), .Y(n407) );
  NAND2X1 U1165 ( .A(n1187), .B(n1116), .Y(n1169) );
  XOR2X1 U1166 ( .A(n644), .B(n628), .Y(n1170) );
  XOR2X1 U1167 ( .A(n1170), .B(n596), .Y(n412) );
  NAND2X1 U1168 ( .A(n596), .B(n644), .Y(n1171) );
  NAND2X1 U1169 ( .A(n596), .B(n628), .Y(n1172) );
  NAND2X1 U1170 ( .A(n644), .B(n628), .Y(n1173) );
  NAND3X1 U1171 ( .A(n1172), .B(n1171), .C(n1173), .Y(n411) );
  OR2X2 U1172 ( .A(n1280), .B(n918), .Y(n1174) );
  INVX4 U1173 ( .A(n1299), .Y(n1298) );
  INVX1 U1174 ( .A(n1081), .Y(n1175) );
  XOR2X1 U1175 ( .A(n998), .B(n581), .Y(n1177) );
  XOR2X1 U1176 ( .A(n693), .B(n1177), .Y(n428) );
  NAND2X1 U1177 ( .A(n693), .B(n999), .Y(n1178) );
  NAND2X1 U1178 ( .A(n693), .B(n581), .Y(n1179) );
  NAND2X1 U1179 ( .A(n999), .B(n581), .Y(n1180) );
  NAND3X1 U1180 ( .A(n1179), .B(n1178), .C(n1180), .Y(n427) );
  BUFX2 U1181 ( .A(n1062), .Y(n1181) );
  BUFX4 U1182 ( .A(n1062), .Y(n1182) );
  INVX2 U1183 ( .A(n1243), .Y(n1244) );
  INVX2 U1184 ( .A(n1183), .Y(n385) );
  NAND2X1 U1185 ( .A(n888), .B(n996), .Y(n1183) );
  BUFX4 U1186 ( .A(n53), .Y(n1184) );
  NOR2X1 U1187 ( .A(n457), .B(n444), .Y(n1185) );
  BUFX4 U1188 ( .A(n52), .Y(n1206) );
  OR2X2 U1189 ( .A(n1169), .B(n80), .Y(n1186) );
  OR2X2 U1190 ( .A(n481), .B(n470), .Y(n1188) );
  OR2X2 U1191 ( .A(n322), .B(n329), .Y(n1187) );
  INVX1 U1192 ( .A(n93), .Y(n91) );
  OR2X2 U1193 ( .A(n302), .B(n307), .Y(n1193) );
  INVX4 U1194 ( .A(n1056), .Y(n1248) );
  XOR2X1 U1195 ( .A(n179), .B(n64), .Y(product[36]) );
  AND2X2 U1196 ( .A(n491), .B(n482), .Y(n1189) );
  OR2X1 U1197 ( .A(n491), .B(n482), .Y(n1190) );
  AND2X2 U1198 ( .A(n481), .B(n470), .Y(n1191) );
  XOR2X1 U1199 ( .A(n73), .B(n1192), .Y(product[46]) );
  NAND2X1 U1200 ( .A(n72), .B(n1060), .Y(n1192) );
  OR2X1 U1201 ( .A(n533), .B(n530), .Y(n1194) );
  OR2X1 U1202 ( .A(n523), .B(n518), .Y(n1195) );
  AND2X2 U1203 ( .A(n523), .B(n518), .Y(n1196) );
  AND2X2 U1204 ( .A(n533), .B(n530), .Y(n1197) );
  INVX2 U1205 ( .A(n554), .Y(n655) );
  INVX2 U1206 ( .A(n560), .Y(n691) );
  INVX2 U1207 ( .A(n548), .Y(n619) );
  INVX2 U1208 ( .A(n551), .Y(n637) );
  INVX2 U1209 ( .A(n545), .Y(n601) );
  OR2X1 U1210 ( .A(n539), .B(n538), .Y(n1198) );
  AND2X2 U1211 ( .A(n539), .B(n538), .Y(n1199) );
  XNOR2X1 U1212 ( .A(n542), .B(n573), .Y(n291) );
  INVX4 U1213 ( .A(n1261), .Y(n1263) );
  INVX2 U1214 ( .A(n1203), .Y(n1226) );
  INVX2 U1215 ( .A(n40), .Y(n1241) );
  INVX2 U1216 ( .A(n795), .Y(n1213) );
  INVX2 U1217 ( .A(n1233), .Y(n1214) );
  INVX2 U1218 ( .A(n1054), .Y(n1231) );
  AND2X2 U1219 ( .A(n725), .B(n572), .Y(n1200) );
  XNOR2X1 U1220 ( .A(n1261), .B(b[8]), .Y(n896) );
  AND2X2 U1221 ( .A(n899), .B(n9), .Y(n1203) );
  INVX1 U1222 ( .A(n1228), .Y(n558) );
  INVX1 U1223 ( .A(n189), .Y(n286) );
  INVX2 U1224 ( .A(n9), .Y(n1225) );
  BUFX2 U1225 ( .A(n52), .Y(n1205) );
  INVX4 U1226 ( .A(n1267), .Y(n1269) );
  XNOR2X1 U1227 ( .A(n25), .B(b[10]), .Y(n34) );
  INVX2 U1228 ( .A(n1241), .Y(n1242) );
  INVX2 U1229 ( .A(n46), .Y(n1245) );
  INVX2 U1230 ( .A(n1212), .Y(n642) );
  INVX2 U1231 ( .A(n1232), .Y(n1233) );
  AOI22X1 U1232 ( .A(n1213), .B(n1214), .C(n1066), .D(n1063), .Y(n1212) );
  INVX2 U1233 ( .A(n1086), .Y(n1223) );
  INVX2 U1234 ( .A(n1256), .Y(n1258) );
  INVX1 U1235 ( .A(n199), .Y(n201) );
  INVX4 U1236 ( .A(n51), .Y(n1249) );
  INVX1 U1237 ( .A(n1145), .Y(n288) );
  INVX1 U1238 ( .A(n200), .Y(n202) );
  XOR2X1 U1239 ( .A(n400), .B(n398), .Y(n1215) );
  XOR2X1 U1240 ( .A(n1215), .B(n396), .Y(n392) );
  NAND2X1 U1241 ( .A(n400), .B(n398), .Y(n1216) );
  NAND2X1 U1242 ( .A(n400), .B(n396), .Y(n1217) );
  NAND2X1 U1243 ( .A(n398), .B(n396), .Y(n1218) );
  NAND3X1 U1244 ( .A(n1216), .B(n1217), .C(n1218), .Y(n391) );
  XOR2X1 U1245 ( .A(n380), .B(n393), .Y(n1219) );
  XOR2X1 U1246 ( .A(n1219), .B(n391), .Y(n376) );
  NAND2X1 U1247 ( .A(n393), .B(n380), .Y(n1220) );
  NAND2X1 U1248 ( .A(n393), .B(n391), .Y(n1221) );
  NAND2X1 U1249 ( .A(n380), .B(n391), .Y(n1222) );
  NAND3X1 U1250 ( .A(n1220), .B(n1221), .C(n1222), .Y(n375) );
  INVX1 U1251 ( .A(n171), .Y(n173) );
  INVX1 U1252 ( .A(n172), .Y(n174) );
  INVX4 U1253 ( .A(n7), .Y(n1254) );
  INVX1 U1254 ( .A(n177), .Y(n284) );
  INVX1 U1255 ( .A(n1184), .Y(n155) );
  INVX1 U1256 ( .A(n194), .Y(n287) );
  INVX4 U1257 ( .A(n1), .Y(n1251) );
  INVX1 U1258 ( .A(n166), .Y(n283) );
  INVX1 U1259 ( .A(n161), .Y(n282) );
  INVX4 U1260 ( .A(n31), .Y(n1264) );
  INVX1 U1261 ( .A(n1206), .Y(n156) );
  INVX8 U1262 ( .A(n1249), .Y(n1250) );
  INVX8 U1263 ( .A(n1264), .Y(n1265) );
  INVX8 U1264 ( .A(n1270), .Y(n1271) );
  INVX8 U1265 ( .A(n1274), .Y(n1275) );
  INVX8 U1266 ( .A(n1281), .Y(n1282) );
  INVX8 U1267 ( .A(n1287), .Y(n1288) );
  INVX8 U1268 ( .A(n881), .Y(n1289) );
  INVX8 U1269 ( .A(n1290), .Y(n1291) );
  INVX2 U1270 ( .A(n100), .Y(n98) );
  INVX2 U1271 ( .A(n94), .Y(n92) );
  INVX2 U1272 ( .A(n79), .Y(n77) );
  INVX2 U1273 ( .A(n1284), .Y(n733) );
  OAI22X1 U1274 ( .A(n917), .B(n1251), .C(n6), .D(n925), .Y(n563) );
  OAI22X1 U1275 ( .A(n1208), .B(n924), .C(n1227), .D(n924), .Y(n560) );
  OAI22X1 U1276 ( .A(n1228), .B(n923), .C(n923), .D(n1229), .Y(n557) );
  INVX2 U1277 ( .A(n1258), .Y(n923) );
  OAI22X1 U1278 ( .A(n1209), .B(n922), .C(n1231), .D(n922), .Y(n554) );
  OAI22X1 U1279 ( .A(n1233), .B(n921), .C(n1236), .D(n921), .Y(n551) );
  INVX2 U1280 ( .A(n1263), .Y(n921) );
  OAI22X1 U1281 ( .A(n1238), .B(n920), .C(n1240), .D(n920), .Y(n548) );
  INVX2 U1282 ( .A(n1175), .Y(n920) );
  OAI22X1 U1283 ( .A(n1211), .B(n919), .C(n1163), .D(n919), .Y(n545) );
  OAI22X1 U1284 ( .A(n1246), .B(n918), .C(n1248), .D(n918), .Y(n542) );
  INVX2 U1285 ( .A(n337), .Y(n338) );
  INVX2 U1286 ( .A(n319), .Y(n320) );
  INVX2 U1287 ( .A(n305), .Y(n306) );
  INVX2 U1288 ( .A(n295), .Y(n296) );
  INVX2 U1289 ( .A(n84), .Y(n275) );
  INVX2 U1290 ( .A(n211), .Y(n209) );
  INVX2 U1291 ( .A(n149), .Y(n151) );
  INVX2 U1292 ( .A(n144), .Y(n142) );
  INVX2 U1293 ( .A(n122), .Y(n120) );
  INVX2 U1294 ( .A(n111), .Y(n109) );
  INVX2 U1295 ( .A(n105), .Y(n103) );
  INVX2 U1296 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n6, n5, n32, n11, 
        n4, n25, n23, n34, n21, n44, n17, n49, n33, n36, n10, n53}), .B({
        src2_data[16], src2_data[16:15], n3, n22, src2_data[12], n30, n16, n14, 
        n13, n19, src2_data[6:5], n52, n26, n20, n38, src2_data[0]}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n6, n5, n32, n11, 
        n4, n25, n23, n34, src1_data[7], n44, src1_data[5], n49, n33, 
        src1_data[2], n10, n53}), .B({src2_data[16], src2_data[16:15], n3, n22, 
        src2_data[12], n30, n16, n14, n13, n19, src2_data[6:5], n52, n26, n20, 
        n38, src2_data[0]}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_3 mult_35 ( .a({n51, src1_data[14:12], n46, src1_data[10:7], 
        n44, src1_data[5], n49, src1_data[3:2], n10, n53, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b({src2_data[15], n3, src2_data[13:10], n2, src2_data[8:0]}), .product({
        N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U3 ( .A(src2_data[9]), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  BUFX4 U6 ( .A(src2_data[14]), .Y(n3) );
  INVX2 U7 ( .A(src1_data[11]), .Y(n45) );
  INVX2 U9 ( .A(src1_data[4]), .Y(n48) );
  INVX4 U10 ( .A(n50), .Y(n51) );
  INVX2 U11 ( .A(src1_data[15]), .Y(n50) );
  INVX2 U12 ( .A(src1_data[6]), .Y(n43) );
  BUFX2 U13 ( .A(n46), .Y(n4) );
  BUFX2 U14 ( .A(src1_data[14]), .Y(n5) );
  BUFX2 U15 ( .A(n51), .Y(n6) );
  INVX1 U16 ( .A(src2_data[3]), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n8) );
  INVX2 U18 ( .A(src1_data[0]), .Y(n54) );
  INVX4 U19 ( .A(n54), .Y(n53) );
  INVX2 U20 ( .A(src1_data[1]), .Y(n9) );
  INVX4 U21 ( .A(n9), .Y(n10) );
  INVX1 U22 ( .A(src1_data[12]), .Y(n47) );
  INVX1 U23 ( .A(n47), .Y(n11) );
  INVX1 U24 ( .A(src2_data[8]), .Y(n12) );
  INVX2 U25 ( .A(n12), .Y(n13) );
  BUFX2 U26 ( .A(n2), .Y(n14) );
  INVX1 U27 ( .A(src2_data[10]), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n16) );
  BUFX2 U29 ( .A(src1_data[5]), .Y(n17) );
  INVX1 U30 ( .A(src2_data[7]), .Y(n18) );
  INVX2 U31 ( .A(n18), .Y(n19) );
  BUFX2 U32 ( .A(src2_data[2]), .Y(n20) );
  BUFX2 U33 ( .A(src1_data[7]), .Y(n21) );
  BUFX2 U34 ( .A(src2_data[13]), .Y(n22) );
  BUFX2 U35 ( .A(src1_data[9]), .Y(n23) );
  INVX1 U36 ( .A(src1_data[10]), .Y(n24) );
  INVX2 U37 ( .A(n24), .Y(n25) );
  BUFX2 U38 ( .A(n8), .Y(n26) );
  INVX1 U39 ( .A(src2_data[11]), .Y(n29) );
  INVX2 U40 ( .A(n29), .Y(n30) );
  INVX1 U41 ( .A(src1_data[13]), .Y(n31) );
  INVX2 U42 ( .A(n31), .Y(n32) );
  BUFX2 U43 ( .A(src1_data[3]), .Y(n33) );
  BUFX2 U44 ( .A(src1_data[8]), .Y(n34) );
  INVX1 U45 ( .A(src1_data[2]), .Y(n35) );
  INVX2 U46 ( .A(n35), .Y(n36) );
  INVX1 U47 ( .A(src2_data[1]), .Y(n37) );
  INVX2 U48 ( .A(n37), .Y(n38) );
  OR2X1 U49 ( .A(n57), .B(n95), .Y(n39) );
  NAND2X1 U50 ( .A(n39), .B(n56), .Y(overflow) );
  INVX2 U51 ( .A(n95), .Y(n90) );
  AND2X2 U52 ( .A(n59), .B(n58), .Y(n40) );
  AND2X2 U53 ( .A(alu_op[1]), .B(n58), .Y(n41) );
  AND2X2 U54 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n42) );
  INVX8 U55 ( .A(n43), .Y(n44) );
  INVX8 U56 ( .A(n45), .Y(n46) );
  INVX8 U57 ( .A(n48), .Y(n49) );
  BUFX2 U58 ( .A(src2_data[4]), .Y(n52) );
  INVX2 U59 ( .A(large_sum[16]), .Y(n94) );
  XOR2X1 U60 ( .A(n94), .B(large_sum[17]), .Y(n57) );
  INVX2 U61 ( .A(alu_op[1]), .Y(n59) );
  NAND2X1 U62 ( .A(alu_op[0]), .B(n59), .Y(n95) );
  INVX2 U63 ( .A(alu_op[0]), .Y(n58) );
  XOR2X1 U64 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n55) );
  AOI22X1 U65 ( .A(N26), .B(n42), .C(n55), .D(n41), .Y(n56) );
  AOI22X1 U66 ( .A(n53), .B(n40), .C(full_mult[30]), .D(n42), .Y(n61) );
  AOI22X1 U67 ( .A(large_dif[0]), .B(n41), .C(large_sum[0]), .D(n90), .Y(n60)
         );
  NAND2X1 U68 ( .A(n61), .B(n60), .Y(result[0]) );
  AOI22X1 U69 ( .A(n10), .B(n40), .C(full_mult[31]), .D(n42), .Y(n63) );
  AOI22X1 U70 ( .A(large_dif[1]), .B(n41), .C(large_sum[1]), .D(n90), .Y(n62)
         );
  NAND2X1 U71 ( .A(n63), .B(n62), .Y(result[1]) );
  AOI22X1 U72 ( .A(n36), .B(n40), .C(full_mult[32]), .D(n42), .Y(n65) );
  AOI22X1 U73 ( .A(large_dif[2]), .B(n41), .C(large_sum[2]), .D(n90), .Y(n64)
         );
  NAND2X1 U74 ( .A(n65), .B(n64), .Y(result[2]) );
  AOI22X1 U75 ( .A(n33), .B(n40), .C(full_mult[33]), .D(n42), .Y(n67) );
  AOI22X1 U76 ( .A(large_dif[3]), .B(n41), .C(large_sum[3]), .D(n90), .Y(n66)
         );
  NAND2X1 U77 ( .A(n67), .B(n66), .Y(result[3]) );
  AOI22X1 U78 ( .A(n49), .B(n40), .C(full_mult[34]), .D(n42), .Y(n69) );
  AOI22X1 U79 ( .A(large_dif[4]), .B(n41), .C(large_sum[4]), .D(n90), .Y(n68)
         );
  NAND2X1 U80 ( .A(n69), .B(n68), .Y(result[4]) );
  AOI22X1 U81 ( .A(n17), .B(n40), .C(full_mult[35]), .D(n42), .Y(n71) );
  AOI22X1 U82 ( .A(large_dif[5]), .B(n41), .C(large_sum[5]), .D(n90), .Y(n70)
         );
  NAND2X1 U83 ( .A(n71), .B(n70), .Y(result[5]) );
  AOI22X1 U84 ( .A(n44), .B(n40), .C(full_mult[36]), .D(n42), .Y(n73) );
  AOI22X1 U85 ( .A(large_dif[6]), .B(n41), .C(large_sum[6]), .D(n90), .Y(n72)
         );
  NAND2X1 U86 ( .A(n72), .B(n73), .Y(result[6]) );
  AOI22X1 U87 ( .A(n21), .B(n40), .C(full_mult[37]), .D(n42), .Y(n75) );
  AOI22X1 U88 ( .A(large_dif[7]), .B(n41), .C(large_sum[7]), .D(n90), .Y(n74)
         );
  NAND2X1 U89 ( .A(n74), .B(n75), .Y(result[7]) );
  AOI22X1 U90 ( .A(n34), .B(n40), .C(full_mult[38]), .D(n42), .Y(n77) );
  AOI22X1 U91 ( .A(large_dif[8]), .B(n41), .C(large_sum[8]), .D(n90), .Y(n76)
         );
  NAND2X1 U92 ( .A(n77), .B(n76), .Y(result[8]) );
  AOI22X1 U93 ( .A(n23), .B(n40), .C(full_mult[39]), .D(n42), .Y(n79) );
  AOI22X1 U94 ( .A(large_dif[9]), .B(n41), .C(large_sum[9]), .D(n90), .Y(n78)
         );
  NAND2X1 U95 ( .A(n78), .B(n79), .Y(result[9]) );
  AOI22X1 U96 ( .A(n25), .B(n40), .C(full_mult[40]), .D(n42), .Y(n81) );
  AOI22X1 U97 ( .A(large_dif[10]), .B(n41), .C(large_sum[10]), .D(n90), .Y(n80) );
  NAND2X1 U98 ( .A(n80), .B(n81), .Y(result[10]) );
  AOI22X1 U99 ( .A(n4), .B(n40), .C(full_mult[41]), .D(n42), .Y(n83) );
  AOI22X1 U100 ( .A(large_dif[11]), .B(n41), .C(large_sum[11]), .D(n90), .Y(
        n82) );
  NAND2X1 U101 ( .A(n82), .B(n83), .Y(result[11]) );
  AOI22X1 U102 ( .A(n11), .B(n40), .C(full_mult[42]), .D(n42), .Y(n85) );
  AOI22X1 U103 ( .A(large_dif[12]), .B(n41), .C(large_sum[12]), .D(n90), .Y(
        n84) );
  NAND2X1 U104 ( .A(n84), .B(n85), .Y(result[12]) );
  AOI22X1 U105 ( .A(n32), .B(n40), .C(full_mult[43]), .D(n42), .Y(n87) );
  AOI22X1 U106 ( .A(large_dif[13]), .B(n41), .C(large_sum[13]), .D(n90), .Y(
        n86) );
  NAND2X1 U107 ( .A(n86), .B(n87), .Y(result[13]) );
  AOI22X1 U108 ( .A(n5), .B(n40), .C(full_mult[44]), .D(n42), .Y(n89) );
  AOI22X1 U109 ( .A(large_dif[14]), .B(n41), .C(large_sum[14]), .D(n90), .Y(
        n88) );
  NAND2X1 U110 ( .A(n88), .B(n89), .Y(result[14]) );
  AOI22X1 U111 ( .A(n6), .B(n40), .C(full_mult[45]), .D(n42), .Y(n92) );
  AOI22X1 U112 ( .A(large_dif[15]), .B(n41), .C(large_sum[15]), .D(n90), .Y(
        n91) );
  NAND2X1 U113 ( .A(n91), .B(n92), .Y(result[15]) );
  AOI22X1 U114 ( .A(src1_data[16]), .B(n40), .C(large_dif[16]), .D(n41), .Y(
        n93) );
  OAI21X1 U115 ( .A(n95), .B(n94), .C(n93), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n7), .Y(n53) );
  INVX1 U3 ( .A(n8), .Y(n52) );
  INVX1 U4 ( .A(n9), .Y(n50) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n18), .Y(n32) );
  INVX1 U10 ( .A(n17), .Y(n34) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n20), .Y(n30) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n14), .Y(n40) );
  INVX1 U16 ( .A(n16), .Y(n36) );
  INVX1 U17 ( .A(n12), .Y(n44) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n40) );
  INVX1 U3 ( .A(n12), .Y(n44) );
  INVX1 U4 ( .A(n9), .Y(n50) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n15), .Y(n38) );
  INVX1 U10 ( .A(n17), .Y(n34) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n16), .Y(n36) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n9), .Y(n50) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX1 U7 ( .A(n22), .Y(n28) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n9), .Y(n50) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n15), .Y(n38) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n11), .Y(n46) );
  INVX1 U14 ( .A(n13), .Y(n42) );
  INVX1 U15 ( .A(n18), .Y(n32) );
  INVX1 U16 ( .A(n22), .Y(n28) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n9), .Y(n50) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n15), .Y(n38) );
  INVX1 U13 ( .A(n17), .Y(n34) );
  INVX1 U14 ( .A(n11), .Y(n46) );
  INVX1 U15 ( .A(n13), .Y(n42) );
  INVX1 U16 ( .A(n18), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U18 ( .A(n5), .Y(n55) );
  MUX2X1 U19 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U20 ( .A(n6), .Y(n54) );
  MUX2X1 U21 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(n53) );
  MUX2X1 U23 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U24 ( .A(n8), .Y(n52) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n735, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n733), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n734), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n731), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n733), .Y(n10) );
  NOR2X1 U29 ( .A(n732), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n734), .B(n731), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[0]), .new_value({n722, n3, n717, n714, 
        n711, n709, n2, n704, n89, n699, n697, n695, n692, n688, n686, n683, 
        n680}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[1]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[2]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[3]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[4]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[5]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[6]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[7]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[8]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[9]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[10]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[11]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[12]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[13]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[14]), .new_value({n722, n719, n717, n714, 
        n711, n709, n706, n704, n701, n699, n697, n695, n692, n688, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[15]), .new_value({n721, n719, n716, n713, 
        n711, n708, n706, n703, n701, n699, n697, n694, n691, n689, n685, n682, 
        n680}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n123), .Y(n364) );
  INVX4 U3 ( .A(n15), .Y(n1) );
  INVX1 U4 ( .A(n633), .Y(n75) );
  INVX4 U5 ( .A(w_data[9]), .Y(n702) );
  AND2X1 U31 ( .A(N15), .B(N14), .Y(n82) );
  INVX2 U32 ( .A(n78), .Y(n198) );
  INVX2 U33 ( .A(\regs_matrix[13][5] ), .Y(n79) );
  INVX2 U34 ( .A(\regs_matrix[15][5] ), .Y(n80) );
  BUFX2 U35 ( .A(n637), .Y(n638) );
  INVX2 U36 ( .A(n128), .Y(n375) );
  INVX2 U37 ( .A(n403), .Y(n655) );
  INVX2 U38 ( .A(n122), .Y(n361) );
  INVX2 U39 ( .A(n495), .Y(r2_data[7]) );
  INVX2 U40 ( .A(n96), .Y(r2_data[8]) );
  BUFX2 U41 ( .A(n642), .Y(n676) );
  INVX2 U42 ( .A(n638), .Y(n673) );
  INVX2 U43 ( .A(n99), .Y(n100) );
  INVX2 U44 ( .A(n129), .Y(n379) );
  INVX2 U45 ( .A(n124), .Y(n368) );
  INVX2 U46 ( .A(n86), .Y(n72) );
  INVX4 U47 ( .A(n662), .Y(n663) );
  INVX2 U48 ( .A(n368), .Y(n97) );
  INVX4 U49 ( .A(n644), .Y(n645) );
  BUFX2 U50 ( .A(n642), .Y(n644) );
  INVX4 U51 ( .A(n15), .Y(n650) );
  BUFX2 U52 ( .A(n105), .Y(n28) );
  INVX2 U53 ( .A(n735), .Y(n73) );
  BUFX2 U54 ( .A(n104), .Y(n22) );
  INVX2 U55 ( .A(w_data[4]), .Y(n690) );
  INVX4 U56 ( .A(n125), .Y(n372) );
  INVX2 U57 ( .A(n655), .Y(n656) );
  INVX8 U58 ( .A(n372), .Y(n373) );
  BUFX2 U59 ( .A(n110), .Y(n660) );
  INVX1 U60 ( .A(n705), .Y(n2) );
  INVX1 U61 ( .A(n718), .Y(n3) );
  INVX2 U62 ( .A(n364), .Y(n366) );
  INVX2 U63 ( .A(N10), .Y(n87) );
  BUFX2 U64 ( .A(n378), .Y(n68) );
  BUFX2 U65 ( .A(n376), .Y(n24) );
  INVX2 U66 ( .A(n108), .Y(n105) );
  INVX4 U67 ( .A(n655), .Y(n4) );
  INVX2 U68 ( .A(n379), .Y(n380) );
  AND2X2 U69 ( .A(n75), .B(n18), .Y(n14) );
  AND2X2 U70 ( .A(n75), .B(n18), .Y(n15) );
  INVX1 U71 ( .A(N15), .Y(n16) );
  INVX2 U72 ( .A(N15), .Y(n633) );
  INVX8 U73 ( .A(n657), .Y(n658) );
  INVX4 U74 ( .A(n404), .Y(n657) );
  AND2X2 U75 ( .A(N11), .B(N10), .Y(n109) );
  NAND2X1 U76 ( .A(N16), .B(n634), .Y(n17) );
  INVX2 U77 ( .A(n17), .Y(n18) );
  INVX2 U78 ( .A(n379), .Y(n381) );
  BUFX2 U79 ( .A(n382), .Y(n19) );
  BUFX2 U80 ( .A(n382), .Y(n20) );
  INVX1 U81 ( .A(n108), .Y(n382) );
  BUFX2 U82 ( .A(n104), .Y(n21) );
  AND2X1 U83 ( .A(N15), .B(n634), .Y(n70) );
  BUFX2 U84 ( .A(n376), .Y(n23) );
  BUFX2 U85 ( .A(n376), .Y(n25) );
  BUFX2 U86 ( .A(n105), .Y(n26) );
  BUFX2 U87 ( .A(n105), .Y(n27) );
  INVX4 U88 ( .A(n380), .Y(n29) );
  INVX8 U89 ( .A(n29), .Y(n30) );
  INVX2 U90 ( .A(n107), .Y(n31) );
  INVX2 U91 ( .A(n107), .Y(n32) );
  INVX2 U92 ( .A(n107), .Y(n33) );
  INVX2 U93 ( .A(n107), .Y(n34) );
  INVX1 U94 ( .A(n107), .Y(n35) );
  INVX1 U95 ( .A(n107), .Y(n36) );
  INVX1 U96 ( .A(n107), .Y(n37) );
  BUFX2 U97 ( .A(n374), .Y(n38) );
  BUFX2 U98 ( .A(n374), .Y(n39) );
  BUFX2 U99 ( .A(n374), .Y(n40) );
  BUFX2 U100 ( .A(n374), .Y(n41) );
  BUFX2 U101 ( .A(n374), .Y(n42) );
  BUFX2 U102 ( .A(n374), .Y(n43) );
  BUFX2 U103 ( .A(n374), .Y(n44) );
  INVX2 U104 ( .A(n107), .Y(n374) );
  INVX1 U105 ( .A(n379), .Y(n102) );
  INVX2 U106 ( .A(n363), .Y(n45) );
  INVX1 U107 ( .A(n361), .Y(n46) );
  INVX1 U108 ( .A(n361), .Y(n47) );
  INVX1 U109 ( .A(n361), .Y(n48) );
  INVX1 U110 ( .A(n361), .Y(n49) );
  INVX1 U111 ( .A(n361), .Y(n50) );
  INVX1 U112 ( .A(n361), .Y(n51) );
  INVX1 U113 ( .A(n362), .Y(n52) );
  INVX1 U114 ( .A(n362), .Y(n53) );
  INVX1 U115 ( .A(n362), .Y(n54) );
  INVX1 U116 ( .A(n362), .Y(n55) );
  INVX1 U117 ( .A(n362), .Y(n56) );
  INVX2 U118 ( .A(n362), .Y(n57) );
  INVX1 U119 ( .A(n363), .Y(n58) );
  INVX1 U120 ( .A(n363), .Y(n59) );
  INVX1 U121 ( .A(n363), .Y(n60) );
  INVX1 U122 ( .A(n363), .Y(n61) );
  INVX1 U123 ( .A(n363), .Y(n62) );
  INVX1 U124 ( .A(n363), .Y(n63) );
  INVX1 U125 ( .A(n122), .Y(n64) );
  INVX2 U126 ( .A(n45), .Y(n65) );
  BUFX2 U127 ( .A(n361), .Y(n363) );
  INVX2 U128 ( .A(n26), .Y(n66) );
  BUFX2 U129 ( .A(n378), .Y(n67) );
  BUFX2 U130 ( .A(n378), .Y(n69) );
  INVX2 U131 ( .A(N16), .Y(n76) );
  INVX2 U132 ( .A(N16), .Y(n77) );
  INVX2 U133 ( .A(n647), .Y(n649) );
  INVX1 U134 ( .A(n661), .Y(n71) );
  BUFX4 U135 ( .A(n110), .Y(n661) );
  INVX2 U136 ( .A(n368), .Y(n98) );
  INVX2 U137 ( .A(n99), .Y(n101) );
  MUX2X1 U138 ( .B(n541), .A(n540), .S(n668), .Y(r2_data[10]) );
  INVX2 U139 ( .A(n668), .Y(n666) );
  MUX2X1 U140 ( .B(n454), .A(n453), .S(n668), .Y(r2_data[4]) );
  INVX2 U141 ( .A(n638), .Y(n81) );
  MUX2X1 U142 ( .B(n527), .A(n526), .S(n668), .Y(r2_data[9]) );
  INVX8 U143 ( .A(n639), .Y(n84) );
  INVX2 U144 ( .A(n655), .Y(n677) );
  INVX4 U145 ( .A(n687), .Y(n689) );
  INVX4 U146 ( .A(n687), .Y(n688) );
  INVX4 U147 ( .A(n684), .Y(n686) );
  INVX4 U148 ( .A(n684), .Y(n685) );
  INVX2 U149 ( .A(N12), .Y(n86) );
  BUFX4 U150 ( .A(n364), .Y(n365) );
  INVX1 U151 ( .A(N12), .Y(n85) );
  INVX8 U152 ( .A(n73), .Y(r1_data[14]) );
  INVX4 U153 ( .A(n690), .Y(n692) );
  INVX4 U154 ( .A(n690), .Y(n691) );
  AND2X2 U155 ( .A(n70), .B(n77), .Y(n642) );
  MUX2X1 U156 ( .B(n165), .A(n164), .S(n386), .Y(r1_data[3]) );
  INVX8 U157 ( .A(n705), .Y(n706) );
  INVX8 U158 ( .A(n657), .Y(n659) );
  AOI22X1 U159 ( .A(n79), .B(n379), .C(n80), .D(n66), .Y(n78) );
  INVX2 U160 ( .A(n662), .Y(n83) );
  BUFX4 U161 ( .A(n110), .Y(n662) );
  INVX2 U162 ( .A(n87), .Y(n88) );
  INVX1 U163 ( .A(n700), .Y(n89) );
  INVX8 U164 ( .A(n660), .Y(n665) );
  BUFX2 U165 ( .A(N11), .Y(n90) );
  INVX2 U166 ( .A(N10), .Y(n358) );
  NAND2X1 U167 ( .A(n467), .B(n668), .Y(n91) );
  NAND2X1 U168 ( .A(n468), .B(n666), .Y(n92) );
  NAND2X1 U169 ( .A(n91), .B(n92), .Y(n93) );
  INVX4 U170 ( .A(n93), .Y(r2_data[5]) );
  NAND2X1 U171 ( .A(n512), .B(n668), .Y(n94) );
  NAND2X1 U172 ( .A(n513), .B(n666), .Y(n95) );
  NAND2X1 U173 ( .A(n94), .B(n95), .Y(n96) );
  INVX2 U174 ( .A(n102), .Y(n99) );
  INVX2 U175 ( .A(n379), .Y(n103) );
  INVX2 U176 ( .A(n375), .Y(n104) );
  INVX2 U177 ( .A(n108), .Y(n106) );
  AND2X2 U178 ( .A(n72), .B(n109), .Y(n108) );
  INVX2 U179 ( .A(w_data[16]), .Y(n720) );
  INVX2 U180 ( .A(w_data[5]), .Y(n693) );
  INVX2 U181 ( .A(w_data[3]), .Y(n687) );
  INVX2 U182 ( .A(w_data[2]), .Y(n684) );
  INVX2 U183 ( .A(w_data[1]), .Y(n681) );
  INVX2 U184 ( .A(w_data[0]), .Y(n679) );
  INVX8 U185 ( .A(n661), .Y(n664) );
  INVX2 U186 ( .A(n638), .Y(n641) );
  BUFX2 U187 ( .A(n361), .Y(n362) );
  INVX2 U188 ( .A(n643), .Y(n671) );
  AND2X2 U189 ( .A(n85), .B(n109), .Y(n107) );
  INVX2 U190 ( .A(n108), .Y(n383) );
  INVX2 U191 ( .A(n368), .Y(n371) );
  INVX2 U192 ( .A(n368), .Y(n370) );
  INVX2 U193 ( .A(n375), .Y(n377) );
  INVX2 U194 ( .A(n375), .Y(n378) );
  INVX2 U195 ( .A(n375), .Y(n376) );
  INVX2 U196 ( .A(n368), .Y(n369) );
  AND2X2 U197 ( .A(n82), .B(N16), .Y(n110) );
  INVX2 U198 ( .A(n386), .Y(n385) );
  INVX2 U199 ( .A(n386), .Y(n384) );
  INVX2 U200 ( .A(N13), .Y(n386) );
  INVX2 U201 ( .A(n668), .Y(n667) );
  INVX2 U202 ( .A(n720), .Y(n722) );
  INVX2 U203 ( .A(n720), .Y(n721) );
  INVX2 U204 ( .A(N17), .Y(n668) );
  INVX4 U205 ( .A(n712), .Y(n714) );
  INVX4 U206 ( .A(n712), .Y(n713) );
  INVX4 U207 ( .A(n702), .Y(n703) );
  INVX4 U208 ( .A(n702), .Y(n704) );
  INVX4 U209 ( .A(n715), .Y(n716) );
  INVX4 U210 ( .A(n715), .Y(n717) );
  INVX4 U211 ( .A(n707), .Y(n708) );
  INVX4 U212 ( .A(n707), .Y(n709) );
  INVX2 U213 ( .A(n693), .Y(n695) );
  INVX2 U214 ( .A(n693), .Y(n694) );
  INVX2 U215 ( .A(n681), .Y(n683) );
  INVX2 U216 ( .A(n681), .Y(n682) );
  INVX2 U217 ( .A(n679), .Y(n680) );
  BUFX2 U218 ( .A(n_reset), .Y(n723) );
  BUFX2 U219 ( .A(n_reset), .Y(n724) );
  BUFX2 U220 ( .A(n_reset), .Y(n725) );
  BUFX2 U221 ( .A(n_reset), .Y(n726) );
  BUFX2 U222 ( .A(n_reset), .Y(n727) );
  BUFX2 U223 ( .A(n_reset), .Y(n728) );
  BUFX2 U224 ( .A(n_reset), .Y(n729) );
  BUFX2 U225 ( .A(n_reset), .Y(n730) );
  AOI22X1 U226 ( .A(n114), .B(n113), .C(n112), .D(n111), .Y(n115) );
  INVX2 U227 ( .A(n115), .Y(r1_data[16]) );
  MUX2X1 U228 ( .B(n116), .A(n117), .S(n384), .Y(r1_data[0]) );
  NAND2X1 U229 ( .A(n118), .B(n119), .Y(n117) );
  NOR2X1 U230 ( .A(n120), .B(n121), .Y(n119) );
  OAI22X1 U231 ( .A(\regs_matrix[8][0] ), .B(n48), .C(\regs_matrix[10][0] ), 
        .D(n366), .Y(n121) );
  OAI22X1 U232 ( .A(\regs_matrix[12][0] ), .B(n369), .C(\regs_matrix[14][0] ), 
        .D(n373), .Y(n120) );
  NOR2X1 U233 ( .A(n127), .B(n126), .Y(n118) );
  OAI22X1 U234 ( .A(\regs_matrix[11][0] ), .B(n31), .C(\regs_matrix[9][0] ), 
        .D(n377), .Y(n127) );
  OAI22X1 U235 ( .A(\regs_matrix[13][0] ), .B(n381), .C(\regs_matrix[15][0] ), 
        .D(n383), .Y(n126) );
  NAND2X1 U236 ( .A(n130), .B(n131), .Y(n116) );
  NOR2X1 U237 ( .A(n132), .B(n133), .Y(n131) );
  OAI22X1 U238 ( .A(outreg_data[0]), .B(n49), .C(\regs_matrix[2][0] ), .D(n366), .Y(n133) );
  OAI22X1 U239 ( .A(\regs_matrix[4][0] ), .B(n97), .C(\regs_matrix[6][0] ), 
        .D(n373), .Y(n132) );
  NOR2X1 U240 ( .A(n134), .B(n135), .Y(n130) );
  OAI22X1 U241 ( .A(\regs_matrix[3][0] ), .B(n32), .C(\regs_matrix[1][0] ), 
        .D(n67), .Y(n135) );
  OAI22X1 U242 ( .A(\regs_matrix[5][0] ), .B(n381), .C(\regs_matrix[7][0] ), 
        .D(n383), .Y(n134) );
  MUX2X1 U243 ( .B(n136), .A(n137), .S(n385), .Y(r1_data[1]) );
  NAND2X1 U244 ( .A(n138), .B(n139), .Y(n137) );
  NOR2X1 U245 ( .A(n140), .B(n141), .Y(n139) );
  OAI22X1 U246 ( .A(\regs_matrix[8][1] ), .B(n50), .C(\regs_matrix[10][1] ), 
        .D(n366), .Y(n141) );
  OAI22X1 U247 ( .A(\regs_matrix[12][1] ), .B(n369), .C(\regs_matrix[14][1] ), 
        .D(n373), .Y(n140) );
  NOR2X1 U248 ( .A(n142), .B(n143), .Y(n138) );
  OAI22X1 U249 ( .A(\regs_matrix[11][1] ), .B(n33), .C(\regs_matrix[9][1] ), 
        .D(n21), .Y(n143) );
  OAI22X1 U250 ( .A(\regs_matrix[13][1] ), .B(n381), .C(\regs_matrix[15][1] ), 
        .D(n106), .Y(n142) );
  NAND2X1 U251 ( .A(n144), .B(n145), .Y(n136) );
  NOR2X1 U252 ( .A(n146), .B(n147), .Y(n145) );
  OAI22X1 U253 ( .A(outreg_data[1]), .B(n51), .C(\regs_matrix[2][1] ), .D(n366), .Y(n147) );
  OAI22X1 U254 ( .A(\regs_matrix[4][1] ), .B(n369), .C(\regs_matrix[6][1] ), 
        .D(n373), .Y(n146) );
  NOR2X1 U255 ( .A(n148), .B(n149), .Y(n144) );
  OAI22X1 U256 ( .A(\regs_matrix[3][1] ), .B(n34), .C(\regs_matrix[1][1] ), 
        .D(n23), .Y(n149) );
  OAI22X1 U257 ( .A(\regs_matrix[5][1] ), .B(n103), .C(\regs_matrix[7][1] ), 
        .D(n19), .Y(n148) );
  MUX2X1 U258 ( .B(n150), .A(n151), .S(n384), .Y(r1_data[2]) );
  NAND2X1 U259 ( .A(n152), .B(n153), .Y(n151) );
  NOR2X1 U260 ( .A(n154), .B(n155), .Y(n153) );
  OAI22X1 U261 ( .A(\regs_matrix[8][2] ), .B(n49), .C(\regs_matrix[10][2] ), 
        .D(n366), .Y(n155) );
  OAI22X1 U262 ( .A(\regs_matrix[12][2] ), .B(n370), .C(\regs_matrix[14][2] ), 
        .D(n373), .Y(n154) );
  NOR2X1 U263 ( .A(n156), .B(n157), .Y(n152) );
  OAI22X1 U264 ( .A(\regs_matrix[11][2] ), .B(n40), .C(\regs_matrix[9][2] ), 
        .D(n24), .Y(n157) );
  OAI22X1 U265 ( .A(\regs_matrix[13][2] ), .B(n30), .C(\regs_matrix[15][2] ), 
        .D(n20), .Y(n156) );
  NAND2X1 U266 ( .A(n158), .B(n159), .Y(n150) );
  NOR2X1 U267 ( .A(n160), .B(n161), .Y(n159) );
  OAI22X1 U268 ( .A(outreg_data[2]), .B(n51), .C(\regs_matrix[2][2] ), .D(n366), .Y(n161) );
  OAI22X1 U269 ( .A(\regs_matrix[4][2] ), .B(n97), .C(\regs_matrix[6][2] ), 
        .D(n373), .Y(n160) );
  NOR2X1 U270 ( .A(n162), .B(n163), .Y(n158) );
  OAI22X1 U271 ( .A(\regs_matrix[3][2] ), .B(n42), .C(\regs_matrix[1][2] ), 
        .D(n377), .Y(n163) );
  OAI22X1 U272 ( .A(\regs_matrix[5][2] ), .B(n30), .C(\regs_matrix[7][2] ), 
        .D(n106), .Y(n162) );
  NAND2X1 U273 ( .A(n166), .B(n167), .Y(n165) );
  NOR2X1 U274 ( .A(n168), .B(n169), .Y(n167) );
  OAI22X1 U275 ( .A(\regs_matrix[8][3] ), .B(n57), .C(\regs_matrix[10][3] ), 
        .D(n366), .Y(n169) );
  OAI22X1 U276 ( .A(\regs_matrix[12][3] ), .B(n371), .C(\regs_matrix[14][3] ), 
        .D(n373), .Y(n168) );
  NOR2X1 U277 ( .A(n170), .B(n171), .Y(n166) );
  OAI22X1 U278 ( .A(\regs_matrix[11][3] ), .B(n34), .C(\regs_matrix[9][3] ), 
        .D(n24), .Y(n171) );
  OAI22X1 U279 ( .A(\regs_matrix[13][3] ), .B(n101), .C(\regs_matrix[15][3] ), 
        .D(n106), .Y(n170) );
  NAND2X1 U280 ( .A(n172), .B(n173), .Y(n164) );
  NOR2X1 U281 ( .A(n174), .B(n175), .Y(n173) );
  OAI22X1 U282 ( .A(outreg_data[3]), .B(n47), .C(\regs_matrix[2][3] ), .D(n366), .Y(n175) );
  OAI22X1 U283 ( .A(\regs_matrix[4][3] ), .B(n98), .C(\regs_matrix[6][3] ), 
        .D(n373), .Y(n174) );
  NOR2X1 U284 ( .A(n176), .B(n177), .Y(n172) );
  OAI22X1 U285 ( .A(\regs_matrix[3][3] ), .B(n43), .C(\regs_matrix[1][3] ), 
        .D(n377), .Y(n177) );
  OAI22X1 U286 ( .A(\regs_matrix[5][3] ), .B(n30), .C(\regs_matrix[7][3] ), 
        .D(n27), .Y(n176) );
  MUX2X1 U287 ( .B(n178), .A(n179), .S(n384), .Y(r1_data[4]) );
  NAND2X1 U288 ( .A(n180), .B(n181), .Y(n179) );
  NOR2X1 U289 ( .A(n182), .B(n183), .Y(n181) );
  OAI22X1 U290 ( .A(\regs_matrix[8][4] ), .B(n46), .C(\regs_matrix[10][4] ), 
        .D(n367), .Y(n183) );
  OAI22X1 U291 ( .A(\regs_matrix[12][4] ), .B(n97), .C(\regs_matrix[14][4] ), 
        .D(n373), .Y(n182) );
  NOR2X1 U292 ( .A(n184), .B(n185), .Y(n180) );
  OAI22X1 U293 ( .A(\regs_matrix[11][4] ), .B(n31), .C(\regs_matrix[9][4] ), 
        .D(n69), .Y(n185) );
  OAI22X1 U294 ( .A(\regs_matrix[13][4] ), .B(n30), .C(\regs_matrix[15][4] ), 
        .D(n20), .Y(n184) );
  NAND2X1 U295 ( .A(n186), .B(n187), .Y(n178) );
  NOR2X1 U296 ( .A(n188), .B(n189), .Y(n187) );
  OAI22X1 U297 ( .A(outreg_data[4]), .B(n61), .C(\regs_matrix[2][4] ), .D(n367), .Y(n189) );
  OAI22X1 U298 ( .A(\regs_matrix[4][4] ), .B(n98), .C(\regs_matrix[6][4] ), 
        .D(n373), .Y(n188) );
  NOR2X1 U299 ( .A(n190), .B(n191), .Y(n186) );
  OAI22X1 U300 ( .A(\regs_matrix[3][4] ), .B(n44), .C(\regs_matrix[1][4] ), 
        .D(n24), .Y(n191) );
  OAI22X1 U301 ( .A(\regs_matrix[5][4] ), .B(n103), .C(\regs_matrix[7][4] ), 
        .D(n20), .Y(n190) );
  MUX2X1 U302 ( .B(n192), .A(n193), .S(n385), .Y(r1_data[5]) );
  NAND2X1 U303 ( .A(n194), .B(n195), .Y(n193) );
  NOR2X1 U304 ( .A(n196), .B(n197), .Y(n195) );
  OAI22X1 U305 ( .A(\regs_matrix[8][5] ), .B(n53), .C(\regs_matrix[10][5] ), 
        .D(n367), .Y(n197) );
  OAI22X1 U306 ( .A(\regs_matrix[12][5] ), .B(n98), .C(\regs_matrix[14][5] ), 
        .D(n373), .Y(n196) );
  NOR2X1 U307 ( .A(n198), .B(n199), .Y(n194) );
  OAI22X1 U308 ( .A(\regs_matrix[11][5] ), .B(n39), .C(\regs_matrix[9][5] ), 
        .D(n68), .Y(n199) );
  NAND2X1 U309 ( .A(n200), .B(n201), .Y(n192) );
  NOR2X1 U310 ( .A(n202), .B(n203), .Y(n201) );
  OAI22X1 U311 ( .A(outreg_data[5]), .B(n55), .C(\regs_matrix[2][5] ), .D(n367), .Y(n203) );
  OAI22X1 U312 ( .A(\regs_matrix[4][5] ), .B(n371), .C(\regs_matrix[6][5] ), 
        .D(n373), .Y(n202) );
  NOR2X1 U313 ( .A(n204), .B(n205), .Y(n200) );
  OAI22X1 U314 ( .A(\regs_matrix[3][5] ), .B(n36), .C(\regs_matrix[1][5] ), 
        .D(n22), .Y(n205) );
  OAI22X1 U315 ( .A(\regs_matrix[5][5] ), .B(n30), .C(\regs_matrix[7][5] ), 
        .D(n28), .Y(n204) );
  MUX2X1 U316 ( .B(n206), .A(n207), .S(n384), .Y(r1_data[6]) );
  NAND2X1 U317 ( .A(n208), .B(n209), .Y(n207) );
  NOR2X1 U318 ( .A(n210), .B(n211), .Y(n209) );
  OAI22X1 U319 ( .A(\regs_matrix[8][6] ), .B(n48), .C(\regs_matrix[10][6] ), 
        .D(n367), .Y(n211) );
  OAI22X1 U320 ( .A(\regs_matrix[12][6] ), .B(n370), .C(\regs_matrix[14][6] ), 
        .D(n373), .Y(n210) );
  NOR2X1 U321 ( .A(n212), .B(n213), .Y(n208) );
  OAI22X1 U322 ( .A(\regs_matrix[11][6] ), .B(n35), .C(\regs_matrix[9][6] ), 
        .D(n25), .Y(n213) );
  OAI22X1 U323 ( .A(\regs_matrix[13][6] ), .B(n381), .C(\regs_matrix[15][6] ), 
        .D(n28), .Y(n212) );
  NAND2X1 U324 ( .A(n214), .B(n215), .Y(n206) );
  NOR2X1 U325 ( .A(n216), .B(n217), .Y(n215) );
  OAI22X1 U326 ( .A(outreg_data[6]), .B(n53), .C(\regs_matrix[2][6] ), .D(n367), .Y(n217) );
  OAI22X1 U327 ( .A(\regs_matrix[4][6] ), .B(n369), .C(\regs_matrix[6][6] ), 
        .D(n373), .Y(n216) );
  NOR2X1 U328 ( .A(n218), .B(n219), .Y(n214) );
  OAI22X1 U329 ( .A(\regs_matrix[3][6] ), .B(n37), .C(\regs_matrix[1][6] ), 
        .D(n68), .Y(n219) );
  OAI22X1 U330 ( .A(\regs_matrix[5][6] ), .B(n30), .C(\regs_matrix[7][6] ), 
        .D(n106), .Y(n218) );
  MUX2X1 U331 ( .B(n220), .A(n221), .S(n385), .Y(r1_data[7]) );
  NAND2X1 U332 ( .A(n222), .B(n223), .Y(n221) );
  NOR2X1 U333 ( .A(n224), .B(n225), .Y(n223) );
  OAI22X1 U334 ( .A(\regs_matrix[8][7] ), .B(n54), .C(\regs_matrix[10][7] ), 
        .D(n367), .Y(n225) );
  OAI22X1 U335 ( .A(\regs_matrix[12][7] ), .B(n371), .C(\regs_matrix[14][7] ), 
        .D(n373), .Y(n224) );
  NOR2X1 U336 ( .A(n226), .B(n227), .Y(n222) );
  OAI22X1 U337 ( .A(\regs_matrix[11][7] ), .B(n39), .C(\regs_matrix[9][7] ), 
        .D(n25), .Y(n227) );
  OAI22X1 U338 ( .A(\regs_matrix[13][7] ), .B(n30), .C(\regs_matrix[15][7] ), 
        .D(n28), .Y(n226) );
  NAND2X1 U339 ( .A(n228), .B(n229), .Y(n220) );
  NOR2X1 U340 ( .A(n230), .B(n231), .Y(n229) );
  OAI22X1 U341 ( .A(outreg_data[7]), .B(n56), .C(\regs_matrix[2][7] ), .D(n367), .Y(n231) );
  OAI22X1 U342 ( .A(\regs_matrix[4][7] ), .B(n98), .C(\regs_matrix[6][7] ), 
        .D(n373), .Y(n230) );
  NOR2X1 U343 ( .A(n232), .B(n233), .Y(n228) );
  OAI22X1 U344 ( .A(\regs_matrix[3][7] ), .B(n38), .C(\regs_matrix[1][7] ), 
        .D(n377), .Y(n233) );
  OAI22X1 U345 ( .A(\regs_matrix[5][7] ), .B(n103), .C(\regs_matrix[7][7] ), 
        .D(n383), .Y(n232) );
  MUX2X1 U346 ( .B(n234), .A(n235), .S(n384), .Y(r1_data[8]) );
  NAND2X1 U347 ( .A(n236), .B(n237), .Y(n235) );
  NOR2X1 U348 ( .A(n238), .B(n239), .Y(n237) );
  OAI22X1 U349 ( .A(\regs_matrix[8][8] ), .B(n59), .C(\regs_matrix[10][8] ), 
        .D(n367), .Y(n239) );
  OAI22X1 U350 ( .A(\regs_matrix[12][8] ), .B(n98), .C(\regs_matrix[14][8] ), 
        .D(n373), .Y(n238) );
  NOR2X1 U351 ( .A(n240), .B(n241), .Y(n236) );
  OAI22X1 U352 ( .A(\regs_matrix[11][8] ), .B(n34), .C(\regs_matrix[9][8] ), 
        .D(n68), .Y(n241) );
  OAI22X1 U353 ( .A(\regs_matrix[13][8] ), .B(n30), .C(\regs_matrix[15][8] ), 
        .D(n106), .Y(n240) );
  NAND2X1 U354 ( .A(n242), .B(n243), .Y(n234) );
  NOR2X1 U355 ( .A(n244), .B(n245), .Y(n243) );
  OAI22X1 U356 ( .A(outreg_data[8]), .B(n47), .C(\regs_matrix[2][8] ), .D(n367), .Y(n245) );
  OAI22X1 U357 ( .A(\regs_matrix[4][8] ), .B(n370), .C(\regs_matrix[6][8] ), 
        .D(n373), .Y(n244) );
  NOR2X1 U358 ( .A(n246), .B(n247), .Y(n242) );
  OAI22X1 U359 ( .A(\regs_matrix[3][8] ), .B(n33), .C(\regs_matrix[1][8] ), 
        .D(n377), .Y(n247) );
  OAI22X1 U360 ( .A(\regs_matrix[5][8] ), .B(n101), .C(\regs_matrix[7][8] ), 
        .D(n28), .Y(n246) );
  MUX2X1 U361 ( .B(n248), .A(n249), .S(n385), .Y(r1_data[9]) );
  NAND2X1 U362 ( .A(n250), .B(n251), .Y(n249) );
  NOR2X1 U363 ( .A(n252), .B(n253), .Y(n251) );
  OAI22X1 U364 ( .A(\regs_matrix[8][9] ), .B(n58), .C(\regs_matrix[10][9] ), 
        .D(n367), .Y(n253) );
  OAI22X1 U365 ( .A(\regs_matrix[12][9] ), .B(n370), .C(\regs_matrix[14][9] ), 
        .D(n373), .Y(n252) );
  NOR2X1 U366 ( .A(n254), .B(n255), .Y(n250) );
  OAI22X1 U367 ( .A(\regs_matrix[11][9] ), .B(n44), .C(\regs_matrix[9][9] ), 
        .D(n22), .Y(n255) );
  OAI22X1 U368 ( .A(\regs_matrix[13][9] ), .B(n103), .C(\regs_matrix[15][9] ), 
        .D(n28), .Y(n254) );
  NAND2X1 U369 ( .A(n256), .B(n257), .Y(n248) );
  NOR2X1 U370 ( .A(n258), .B(n259), .Y(n257) );
  OAI22X1 U371 ( .A(outreg_data[9]), .B(n57), .C(\regs_matrix[2][9] ), .D(n367), .Y(n259) );
  OAI22X1 U372 ( .A(\regs_matrix[4][9] ), .B(n371), .C(\regs_matrix[6][9] ), 
        .D(n373), .Y(n258) );
  NOR2X1 U373 ( .A(n260), .B(n261), .Y(n256) );
  OAI22X1 U374 ( .A(\regs_matrix[3][9] ), .B(n42), .C(\regs_matrix[1][9] ), 
        .D(n68), .Y(n261) );
  OAI22X1 U375 ( .A(\regs_matrix[5][9] ), .B(n30), .C(\regs_matrix[7][9] ), 
        .D(n20), .Y(n260) );
  MUX2X1 U376 ( .B(n262), .A(n263), .S(n384), .Y(r1_data[10]) );
  NAND2X1 U377 ( .A(n264), .B(n265), .Y(n263) );
  NOR2X1 U378 ( .A(n266), .B(n267), .Y(n265) );
  OAI22X1 U379 ( .A(\regs_matrix[8][10] ), .B(n58), .C(\regs_matrix[10][10] ), 
        .D(n367), .Y(n267) );
  OAI22X1 U380 ( .A(\regs_matrix[12][10] ), .B(n97), .C(\regs_matrix[14][10] ), 
        .D(n373), .Y(n266) );
  NOR2X1 U381 ( .A(n268), .B(n269), .Y(n264) );
  OAI22X1 U382 ( .A(\regs_matrix[11][10] ), .B(n36), .C(\regs_matrix[9][10] ), 
        .D(n25), .Y(n269) );
  OAI22X1 U383 ( .A(\regs_matrix[13][10] ), .B(n381), .C(\regs_matrix[15][10] ), .D(n383), .Y(n268) );
  NAND2X1 U384 ( .A(n270), .B(n271), .Y(n262) );
  NOR2X1 U385 ( .A(n272), .B(n273), .Y(n271) );
  OAI22X1 U386 ( .A(outreg_data[10]), .B(n63), .C(\regs_matrix[2][10] ), .D(
        n367), .Y(n273) );
  OAI22X1 U387 ( .A(\regs_matrix[4][10] ), .B(n98), .C(\regs_matrix[6][10] ), 
        .D(n373), .Y(n272) );
  NOR2X1 U388 ( .A(n274), .B(n275), .Y(n270) );
  OAI22X1 U389 ( .A(\regs_matrix[3][10] ), .B(n32), .C(\regs_matrix[1][10] ), 
        .D(n69), .Y(n275) );
  OAI22X1 U390 ( .A(\regs_matrix[5][10] ), .B(n101), .C(\regs_matrix[7][10] ), 
        .D(n106), .Y(n274) );
  MUX2X1 U391 ( .B(n276), .A(n277), .S(n385), .Y(r1_data[11]) );
  NAND2X1 U392 ( .A(n278), .B(n279), .Y(n277) );
  NOR2X1 U393 ( .A(n280), .B(n281), .Y(n279) );
  OAI22X1 U394 ( .A(\regs_matrix[8][11] ), .B(n59), .C(\regs_matrix[10][11] ), 
        .D(n367), .Y(n281) );
  OAI22X1 U395 ( .A(\regs_matrix[12][11] ), .B(n97), .C(\regs_matrix[14][11] ), 
        .D(n373), .Y(n280) );
  NOR2X1 U396 ( .A(n282), .B(n283), .Y(n278) );
  OAI22X1 U397 ( .A(\regs_matrix[11][11] ), .B(n43), .C(\regs_matrix[9][11] ), 
        .D(n377), .Y(n283) );
  OAI22X1 U398 ( .A(\regs_matrix[13][11] ), .B(n103), .C(\regs_matrix[15][11] ), .D(n20), .Y(n282) );
  NAND2X1 U399 ( .A(n284), .B(n285), .Y(n276) );
  NOR2X1 U400 ( .A(n286), .B(n287), .Y(n285) );
  OAI22X1 U401 ( .A(outreg_data[11]), .B(n56), .C(\regs_matrix[2][11] ), .D(
        n367), .Y(n287) );
  OAI22X1 U402 ( .A(\regs_matrix[4][11] ), .B(n98), .C(\regs_matrix[6][11] ), 
        .D(n373), .Y(n286) );
  NOR2X1 U403 ( .A(n288), .B(n289), .Y(n284) );
  OAI22X1 U404 ( .A(\regs_matrix[3][11] ), .B(n41), .C(\regs_matrix[1][11] ), 
        .D(n22), .Y(n289) );
  OAI22X1 U405 ( .A(\regs_matrix[5][11] ), .B(n100), .C(\regs_matrix[7][11] ), 
        .D(n28), .Y(n288) );
  MUX2X1 U406 ( .B(n290), .A(n291), .S(n384), .Y(r1_data[12]) );
  NAND2X1 U407 ( .A(n293), .B(n292), .Y(n291) );
  NOR2X1 U408 ( .A(n294), .B(n295), .Y(n293) );
  OAI22X1 U409 ( .A(\regs_matrix[8][12] ), .B(n62), .C(\regs_matrix[10][12] ), 
        .D(n367), .Y(n295) );
  OAI22X1 U410 ( .A(\regs_matrix[12][12] ), .B(n97), .C(\regs_matrix[14][12] ), 
        .D(n373), .Y(n294) );
  NOR2X1 U411 ( .A(n296), .B(n297), .Y(n292) );
  OAI22X1 U412 ( .A(\regs_matrix[11][12] ), .B(n35), .C(\regs_matrix[9][12] ), 
        .D(n68), .Y(n297) );
  OAI22X1 U413 ( .A(\regs_matrix[13][12] ), .B(n101), .C(\regs_matrix[15][12] ), .D(n27), .Y(n296) );
  NAND2X1 U414 ( .A(n298), .B(n299), .Y(n290) );
  NOR2X1 U415 ( .A(n300), .B(n301), .Y(n299) );
  OAI22X1 U416 ( .A(outreg_data[12]), .B(n60), .C(\regs_matrix[2][12] ), .D(
        n367), .Y(n301) );
  OAI22X1 U417 ( .A(\regs_matrix[4][12] ), .B(n370), .C(\regs_matrix[6][12] ), 
        .D(n373), .Y(n300) );
  NOR2X1 U418 ( .A(n302), .B(n303), .Y(n298) );
  OAI22X1 U419 ( .A(\regs_matrix[3][12] ), .B(n32), .C(\regs_matrix[1][12] ), 
        .D(n69), .Y(n303) );
  OAI22X1 U420 ( .A(\regs_matrix[5][12] ), .B(n30), .C(\regs_matrix[7][12] ), 
        .D(n383), .Y(n302) );
  MUX2X1 U421 ( .B(n304), .A(n305), .S(n385), .Y(r1_data[13]) );
  NAND2X1 U422 ( .A(n306), .B(n307), .Y(n305) );
  NOR2X1 U423 ( .A(n308), .B(n309), .Y(n307) );
  OAI22X1 U424 ( .A(\regs_matrix[8][13] ), .B(n55), .C(\regs_matrix[10][13] ), 
        .D(n367), .Y(n309) );
  OAI22X1 U425 ( .A(\regs_matrix[12][13] ), .B(n98), .C(\regs_matrix[14][13] ), 
        .D(n373), .Y(n308) );
  NOR2X1 U426 ( .A(n310), .B(n311), .Y(n306) );
  OAI22X1 U427 ( .A(\regs_matrix[11][13] ), .B(n41), .C(\regs_matrix[9][13] ), 
        .D(n24), .Y(n311) );
  OAI22X1 U428 ( .A(\regs_matrix[13][13] ), .B(n30), .C(\regs_matrix[15][13] ), 
        .D(n383), .Y(n310) );
  NAND2X1 U429 ( .A(n312), .B(n313), .Y(n304) );
  NOR2X1 U430 ( .A(n314), .B(n315), .Y(n313) );
  OAI22X1 U431 ( .A(outreg_data[13]), .B(n54), .C(\regs_matrix[2][13] ), .D(
        n367), .Y(n315) );
  OAI22X1 U432 ( .A(\regs_matrix[4][13] ), .B(n370), .C(\regs_matrix[6][13] ), 
        .D(n373), .Y(n314) );
  NOR2X1 U433 ( .A(n316), .B(n317), .Y(n312) );
  OAI22X1 U434 ( .A(\regs_matrix[3][13] ), .B(n37), .C(\regs_matrix[1][13] ), 
        .D(n69), .Y(n317) );
  OAI22X1 U435 ( .A(\regs_matrix[5][13] ), .B(n30), .C(\regs_matrix[7][13] ), 
        .D(n28), .Y(n316) );
  MUX2X1 U436 ( .B(n318), .A(n319), .S(n384), .Y(n735) );
  NAND2X1 U437 ( .A(n320), .B(n321), .Y(n319) );
  NOR2X1 U438 ( .A(n323), .B(n322), .Y(n321) );
  OAI22X1 U439 ( .A(\regs_matrix[8][14] ), .B(n46), .C(\regs_matrix[10][14] ), 
        .D(n367), .Y(n323) );
  OAI22X1 U440 ( .A(\regs_matrix[12][14] ), .B(n370), .C(\regs_matrix[14][14] ), .D(n373), .Y(n322) );
  NOR2X1 U441 ( .A(n324), .B(n325), .Y(n320) );
  OAI22X1 U442 ( .A(\regs_matrix[11][14] ), .B(n40), .C(\regs_matrix[9][14] ), 
        .D(n22), .Y(n325) );
  OAI22X1 U443 ( .A(\regs_matrix[13][14] ), .B(n100), .C(\regs_matrix[15][14] ), .D(n20), .Y(n324) );
  NAND2X1 U444 ( .A(n327), .B(n326), .Y(n318) );
  NOR2X1 U445 ( .A(n328), .B(n329), .Y(n327) );
  OAI22X1 U446 ( .A(outreg_data[14]), .B(n52), .C(\regs_matrix[2][14] ), .D(
        n367), .Y(n329) );
  OAI22X1 U447 ( .A(\regs_matrix[4][14] ), .B(n371), .C(\regs_matrix[6][14] ), 
        .D(n373), .Y(n328) );
  NOR2X1 U448 ( .A(n330), .B(n331), .Y(n326) );
  OAI22X1 U449 ( .A(\regs_matrix[3][14] ), .B(n38), .C(\regs_matrix[1][14] ), 
        .D(n22), .Y(n331) );
  OAI22X1 U450 ( .A(\regs_matrix[5][14] ), .B(n381), .C(\regs_matrix[7][14] ), 
        .D(n106), .Y(n330) );
  MUX2X1 U451 ( .B(n332), .A(n333), .S(n385), .Y(r1_data[15]) );
  NAND2X1 U452 ( .A(n334), .B(n335), .Y(n333) );
  NOR2X1 U453 ( .A(n336), .B(n337), .Y(n335) );
  OAI22X1 U454 ( .A(\regs_matrix[8][15] ), .B(n50), .C(\regs_matrix[10][15] ), 
        .D(n367), .Y(n337) );
  OAI22X1 U455 ( .A(\regs_matrix[12][15] ), .B(n97), .C(\regs_matrix[14][15] ), 
        .D(n373), .Y(n336) );
  NOR2X1 U456 ( .A(n338), .B(n339), .Y(n334) );
  OAI22X1 U457 ( .A(\regs_matrix[11][15] ), .B(n31), .C(\regs_matrix[9][15] ), 
        .D(n377), .Y(n339) );
  OAI22X1 U458 ( .A(\regs_matrix[13][15] ), .B(n100), .C(\regs_matrix[15][15] ), .D(n20), .Y(n338) );
  NAND2X1 U459 ( .A(n341), .B(n340), .Y(n332) );
  NOR2X1 U460 ( .A(n342), .B(n343), .Y(n341) );
  OAI22X1 U461 ( .A(outreg_data[15]), .B(n52), .C(\regs_matrix[2][15] ), .D(
        n367), .Y(n343) );
  OAI22X1 U462 ( .A(\regs_matrix[4][15] ), .B(n371), .C(\regs_matrix[6][15] ), 
        .D(n373), .Y(n342) );
  NOR2X1 U463 ( .A(n344), .B(n345), .Y(n340) );
  OAI22X1 U464 ( .A(\regs_matrix[3][15] ), .B(n33), .C(\regs_matrix[1][15] ), 
        .D(n22), .Y(n345) );
  OAI22X1 U465 ( .A(\regs_matrix[5][15] ), .B(n30), .C(\regs_matrix[7][15] ), 
        .D(n27), .Y(n344) );
  NOR2X1 U466 ( .A(n346), .B(n347), .Y(n111) );
  OAI21X1 U467 ( .A(\regs_matrix[6][16] ), .B(n373), .C(n348), .Y(n347) );
  AOI22X1 U468 ( .A(n364), .B(n349), .C(n64), .D(n350), .Y(n348) );
  INVX2 U469 ( .A(outreg_data[16]), .Y(n350) );
  INVX2 U470 ( .A(\regs_matrix[2][16] ), .Y(n349) );
  OAI21X1 U471 ( .A(\regs_matrix[4][16] ), .B(n98), .C(n386), .Y(n346) );
  NOR2X1 U472 ( .A(n351), .B(n352), .Y(n112) );
  OAI22X1 U473 ( .A(\regs_matrix[3][16] ), .B(n35), .C(\regs_matrix[1][16] ), 
        .D(n22), .Y(n352) );
  OAI22X1 U474 ( .A(\regs_matrix[5][16] ), .B(n101), .C(\regs_matrix[7][16] ), 
        .D(n27), .Y(n351) );
  NOR2X1 U475 ( .A(n353), .B(n354), .Y(n113) );
  OAI21X1 U476 ( .A(\regs_matrix[12][16] ), .B(n370), .C(n355), .Y(n354) );
  AOI22X1 U477 ( .A(n364), .B(n356), .C(n65), .D(n632), .Y(n355) );
  NAND3X1 U478 ( .A(n357), .B(n86), .C(n358), .Y(n122) );
  INVX2 U479 ( .A(\regs_matrix[10][16] ), .Y(n356) );
  NAND3X1 U480 ( .A(n90), .B(n85), .C(n358), .Y(n123) );
  NAND3X1 U481 ( .A(n72), .B(n357), .C(n358), .Y(n124) );
  OAI22X1 U482 ( .A(\regs_matrix[9][16] ), .B(n25), .C(\regs_matrix[14][16] ), 
        .D(n373), .Y(n353) );
  NAND3X1 U483 ( .A(n72), .B(n90), .C(n358), .Y(n125) );
  NAND3X1 U484 ( .A(n88), .B(n85), .C(n357), .Y(n128) );
  NOR2X1 U485 ( .A(n359), .B(n360), .Y(n114) );
  OAI21X1 U486 ( .A(\regs_matrix[11][16] ), .B(n36), .C(n384), .Y(n360) );
  OAI22X1 U487 ( .A(\regs_matrix[15][16] ), .B(n383), .C(\regs_matrix[13][16] ), .D(n103), .Y(n359) );
  NAND3X1 U488 ( .A(n72), .B(n88), .C(n357), .Y(n129) );
  INVX8 U489 ( .A(n365), .Y(n367) );
  INVX2 U490 ( .A(N11), .Y(n357) );
  AOI22X1 U491 ( .A(n390), .B(n389), .C(n388), .D(n387), .Y(n391) );
  INVX2 U492 ( .A(n391), .Y(r2_data[16]) );
  MUX2X1 U493 ( .B(n392), .A(n393), .S(n667), .Y(r2_data[0]) );
  NAND2X1 U494 ( .A(n394), .B(n395), .Y(n393) );
  NOR2X1 U495 ( .A(n396), .B(n397), .Y(n395) );
  OAI22X1 U496 ( .A(\regs_matrix[8][0] ), .B(n84), .C(\regs_matrix[10][0] ), 
        .D(n645), .Y(n397) );
  OAI22X1 U497 ( .A(\regs_matrix[12][0] ), .B(n648), .C(\regs_matrix[14][0] ), 
        .D(n651), .Y(n396) );
  NOR2X1 U498 ( .A(n400), .B(n401), .Y(n394) );
  OAI22X1 U499 ( .A(\regs_matrix[11][0] ), .B(n654), .C(\regs_matrix[9][0] ), 
        .D(n677), .Y(n401) );
  OAI22X1 U500 ( .A(\regs_matrix[13][0] ), .B(n658), .C(\regs_matrix[15][0] ), 
        .D(n83), .Y(n400) );
  NAND2X1 U501 ( .A(n405), .B(n406), .Y(n392) );
  NOR2X1 U502 ( .A(n408), .B(n407), .Y(n406) );
  OAI22X1 U503 ( .A(outreg_data[0]), .B(n84), .C(\regs_matrix[2][0] ), .D(n645), .Y(n408) );
  OAI22X1 U504 ( .A(\regs_matrix[4][0] ), .B(n648), .C(\regs_matrix[6][0] ), 
        .D(n1), .Y(n407) );
  NOR2X1 U505 ( .A(n409), .B(n410), .Y(n405) );
  OAI22X1 U506 ( .A(\regs_matrix[3][0] ), .B(n654), .C(\regs_matrix[1][0] ), 
        .D(n677), .Y(n410) );
  OAI22X1 U507 ( .A(\regs_matrix[5][0] ), .B(n658), .C(\regs_matrix[7][0] ), 
        .D(n664), .Y(n409) );
  MUX2X1 U508 ( .B(n411), .A(n412), .S(n666), .Y(r2_data[1]) );
  NAND2X1 U509 ( .A(n413), .B(n414), .Y(n412) );
  NOR2X1 U510 ( .A(n415), .B(n416), .Y(n414) );
  OAI22X1 U511 ( .A(\regs_matrix[8][1] ), .B(n84), .C(\regs_matrix[10][1] ), 
        .D(n645), .Y(n416) );
  OAI22X1 U512 ( .A(\regs_matrix[12][1] ), .B(n648), .C(\regs_matrix[14][1] ), 
        .D(n651), .Y(n415) );
  NOR2X1 U513 ( .A(n417), .B(n418), .Y(n413) );
  OAI22X1 U514 ( .A(\regs_matrix[11][1] ), .B(n653), .C(\regs_matrix[9][1] ), 
        .D(n670), .Y(n418) );
  OAI22X1 U515 ( .A(\regs_matrix[13][1] ), .B(n658), .C(\regs_matrix[15][1] ), 
        .D(n665), .Y(n417) );
  NAND2X1 U516 ( .A(n419), .B(n420), .Y(n411) );
  NOR2X1 U517 ( .A(n421), .B(n422), .Y(n420) );
  OAI22X1 U518 ( .A(outreg_data[1]), .B(n641), .C(\regs_matrix[2][1] ), .D(
        n645), .Y(n422) );
  OAI22X1 U519 ( .A(\regs_matrix[4][1] ), .B(n648), .C(\regs_matrix[6][1] ), 
        .D(n651), .Y(n421) );
  NOR2X1 U520 ( .A(n423), .B(n424), .Y(n419) );
  OAI22X1 U521 ( .A(\regs_matrix[3][1] ), .B(n654), .C(\regs_matrix[1][1] ), 
        .D(n670), .Y(n424) );
  OAI22X1 U522 ( .A(\regs_matrix[5][1] ), .B(n658), .C(\regs_matrix[7][1] ), 
        .D(n665), .Y(n423) );
  MUX2X1 U523 ( .B(n425), .A(n426), .S(n667), .Y(r2_data[2]) );
  NAND2X1 U524 ( .A(n427), .B(n428), .Y(n426) );
  NOR2X1 U525 ( .A(n429), .B(n430), .Y(n428) );
  OAI22X1 U526 ( .A(\regs_matrix[8][2] ), .B(n84), .C(\regs_matrix[10][2] ), 
        .D(n645), .Y(n430) );
  OAI22X1 U527 ( .A(\regs_matrix[12][2] ), .B(n648), .C(\regs_matrix[14][2] ), 
        .D(n651), .Y(n429) );
  NOR2X1 U528 ( .A(n431), .B(n432), .Y(n427) );
  OAI22X1 U529 ( .A(\regs_matrix[11][2] ), .B(n653), .C(\regs_matrix[9][2] ), 
        .D(n4), .Y(n432) );
  OAI22X1 U530 ( .A(\regs_matrix[13][2] ), .B(n659), .C(\regs_matrix[15][2] ), 
        .D(n665), .Y(n431) );
  NAND2X1 U531 ( .A(n433), .B(n434), .Y(n425) );
  NOR2X1 U532 ( .A(n435), .B(n436), .Y(n434) );
  OAI22X1 U533 ( .A(outreg_data[2]), .B(n84), .C(\regs_matrix[2][2] ), .D(n645), .Y(n436) );
  OAI22X1 U534 ( .A(\regs_matrix[4][2] ), .B(n675), .C(\regs_matrix[6][2] ), 
        .D(n651), .Y(n435) );
  NOR2X1 U535 ( .A(n437), .B(n438), .Y(n433) );
  OAI22X1 U536 ( .A(\regs_matrix[3][2] ), .B(n653), .C(\regs_matrix[1][2] ), 
        .D(n4), .Y(n438) );
  OAI22X1 U537 ( .A(\regs_matrix[5][2] ), .B(n659), .C(\regs_matrix[7][2] ), 
        .D(n665), .Y(n437) );
  MUX2X1 U538 ( .B(n439), .A(n440), .S(n666), .Y(r2_data[3]) );
  NAND2X1 U539 ( .A(n442), .B(n441), .Y(n440) );
  NOR2X1 U540 ( .A(n443), .B(n444), .Y(n442) );
  OAI22X1 U541 ( .A(\regs_matrix[8][3] ), .B(n84), .C(\regs_matrix[10][3] ), 
        .D(n645), .Y(n444) );
  OAI22X1 U542 ( .A(\regs_matrix[12][3] ), .B(n649), .C(\regs_matrix[14][3] ), 
        .D(n1), .Y(n443) );
  NOR2X1 U543 ( .A(n445), .B(n446), .Y(n441) );
  OAI22X1 U544 ( .A(\regs_matrix[11][3] ), .B(n653), .C(\regs_matrix[9][3] ), 
        .D(n670), .Y(n446) );
  OAI22X1 U545 ( .A(\regs_matrix[13][3] ), .B(n659), .C(\regs_matrix[15][3] ), 
        .D(n665), .Y(n445) );
  NAND2X1 U546 ( .A(n447), .B(n448), .Y(n439) );
  NOR2X1 U547 ( .A(n449), .B(n450), .Y(n448) );
  OAI22X1 U548 ( .A(outreg_data[3]), .B(n84), .C(\regs_matrix[2][3] ), .D(n645), .Y(n450) );
  OAI22X1 U549 ( .A(\regs_matrix[4][3] ), .B(n649), .C(\regs_matrix[6][3] ), 
        .D(n651), .Y(n449) );
  NOR2X1 U550 ( .A(n451), .B(n452), .Y(n447) );
  OAI22X1 U551 ( .A(\regs_matrix[3][3] ), .B(n653), .C(\regs_matrix[1][3] ), 
        .D(n4), .Y(n452) );
  OAI22X1 U552 ( .A(\regs_matrix[5][3] ), .B(n658), .C(\regs_matrix[7][3] ), 
        .D(n664), .Y(n451) );
  NAND2X1 U553 ( .A(n455), .B(n456), .Y(n454) );
  NOR2X1 U554 ( .A(n457), .B(n458), .Y(n456) );
  OAI22X1 U555 ( .A(\regs_matrix[8][4] ), .B(n641), .C(\regs_matrix[10][4] ), 
        .D(n646), .Y(n458) );
  OAI22X1 U556 ( .A(\regs_matrix[12][4] ), .B(n648), .C(\regs_matrix[14][4] ), 
        .D(n651), .Y(n457) );
  NOR2X1 U557 ( .A(n459), .B(n460), .Y(n455) );
  OAI22X1 U558 ( .A(\regs_matrix[11][4] ), .B(n653), .C(\regs_matrix[9][4] ), 
        .D(n656), .Y(n460) );
  OAI22X1 U559 ( .A(\regs_matrix[13][4] ), .B(n658), .C(\regs_matrix[15][4] ), 
        .D(n665), .Y(n459) );
  NAND2X1 U560 ( .A(n461), .B(n462), .Y(n453) );
  NOR2X1 U561 ( .A(n463), .B(n464), .Y(n462) );
  OAI22X1 U562 ( .A(outreg_data[4]), .B(n640), .C(\regs_matrix[2][4] ), .D(
        n646), .Y(n464) );
  OAI22X1 U563 ( .A(\regs_matrix[4][4] ), .B(n648), .C(\regs_matrix[6][4] ), 
        .D(n1), .Y(n463) );
  NOR2X1 U564 ( .A(n465), .B(n466), .Y(n461) );
  OAI22X1 U565 ( .A(\regs_matrix[3][4] ), .B(n653), .C(\regs_matrix[1][4] ), 
        .D(n4), .Y(n466) );
  OAI22X1 U566 ( .A(\regs_matrix[5][4] ), .B(n659), .C(\regs_matrix[7][4] ), 
        .D(n665), .Y(n465) );
  NAND2X1 U567 ( .A(n469), .B(n470), .Y(n468) );
  NOR2X1 U568 ( .A(n471), .B(n472), .Y(n470) );
  OAI22X1 U569 ( .A(\regs_matrix[8][5] ), .B(n640), .C(\regs_matrix[10][5] ), 
        .D(n646), .Y(n472) );
  OAI22X1 U570 ( .A(\regs_matrix[12][5] ), .B(n648), .C(\regs_matrix[14][5] ), 
        .D(n650), .Y(n471) );
  NOR2X1 U571 ( .A(n473), .B(n474), .Y(n469) );
  OAI22X1 U572 ( .A(\regs_matrix[11][5] ), .B(n654), .C(\regs_matrix[9][5] ), 
        .D(n656), .Y(n474) );
  OAI22X1 U573 ( .A(\regs_matrix[13][5] ), .B(n659), .C(\regs_matrix[15][5] ), 
        .D(n665), .Y(n473) );
  NAND2X1 U574 ( .A(n475), .B(n476), .Y(n467) );
  NOR2X1 U575 ( .A(n477), .B(n478), .Y(n476) );
  OAI22X1 U576 ( .A(outreg_data[5]), .B(n640), .C(\regs_matrix[2][5] ), .D(
        n646), .Y(n478) );
  OAI22X1 U577 ( .A(\regs_matrix[4][5] ), .B(n648), .C(\regs_matrix[6][5] ), 
        .D(n1), .Y(n477) );
  NOR2X1 U578 ( .A(n479), .B(n480), .Y(n475) );
  OAI22X1 U579 ( .A(\regs_matrix[3][5] ), .B(n654), .C(\regs_matrix[1][5] ), 
        .D(n4), .Y(n480) );
  OAI22X1 U580 ( .A(\regs_matrix[5][5] ), .B(n659), .C(\regs_matrix[7][5] ), 
        .D(n665), .Y(n479) );
  MUX2X1 U581 ( .B(n481), .A(n482), .S(n667), .Y(r2_data[6]) );
  NAND2X1 U582 ( .A(n483), .B(n484), .Y(n482) );
  NOR2X1 U583 ( .A(n485), .B(n486), .Y(n484) );
  OAI22X1 U584 ( .A(\regs_matrix[8][6] ), .B(n640), .C(\regs_matrix[10][6] ), 
        .D(n646), .Y(n486) );
  OAI22X1 U585 ( .A(\regs_matrix[12][6] ), .B(n648), .C(\regs_matrix[14][6] ), 
        .D(n650), .Y(n485) );
  NOR2X1 U586 ( .A(n487), .B(n488), .Y(n483) );
  OAI22X1 U587 ( .A(\regs_matrix[11][6] ), .B(n653), .C(\regs_matrix[9][6] ), 
        .D(n4), .Y(n488) );
  OAI22X1 U588 ( .A(\regs_matrix[13][6] ), .B(n658), .C(\regs_matrix[15][6] ), 
        .D(n663), .Y(n487) );
  NAND2X1 U589 ( .A(n489), .B(n490), .Y(n481) );
  NOR2X1 U590 ( .A(n491), .B(n492), .Y(n490) );
  OAI22X1 U591 ( .A(outreg_data[6]), .B(n640), .C(\regs_matrix[2][6] ), .D(
        n646), .Y(n492) );
  OAI22X1 U592 ( .A(\regs_matrix[4][6] ), .B(n648), .C(\regs_matrix[6][6] ), 
        .D(n1), .Y(n491) );
  NOR2X1 U593 ( .A(n493), .B(n494), .Y(n489) );
  OAI22X1 U594 ( .A(\regs_matrix[3][6] ), .B(n653), .C(\regs_matrix[1][6] ), 
        .D(n670), .Y(n494) );
  OAI22X1 U595 ( .A(\regs_matrix[5][6] ), .B(n659), .C(\regs_matrix[7][6] ), 
        .D(n71), .Y(n493) );
  AOI22X1 U596 ( .A(n496), .B(n497), .C(n498), .D(n499), .Y(n495) );
  NOR2X1 U597 ( .A(n500), .B(n501), .Y(n499) );
  OAI22X1 U598 ( .A(\regs_matrix[8][7] ), .B(n641), .C(\regs_matrix[13][7] ), 
        .D(n659), .Y(n501) );
  OAI22X1 U599 ( .A(\regs_matrix[12][7] ), .B(n648), .C(\regs_matrix[11][7] ), 
        .D(n653), .Y(n500) );
  NOR2X1 U600 ( .A(n502), .B(n503), .Y(n498) );
  OAI21X1 U601 ( .A(\regs_matrix[9][7] ), .B(n656), .C(n504), .Y(n503) );
  AOI21X1 U602 ( .A(n662), .B(n505), .C(n668), .Y(n504) );
  INVX2 U603 ( .A(\regs_matrix[15][7] ), .Y(n505) );
  OAI22X1 U604 ( .A(\regs_matrix[14][7] ), .B(n651), .C(\regs_matrix[10][7] ), 
        .D(n646), .Y(n502) );
  NOR2X1 U605 ( .A(n506), .B(n507), .Y(n497) );
  OAI22X1 U606 ( .A(outreg_data[7]), .B(n81), .C(\regs_matrix[5][7] ), .D(n658), .Y(n507) );
  OAI22X1 U607 ( .A(\regs_matrix[4][7] ), .B(n648), .C(\regs_matrix[3][7] ), 
        .D(n653), .Y(n506) );
  NOR2X1 U608 ( .A(n508), .B(n509), .Y(n496) );
  OAI21X1 U609 ( .A(\regs_matrix[1][7] ), .B(n670), .C(n510), .Y(n509) );
  AOI21X1 U610 ( .A(n662), .B(n511), .C(n667), .Y(n510) );
  INVX2 U611 ( .A(\regs_matrix[7][7] ), .Y(n511) );
  OAI22X1 U612 ( .A(\regs_matrix[6][7] ), .B(n651), .C(\regs_matrix[2][7] ), 
        .D(n646), .Y(n508) );
  NAND2X1 U613 ( .A(n514), .B(n515), .Y(n513) );
  NOR2X1 U614 ( .A(n516), .B(n517), .Y(n515) );
  OAI22X1 U615 ( .A(\regs_matrix[8][8] ), .B(n640), .C(\regs_matrix[10][8] ), 
        .D(n646), .Y(n517) );
  OAI22X1 U616 ( .A(\regs_matrix[12][8] ), .B(n648), .C(\regs_matrix[14][8] ), 
        .D(n651), .Y(n516) );
  NOR2X1 U617 ( .A(n518), .B(n519), .Y(n514) );
  OAI22X1 U618 ( .A(\regs_matrix[11][8] ), .B(n653), .C(\regs_matrix[9][8] ), 
        .D(n4), .Y(n519) );
  OAI22X1 U619 ( .A(\regs_matrix[13][8] ), .B(n658), .C(\regs_matrix[15][8] ), 
        .D(n664), .Y(n518) );
  NAND2X1 U620 ( .A(n520), .B(n521), .Y(n512) );
  NOR2X1 U621 ( .A(n522), .B(n523), .Y(n521) );
  OAI22X1 U622 ( .A(outreg_data[8]), .B(n640), .C(\regs_matrix[2][8] ), .D(
        n646), .Y(n523) );
  OAI22X1 U623 ( .A(\regs_matrix[4][8] ), .B(n648), .C(\regs_matrix[6][8] ), 
        .D(n650), .Y(n522) );
  NOR2X1 U624 ( .A(n524), .B(n525), .Y(n520) );
  OAI22X1 U625 ( .A(\regs_matrix[3][8] ), .B(n653), .C(\regs_matrix[1][8] ), 
        .D(n4), .Y(n525) );
  OAI22X1 U626 ( .A(\regs_matrix[5][8] ), .B(n659), .C(\regs_matrix[7][8] ), 
        .D(n664), .Y(n524) );
  NAND2X1 U627 ( .A(n528), .B(n529), .Y(n527) );
  NOR2X1 U628 ( .A(n530), .B(n531), .Y(n529) );
  OAI22X1 U629 ( .A(\regs_matrix[8][9] ), .B(n640), .C(\regs_matrix[10][9] ), 
        .D(n646), .Y(n531) );
  OAI22X1 U630 ( .A(\regs_matrix[12][9] ), .B(n648), .C(\regs_matrix[14][9] ), 
        .D(n650), .Y(n530) );
  NOR2X1 U631 ( .A(n532), .B(n533), .Y(n528) );
  OAI22X1 U632 ( .A(\regs_matrix[11][9] ), .B(n654), .C(\regs_matrix[9][9] ), 
        .D(n656), .Y(n533) );
  OAI22X1 U633 ( .A(\regs_matrix[13][9] ), .B(n659), .C(\regs_matrix[15][9] ), 
        .D(n664), .Y(n532) );
  NAND2X1 U634 ( .A(n534), .B(n535), .Y(n526) );
  NOR2X1 U635 ( .A(n536), .B(n537), .Y(n535) );
  OAI22X1 U636 ( .A(outreg_data[9]), .B(n640), .C(\regs_matrix[2][9] ), .D(
        n646), .Y(n537) );
  OAI22X1 U637 ( .A(\regs_matrix[4][9] ), .B(n648), .C(\regs_matrix[6][9] ), 
        .D(n650), .Y(n536) );
  NOR2X1 U638 ( .A(n538), .B(n539), .Y(n534) );
  OAI22X1 U639 ( .A(\regs_matrix[3][9] ), .B(n653), .C(\regs_matrix[1][9] ), 
        .D(n670), .Y(n539) );
  OAI22X1 U640 ( .A(\regs_matrix[5][9] ), .B(n659), .C(\regs_matrix[7][9] ), 
        .D(n664), .Y(n538) );
  NAND2X1 U641 ( .A(n542), .B(n543), .Y(n541) );
  NOR2X1 U642 ( .A(n544), .B(n545), .Y(n543) );
  OAI22X1 U643 ( .A(\regs_matrix[8][10] ), .B(n673), .C(\regs_matrix[10][10] ), 
        .D(n646), .Y(n545) );
  OAI22X1 U644 ( .A(\regs_matrix[12][10] ), .B(n648), .C(\regs_matrix[14][10] ), .D(n650), .Y(n544) );
  NOR2X1 U645 ( .A(n546), .B(n547), .Y(n542) );
  OAI22X1 U646 ( .A(\regs_matrix[11][10] ), .B(n654), .C(\regs_matrix[9][10] ), 
        .D(n4), .Y(n547) );
  OAI22X1 U647 ( .A(\regs_matrix[13][10] ), .B(n659), .C(\regs_matrix[15][10] ), .D(n664), .Y(n546) );
  NAND2X1 U648 ( .A(n548), .B(n549), .Y(n540) );
  NOR2X1 U649 ( .A(n550), .B(n551), .Y(n549) );
  OAI22X1 U650 ( .A(outreg_data[10]), .B(n673), .C(\regs_matrix[2][10] ), .D(
        n669), .Y(n551) );
  OAI22X1 U651 ( .A(\regs_matrix[4][10] ), .B(n648), .C(\regs_matrix[6][10] ), 
        .D(n651), .Y(n550) );
  NOR2X1 U652 ( .A(n552), .B(n553), .Y(n548) );
  OAI22X1 U653 ( .A(\regs_matrix[3][10] ), .B(n654), .C(\regs_matrix[1][10] ), 
        .D(n670), .Y(n553) );
  OAI22X1 U654 ( .A(\regs_matrix[5][10] ), .B(n659), .C(\regs_matrix[7][10] ), 
        .D(n664), .Y(n552) );
  MUX2X1 U655 ( .B(n554), .A(n555), .S(n667), .Y(r2_data[11]) );
  NAND2X1 U656 ( .A(n556), .B(n557), .Y(n555) );
  NOR2X1 U657 ( .A(n558), .B(n559), .Y(n557) );
  OAI22X1 U658 ( .A(\regs_matrix[8][11] ), .B(n84), .C(\regs_matrix[10][11] ), 
        .D(n671), .Y(n559) );
  OAI22X1 U659 ( .A(\regs_matrix[12][11] ), .B(n648), .C(\regs_matrix[14][11] ), .D(n1), .Y(n558) );
  NOR2X1 U660 ( .A(n560), .B(n561), .Y(n556) );
  OAI22X1 U661 ( .A(\regs_matrix[11][11] ), .B(n654), .C(\regs_matrix[9][11] ), 
        .D(n677), .Y(n561) );
  OAI22X1 U662 ( .A(\regs_matrix[13][11] ), .B(n659), .C(\regs_matrix[15][11] ), .D(n664), .Y(n560) );
  NAND2X1 U663 ( .A(n562), .B(n563), .Y(n554) );
  NOR2X1 U664 ( .A(n564), .B(n565), .Y(n563) );
  OAI22X1 U665 ( .A(outreg_data[11]), .B(n641), .C(\regs_matrix[2][11] ), .D(
        n671), .Y(n565) );
  OAI22X1 U666 ( .A(\regs_matrix[4][11] ), .B(n649), .C(\regs_matrix[6][11] ), 
        .D(n650), .Y(n564) );
  NOR2X1 U667 ( .A(n566), .B(n567), .Y(n562) );
  OAI22X1 U668 ( .A(n654), .B(\regs_matrix[3][11] ), .C(n677), .D(
        \regs_matrix[1][11] ), .Y(n567) );
  OAI22X1 U669 ( .A(\regs_matrix[5][11] ), .B(n659), .C(\regs_matrix[7][11] ), 
        .D(n664), .Y(n566) );
  MUX2X1 U670 ( .B(n568), .A(n569), .S(n666), .Y(r2_data[12]) );
  NAND2X1 U671 ( .A(n570), .B(n571), .Y(n569) );
  NOR2X1 U672 ( .A(n572), .B(n573), .Y(n571) );
  OAI22X1 U673 ( .A(\regs_matrix[8][12] ), .B(n673), .C(\regs_matrix[10][12] ), 
        .D(n646), .Y(n573) );
  OAI22X1 U674 ( .A(\regs_matrix[12][12] ), .B(n649), .C(\regs_matrix[14][12] ), .D(n1), .Y(n572) );
  NOR2X1 U675 ( .A(n574), .B(n575), .Y(n570) );
  OAI22X1 U676 ( .A(\regs_matrix[11][12] ), .B(n654), .C(\regs_matrix[9][12] ), 
        .D(n656), .Y(n575) );
  OAI22X1 U677 ( .A(\regs_matrix[13][12] ), .B(n659), .C(\regs_matrix[15][12] ), .D(n71), .Y(n574) );
  NAND2X1 U678 ( .A(n576), .B(n577), .Y(n568) );
  NOR2X1 U679 ( .A(n578), .B(n579), .Y(n577) );
  OAI22X1 U680 ( .A(outreg_data[12]), .B(n81), .C(\regs_matrix[2][12] ), .D(
        n646), .Y(n579) );
  OAI22X1 U681 ( .A(\regs_matrix[4][12] ), .B(n649), .C(\regs_matrix[6][12] ), 
        .D(n651), .Y(n578) );
  NOR2X1 U682 ( .A(n580), .B(n581), .Y(n576) );
  OAI22X1 U683 ( .A(\regs_matrix[3][12] ), .B(n653), .C(\regs_matrix[1][12] ), 
        .D(n670), .Y(n581) );
  OAI22X1 U684 ( .A(\regs_matrix[5][12] ), .B(n658), .C(\regs_matrix[7][12] ), 
        .D(n664), .Y(n580) );
  MUX2X1 U685 ( .B(n582), .A(n583), .S(n667), .Y(r2_data[13]) );
  NAND2X1 U686 ( .A(n584), .B(n585), .Y(n583) );
  NOR2X1 U687 ( .A(n587), .B(n586), .Y(n585) );
  OAI22X1 U688 ( .A(\regs_matrix[8][13] ), .B(n640), .C(\regs_matrix[10][13] ), 
        .D(n645), .Y(n587) );
  OAI22X1 U689 ( .A(\regs_matrix[12][13] ), .B(n675), .C(\regs_matrix[14][13] ), .D(n650), .Y(n586) );
  NOR2X1 U690 ( .A(n588), .B(n589), .Y(n584) );
  OAI22X1 U691 ( .A(\regs_matrix[11][13] ), .B(n654), .C(\regs_matrix[9][13] ), 
        .D(n670), .Y(n589) );
  OAI22X1 U692 ( .A(\regs_matrix[13][13] ), .B(n658), .C(\regs_matrix[15][13] ), .D(n663), .Y(n588) );
  NAND2X1 U693 ( .A(n590), .B(n591), .Y(n582) );
  NOR2X1 U694 ( .A(n592), .B(n593), .Y(n591) );
  OAI22X1 U695 ( .A(outreg_data[13]), .B(n81), .C(\regs_matrix[2][13] ), .D(
        n646), .Y(n593) );
  OAI22X1 U696 ( .A(\regs_matrix[4][13] ), .B(n649), .C(\regs_matrix[6][13] ), 
        .D(n651), .Y(n592) );
  NOR2X1 U697 ( .A(n594), .B(n595), .Y(n590) );
  OAI22X1 U698 ( .A(\regs_matrix[3][13] ), .B(n654), .C(\regs_matrix[1][13] ), 
        .D(n4), .Y(n595) );
  OAI22X1 U699 ( .A(\regs_matrix[5][13] ), .B(n658), .C(\regs_matrix[7][13] ), 
        .D(n663), .Y(n594) );
  MUX2X1 U700 ( .B(n596), .A(n597), .S(n666), .Y(r2_data[14]) );
  NAND2X1 U701 ( .A(n598), .B(n599), .Y(n597) );
  NOR2X1 U702 ( .A(n600), .B(n601), .Y(n599) );
  OAI22X1 U703 ( .A(\regs_matrix[8][14] ), .B(n640), .C(\regs_matrix[10][14] ), 
        .D(n669), .Y(n601) );
  OAI22X1 U704 ( .A(\regs_matrix[12][14] ), .B(n675), .C(\regs_matrix[14][14] ), .D(n650), .Y(n600) );
  NOR2X1 U705 ( .A(n602), .B(n603), .Y(n598) );
  OAI22X1 U706 ( .A(\regs_matrix[11][14] ), .B(n654), .C(\regs_matrix[9][14] ), 
        .D(n670), .Y(n603) );
  OAI22X1 U707 ( .A(\regs_matrix[13][14] ), .B(n658), .C(\regs_matrix[15][14] ), .D(n663), .Y(n602) );
  NAND2X1 U708 ( .A(n604), .B(n605), .Y(n596) );
  NOR2X1 U709 ( .A(n606), .B(n607), .Y(n605) );
  OAI22X1 U710 ( .A(outreg_data[14]), .B(n640), .C(\regs_matrix[2][14] ), .D(
        n669), .Y(n607) );
  OAI22X1 U711 ( .A(\regs_matrix[4][14] ), .B(n675), .C(\regs_matrix[6][14] ), 
        .D(n1), .Y(n606) );
  NOR2X1 U712 ( .A(n608), .B(n609), .Y(n604) );
  OAI22X1 U713 ( .A(\regs_matrix[3][14] ), .B(n654), .C(\regs_matrix[1][14] ), 
        .D(n4), .Y(n609) );
  OAI22X1 U714 ( .A(\regs_matrix[5][14] ), .B(n658), .C(\regs_matrix[7][14] ), 
        .D(n663), .Y(n608) );
  MUX2X1 U715 ( .B(n610), .A(n611), .S(n667), .Y(r2_data[15]) );
  NAND2X1 U716 ( .A(n612), .B(n613), .Y(n611) );
  NOR2X1 U717 ( .A(n614), .B(n615), .Y(n613) );
  OAI22X1 U718 ( .A(\regs_matrix[8][15] ), .B(n81), .C(\regs_matrix[10][15] ), 
        .D(n646), .Y(n615) );
  OAI22X1 U719 ( .A(\regs_matrix[12][15] ), .B(n648), .C(\regs_matrix[14][15] ), .D(n651), .Y(n614) );
  NOR2X1 U720 ( .A(n616), .B(n617), .Y(n612) );
  OAI22X1 U721 ( .A(\regs_matrix[11][15] ), .B(n654), .C(\regs_matrix[9][15] ), 
        .D(n670), .Y(n617) );
  OAI22X1 U722 ( .A(\regs_matrix[13][15] ), .B(n658), .C(\regs_matrix[15][15] ), .D(n663), .Y(n616) );
  NAND2X1 U723 ( .A(n618), .B(n619), .Y(n610) );
  NOR2X1 U724 ( .A(n620), .B(n621), .Y(n619) );
  OAI22X1 U725 ( .A(outreg_data[15]), .B(n673), .C(\regs_matrix[2][15] ), .D(
        n669), .Y(n621) );
  OAI22X1 U726 ( .A(\regs_matrix[4][15] ), .B(n648), .C(\regs_matrix[6][15] ), 
        .D(n651), .Y(n620) );
  NOR2X1 U727 ( .A(n622), .B(n623), .Y(n618) );
  OAI22X1 U728 ( .A(\regs_matrix[3][15] ), .B(n654), .C(\regs_matrix[1][15] ), 
        .D(n656), .Y(n623) );
  OAI22X1 U729 ( .A(\regs_matrix[5][15] ), .B(n658), .C(\regs_matrix[7][15] ), 
        .D(n663), .Y(n622) );
  NOR2X1 U730 ( .A(n624), .B(n625), .Y(n387) );
  OAI21X1 U731 ( .A(\regs_matrix[6][16] ), .B(n651), .C(n626), .Y(n625) );
  AOI22X1 U732 ( .A(n672), .B(n349), .C(n674), .D(n350), .Y(n626) );
  OAI21X1 U733 ( .A(\regs_matrix[4][16] ), .B(n675), .C(n668), .Y(n624) );
  NOR2X1 U734 ( .A(n627), .B(n628), .Y(n388) );
  OAI22X1 U735 ( .A(\regs_matrix[3][16] ), .B(n653), .C(\regs_matrix[1][16] ), 
        .D(n4), .Y(n628) );
  OAI22X1 U736 ( .A(\regs_matrix[5][16] ), .B(n678), .C(\regs_matrix[7][16] ), 
        .D(n663), .Y(n627) );
  NOR2X1 U737 ( .A(n629), .B(n630), .Y(n389) );
  OAI21X1 U738 ( .A(\regs_matrix[12][16] ), .B(n675), .C(n631), .Y(n630) );
  AOI22X1 U739 ( .A(n672), .B(n356), .C(n674), .D(n632), .Y(n631) );
  INVX2 U740 ( .A(\regs_matrix[8][16] ), .Y(n632) );
  NAND3X1 U741 ( .A(n633), .B(n76), .C(n634), .Y(n398) );
  NAND3X1 U742 ( .A(N16), .B(n633), .C(n634), .Y(n399) );
  OAI22X1 U743 ( .A(\regs_matrix[9][16] ), .B(n670), .C(\regs_matrix[14][16] ), 
        .D(n1), .Y(n629) );
  INVX2 U744 ( .A(N14), .Y(n634) );
  NAND3X1 U745 ( .A(N14), .B(n77), .C(n16), .Y(n403) );
  NOR2X1 U746 ( .A(n635), .B(n636), .Y(n390) );
  OAI21X1 U747 ( .A(\regs_matrix[11][16] ), .B(n653), .C(n666), .Y(n636) );
  NAND2X1 U748 ( .A(n82), .B(n76), .Y(n402) );
  OAI22X1 U749 ( .A(\regs_matrix[15][16] ), .B(n663), .C(\regs_matrix[13][16] ), .D(n678), .Y(n635) );
  NAND3X1 U750 ( .A(N16), .B(n16), .C(N14), .Y(n404) );
  BUFX4 U751 ( .A(n637), .Y(n639) );
  INVX8 U752 ( .A(n639), .Y(n640) );
  INVX8 U753 ( .A(n676), .Y(n646) );
  INVX8 U754 ( .A(n647), .Y(n648) );
  INVX8 U755 ( .A(n14), .Y(n651) );
  INVX8 U756 ( .A(n652), .Y(n653) );
  INVX8 U757 ( .A(n652), .Y(n654) );
  INVX2 U758 ( .A(n398), .Y(n637) );
  INVX4 U759 ( .A(n399), .Y(n647) );
  INVX4 U760 ( .A(n402), .Y(n652) );
  INVX2 U761 ( .A(n643), .Y(n669) );
  INVX4 U762 ( .A(n655), .Y(n670) );
  INVX1 U763 ( .A(n645), .Y(n672) );
  INVX1 U764 ( .A(n673), .Y(n674) );
  INVX2 U765 ( .A(n647), .Y(n675) );
  BUFX2 U766 ( .A(n659), .Y(n678) );
  BUFX2 U767 ( .A(n642), .Y(n643) );
  INVX4 U768 ( .A(w_data[11]), .Y(n707) );
  INVX4 U769 ( .A(w_data[12]), .Y(n710) );
  INVX4 U770 ( .A(w_data[14]), .Y(n715) );
  INVX4 U771 ( .A(w_data[8]), .Y(n700) );
  INVX4 U772 ( .A(w_data[10]), .Y(n705) );
  INVX4 U773 ( .A(w_data[6]), .Y(n696) );
  INVX4 U774 ( .A(w_data[7]), .Y(n698) );
  INVX4 U775 ( .A(w_data[13]), .Y(n712) );
  INVX4 U776 ( .A(w_data[15]), .Y(n718) );
  INVX8 U777 ( .A(n696), .Y(n697) );
  INVX8 U778 ( .A(n698), .Y(n699) );
  INVX8 U779 ( .A(n700), .Y(n701) );
  INVX8 U780 ( .A(n710), .Y(n711) );
  INVX8 U781 ( .A(n718), .Y(n719) );
  INVX2 U782 ( .A(w_sel[2]), .Y(n731) );
  INVX2 U783 ( .A(w_en), .Y(n732) );
  INVX2 U784 ( .A(w_sel[3]), .Y(n733) );
  INVX2 U785 ( .A(w_sel[1]), .Y(n734) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data({src2_data[16], n4, 
        src2_data[14:1], n5}), .alu_op(alu_op), .result(alu_result), 
        .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX4 U2 ( .A(n3), .Y(n4) );
  INVX2 U3 ( .A(w_data_sel[1]), .Y(n39) );
  AND2X2 U4 ( .A(n39), .B(n6), .Y(n1) );
  AND2X2 U5 ( .A(w_data_sel[0]), .B(n39), .Y(n2) );
  INVX2 U6 ( .A(src2_data[15]), .Y(n3) );
  BUFX4 U7 ( .A(src2_data[0]), .Y(n5) );
  AND2X2 U8 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U9 ( .A(alu_result[15]), .Y(n8) );
  INVX2 U10 ( .A(w_data_sel[0]), .Y(n6) );
  AOI22X1 U11 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n7)
         );
  OAI21X1 U12 ( .A(n39), .B(n8), .C(n7), .Y(dest_data[15]) );
  INVX2 U13 ( .A(alu_result[14]), .Y(n10) );
  AOI22X1 U14 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n9)
         );
  OAI21X1 U15 ( .A(n39), .B(n10), .C(n9), .Y(dest_data[14]) );
  INVX2 U16 ( .A(alu_result[13]), .Y(n12) );
  AOI22X1 U17 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n11)
         );
  OAI21X1 U18 ( .A(n39), .B(n12), .C(n11), .Y(dest_data[13]) );
  INVX2 U19 ( .A(alu_result[12]), .Y(n14) );
  AOI22X1 U20 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n13)
         );
  OAI21X1 U21 ( .A(n39), .B(n14), .C(n13), .Y(dest_data[12]) );
  INVX2 U22 ( .A(alu_result[11]), .Y(n16) );
  AOI22X1 U23 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n15)
         );
  OAI21X1 U24 ( .A(n39), .B(n16), .C(n15), .Y(dest_data[11]) );
  INVX2 U25 ( .A(alu_result[10]), .Y(n18) );
  AOI22X1 U26 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n17)
         );
  OAI21X1 U27 ( .A(n39), .B(n18), .C(n17), .Y(dest_data[10]) );
  INVX2 U28 ( .A(alu_result[9]), .Y(n20) );
  AOI22X1 U29 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n19) );
  OAI21X1 U30 ( .A(n39), .B(n20), .C(n19), .Y(dest_data[9]) );
  INVX2 U31 ( .A(alu_result[8]), .Y(n22) );
  AOI22X1 U32 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n21) );
  OAI21X1 U33 ( .A(n39), .B(n22), .C(n21), .Y(dest_data[8]) );
  INVX2 U34 ( .A(alu_result[7]), .Y(n24) );
  AOI22X1 U35 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n23) );
  OAI21X1 U36 ( .A(n39), .B(n24), .C(n23), .Y(dest_data[7]) );
  INVX2 U37 ( .A(alu_result[6]), .Y(n26) );
  AOI22X1 U38 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n25) );
  OAI21X1 U39 ( .A(n39), .B(n26), .C(n25), .Y(dest_data[6]) );
  INVX2 U40 ( .A(alu_result[5]), .Y(n28) );
  AOI22X1 U41 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n27) );
  OAI21X1 U42 ( .A(n39), .B(n28), .C(n27), .Y(dest_data[5]) );
  INVX2 U43 ( .A(alu_result[4]), .Y(n30) );
  AOI22X1 U44 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n29) );
  OAI21X1 U45 ( .A(n39), .B(n30), .C(n29), .Y(dest_data[4]) );
  INVX2 U46 ( .A(alu_result[3]), .Y(n32) );
  AOI22X1 U47 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n31) );
  OAI21X1 U48 ( .A(n39), .B(n32), .C(n31), .Y(dest_data[3]) );
  INVX2 U49 ( .A(alu_result[2]), .Y(n34) );
  AOI22X1 U50 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n33) );
  OAI21X1 U51 ( .A(n39), .B(n34), .C(n33), .Y(dest_data[2]) );
  INVX2 U52 ( .A(alu_result[1]), .Y(n36) );
  AOI22X1 U53 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n35) );
  OAI21X1 U54 ( .A(n39), .B(n36), .C(n35), .Y(dest_data[1]) );
  INVX2 U55 ( .A(alu_result[0]), .Y(n38) );
  AOI22X1 U56 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n37) );
  OAI21X1 U57 ( .A(n39), .B(n38), .C(n37), .Y(dest_data[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dr, lc, cnt_up, clear, overflow;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;

  sync_1 SYNC_DR ( .clk(clk), .n_reset(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  sync_0 SYNC_LC ( .clk(clk), .n_reset(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  counter COUNTER ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(
        clear), .one_k_samples(one_k_samples) );
  controller CONTROLLER ( .clk(clk), .n_reset(n_reset), .dr(dr), .lc(lc), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err) );
  magnitude MAGNITUDE ( .in(outreg_data), .out(fir_out) );
  datapath DATAPATH ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), 
        .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(outreg_data), .overflow(overflow) );
endmodule

