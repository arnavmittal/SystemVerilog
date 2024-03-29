/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb 13 16:20:16 2016
/////////////////////////////////////////////////////////////


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, serial_in, shift_strobe, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, serial_in, shift_strobe;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 DUT3 ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n42, n43, n44, n45, n46, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n47;

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
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n46) );
  OAI22X1 U9 ( .A(n5), .B(n2), .C(n6), .D(n4), .Y(n45) );
  XOR2X1 U10 ( .A(n7), .B(n3), .Y(n6) );
  NAND2X1 U11 ( .A(count_out[1]), .B(n8), .Y(n7) );
  OAI22X1 U12 ( .A(n9), .B(n2), .C(n15), .D(n4), .Y(n44) );
  XNOR2X1 U13 ( .A(n16), .B(n17), .Y(n15) );
  INVX1 U14 ( .A(count_out[2]), .Y(n9) );
  OAI22X1 U15 ( .A(n18), .B(n2), .C(n19), .D(n4), .Y(n43) );
  INVX1 U16 ( .A(n20), .Y(n4) );
  XOR2X1 U17 ( .A(n21), .B(n22), .Y(n19) );
  NOR2X1 U18 ( .A(n16), .B(n17), .Y(n22) );
  NAND2X1 U19 ( .A(count_out[2]), .B(n8), .Y(n17) );
  NAND2X1 U20 ( .A(n3), .B(count_out[1]), .Y(n16) );
  AND2X1 U21 ( .A(count_out[0]), .B(n8), .Y(n3) );
  INVX1 U22 ( .A(n23), .Y(n2) );
  INVX1 U23 ( .A(count_out[3]), .Y(n18) );
  OAI21X1 U24 ( .A(n24), .B(n25), .C(n26), .Y(n42) );
  NAND2X1 U25 ( .A(rollover_flag), .B(n23), .Y(n26) );
  NAND2X1 U26 ( .A(n27), .B(n28), .Y(n25) );
  MUX2X1 U27 ( .B(n21), .A(count_out[3]), .S(n29), .Y(n28) );
  OAI21X1 U28 ( .A(n30), .B(rollover_val[2]), .C(rollover_val[3]), .Y(n29) );
  INVX1 U29 ( .A(n31), .Y(n30) );
  NAND2X1 U30 ( .A(count_out[3]), .B(n8), .Y(n21) );
  NAND3X1 U31 ( .A(n32), .B(n33), .C(n34), .Y(n8) );
  AOI21X1 U32 ( .A(rollover_val[1]), .B(n5), .C(n35), .Y(n34) );
  XNOR2X1 U33 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  XNOR2X1 U34 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n32) );
  MUX2X1 U35 ( .B(n36), .A(n37), .S(rollover_val[0]), .Y(n27) );
  OAI21X1 U36 ( .A(count_out[1]), .B(n38), .C(n1), .Y(n37) );
  INVX1 U37 ( .A(count_out[0]), .Y(n1) );
  INVX1 U38 ( .A(rollover_val[1]), .Y(n38) );
  OAI21X1 U39 ( .A(n31), .B(n5), .C(count_out[0]), .Y(n36) );
  NAND3X1 U40 ( .A(n20), .B(n39), .C(n40), .Y(n24) );
  MUX2X1 U41 ( .B(n35), .A(n41), .S(n31), .Y(n40) );
  NOR2X1 U42 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n41) );
  OAI21X1 U43 ( .A(rollover_val[1]), .B(n5), .C(n47), .Y(n35) );
  OAI21X1 U44 ( .A(n47), .B(n5), .C(n31), .Y(n39) );
  NOR2X1 U45 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n31) );
  INVX1 U46 ( .A(count_out[1]), .Y(n5) );
  XNOR2X1 U47 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n47) );
  NOR2X1 U48 ( .A(n23), .B(clear), .Y(n20) );
  NOR2X1 U49 ( .A(count_enable), .B(clear), .Y(n23) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n47, n48, n49, n50, n51, n52;

  DFFSR \curr_count_reg[0]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \curr_count_reg[1]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \curr_count_reg[2]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \curr_count_reg[3]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR curr_rollover_flag_reg ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n48) );
  OAI22X1 U9 ( .A(n5), .B(n2), .C(n6), .D(n4), .Y(n49) );
  XOR2X1 U10 ( .A(n7), .B(n3), .Y(n6) );
  NAND2X1 U11 ( .A(count_out[1]), .B(n8), .Y(n7) );
  OAI22X1 U12 ( .A(n9), .B(n2), .C(n15), .D(n4), .Y(n50) );
  XNOR2X1 U13 ( .A(n16), .B(n17), .Y(n15) );
  INVX1 U14 ( .A(count_out[2]), .Y(n9) );
  OAI22X1 U15 ( .A(n18), .B(n2), .C(n19), .D(n4), .Y(n51) );
  INVX1 U16 ( .A(n20), .Y(n4) );
  XOR2X1 U17 ( .A(n21), .B(n22), .Y(n19) );
  NOR2X1 U18 ( .A(n16), .B(n17), .Y(n22) );
  NAND2X1 U19 ( .A(count_out[2]), .B(n8), .Y(n17) );
  NAND2X1 U20 ( .A(n3), .B(count_out[1]), .Y(n16) );
  AND2X1 U21 ( .A(count_out[0]), .B(n8), .Y(n3) );
  INVX1 U22 ( .A(n23), .Y(n2) );
  INVX1 U23 ( .A(count_out[3]), .Y(n18) );
  OAI21X1 U24 ( .A(n24), .B(n25), .C(n26), .Y(n52) );
  NAND2X1 U25 ( .A(rollover_flag), .B(n23), .Y(n26) );
  NAND2X1 U26 ( .A(n27), .B(n28), .Y(n25) );
  MUX2X1 U27 ( .B(n21), .A(count_out[3]), .S(n29), .Y(n28) );
  OAI21X1 U28 ( .A(n30), .B(rollover_val[2]), .C(rollover_val[3]), .Y(n29) );
  INVX1 U29 ( .A(n31), .Y(n30) );
  NAND2X1 U30 ( .A(count_out[3]), .B(n8), .Y(n21) );
  NAND3X1 U31 ( .A(n32), .B(n33), .C(n34), .Y(n8) );
  AOI21X1 U32 ( .A(rollover_val[1]), .B(n5), .C(n35), .Y(n34) );
  XNOR2X1 U33 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  XNOR2X1 U34 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n32) );
  MUX2X1 U35 ( .B(n36), .A(n37), .S(rollover_val[0]), .Y(n27) );
  OAI21X1 U36 ( .A(count_out[1]), .B(n38), .C(n1), .Y(n37) );
  INVX1 U37 ( .A(count_out[0]), .Y(n1) );
  INVX1 U38 ( .A(rollover_val[1]), .Y(n38) );
  OAI21X1 U39 ( .A(n31), .B(n5), .C(count_out[0]), .Y(n36) );
  NAND3X1 U40 ( .A(n20), .B(n39), .C(n40), .Y(n24) );
  MUX2X1 U41 ( .B(n35), .A(n41), .S(n31), .Y(n40) );
  NOR2X1 U42 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n41) );
  OAI21X1 U43 ( .A(rollover_val[1]), .B(n5), .C(n47), .Y(n35) );
  OAI21X1 U44 ( .A(n47), .B(n5), .C(n31), .Y(n39) );
  NOR2X1 U45 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n31) );
  INVX1 U46 ( .A(count_out[1]), .Y(n5) );
  XNOR2X1 U47 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n47) );
  NOR2X1 U48 ( .A(n23), .B(clear), .Y(n20) );
  NOR2X1 U49 ( .A(count_enable), .B(clear), .Y(n23) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   state, clear1, ce2, n1, n2;

  DFFSR state_reg ( .D(enable_timer), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state) );
  DFFSR clear1_reg ( .D(packet_done), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        clear1) );
  DFFPOSX1 ce2_reg ( .D(n2), .CLK(clk), .Q(ce2) );
  flex_counter_NUM_CNT_BITS4_1 DUT ( .clk(clk), .n_rst(n_rst), .clear(clear1), 
        .count_enable(state), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_NUM_CNT_BITS4_0 DUT1 ( .clk(clk), .n_rst(n_rst), .clear(clear1), 
        .count_enable(ce2), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(n1), .Y(n2) );
  MUX2X1 U4 ( .B(ce2), .A(shift_strobe), .S(n_rst), .Y(n1) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n21, n22, n23, sbc_clear, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17;
  wire   [2:0] state;
  assign enable_timer = sbc_clear;

  DFFSR \state_reg[0]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  INVX1 U6 ( .A(n4), .Y(sbc_enable) );
  OR2X1 U7 ( .A(n5), .B(n6), .Y(n23) );
  OAI21X1 U8 ( .A(packet_done), .B(n7), .C(n4), .Y(n6) );
  NAND2X1 U9 ( .A(n8), .B(n9), .Y(n4) );
  MUX2X1 U10 ( .B(n10), .A(n11), .S(state[2]), .Y(n5) );
  NAND2X1 U11 ( .A(start_bit_detected), .B(n11), .Y(n10) );
  OAI21X1 U12 ( .A(n11), .B(n12), .C(n13), .Y(n22) );
  OAI21X1 U13 ( .A(n8), .B(state[0]), .C(state[2]), .Y(n13) );
  OR2X1 U14 ( .A(framing_error), .B(n14), .Y(n12) );
  OAI21X1 U15 ( .A(n14), .B(n9), .C(n15), .Y(n21) );
  AOI21X1 U16 ( .A(packet_done), .B(sbc_clear), .C(n8), .Y(n15) );
  INVX1 U17 ( .A(n16), .Y(n8) );
  NOR2X1 U18 ( .A(n9), .B(n17), .Y(load_buffer) );
  NAND2X1 U19 ( .A(n16), .B(n11), .Y(n17) );
  NAND2X1 U20 ( .A(state[1]), .B(n11), .Y(n16) );
  INVX1 U21 ( .A(state[0]), .Y(n11) );
  INVX1 U22 ( .A(state[2]), .Y(n9) );
  NOR2X1 U23 ( .A(n7), .B(state[2]), .Y(sbc_clear) );
  NAND2X1 U24 ( .A(state[0]), .B(n14), .Y(n7) );
  INVX1 U25 ( .A(state[1]), .Y(n14) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, start_bit_detected, sbc_clear, sbc_enable,
         enable_timer, packet_done, load_buffer;
  wire   [7:0] packet_data;

  sr_9bit SR_9BIT ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .shift_strobe(shift_strobe), .packet_data(packet_data), .stop_bit(
        stop_bit) );
  start_bit_det START_BIT_DET ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(start_bit_detected) );
  stop_bit_chk STOP_BIT_CHK ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  rx_data_buff RX_DATA_BUFFER ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
endmodule

