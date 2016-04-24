
module edge_detect ( clk, n_rst, SCL_sync, rising_edge, falling_edge );
  input clk, n_rst, SCL_sync;
  output rising_edge, falling_edge;
  wire   stage1, stage2, n3;

  DFFSR stage1_reg ( .D(SCL_sync), .CLK(clk), .R(n_rst), .S(1'b1), .Q(stage1)
         );
  DFFSR stage2_reg ( .D(stage1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(stage2) );
  AND2X1 U5 ( .A(n3), .B(stage1), .Y(rising_edge) );
  NOR2X1 U6 ( .A(stage1), .B(n3), .Y(falling_edge) );
  INVX1 U7 ( .A(stage2), .Y(n3) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6, n7,
         n8;

  DFFSR \parallel_out_reg[0]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  INVX1 U2 ( .A(n1), .Y(n26) );
  MUX2X1 U3 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n24) );
  MUX2X1 U5 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n20) );
  MUX2X1 U9 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n18) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n16) );
  MUX2X1 U13 ( .B(parallel_out[5]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n14) );
  MUX2X1 U15 ( .B(parallel_out[6]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n12) );
  MUX2X1 U17 ( .B(parallel_out[7]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n8) );
endmodule


module stp_sr_rx ( clk, n_rst, SDA_sync, rising_edge, rx_enable, rx_data );
  output [7:0] rx_data;
  input clk, n_rst, SDA_sync, rising_edge, rx_enable;
  wire   _0_net_;

  flex_stp_sr_NUM_BITS8_SHIFT_MSB1 STP_SR_RX ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .serial_in(SDA_sync), .parallel_out(rx_data)
         );
  AND2X1 U1 ( .A(rx_enable), .B(rising_edge), .Y(_0_net_) );
endmodule


module checker_block ( clk, n_rst, SDA_sync, SCL_sync, rx_data, bus_address, 
        address_mode, rw_mode, address_match, start, stop );
  input [7:0] rx_data;
  input [9:0] bus_address;
  output [1:0] address_match;
  input clk, n_rst, SDA_sync, SCL_sync, address_mode;
  output rw_mode, start, stop;
  wire   scl_mid1, scl_mid2, sda_mid1, sda_mid2, N2, N3, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46;
  wire   [1:0] temp_address_match;

  DFFSR scl_mid1_reg ( .D(SCL_sync), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        scl_mid1) );
  DFFSR scl_mid2_reg ( .D(scl_mid1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        scl_mid2) );
  DFFSR sda_mid1_reg ( .D(SDA_sync), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sda_mid1) );
  DFFSR sda_mid2_reg ( .D(sda_mid1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sda_mid2) );
  DFFSR stop_reg ( .D(N3), .CLK(clk), .R(n_rst), .S(1'b1), .Q(stop) );
  DFFSR rw_mode_reg ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rw_mode) );
  DFFSR \address_match_reg[1]  ( .D(temp_address_match[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(address_match[1]) );
  DFFSR \address_match_reg[0]  ( .D(temp_address_match[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(address_match[0]) );
  DFFSR start_reg ( .D(N2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(start) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(address_mode), .Y(temp_address_match[1]) );
  NAND2X1 U13 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U14 ( .A(rx_data[1]), .B(bus_address[8]), .Y(n4) );
  XNOR2X1 U15 ( .A(rx_data[2]), .B(bus_address[9]), .Y(n3) );
  NAND2X1 U16 ( .A(n5), .B(n6), .Y(n1) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(temp_address_match[0]) );
  NAND2X1 U18 ( .A(n6), .B(address_mode), .Y(n8) );
  MUX2X1 U19 ( .B(n9), .A(n10), .S(address_mode), .Y(n6) );
  NAND3X1 U20 ( .A(n11), .B(n12), .C(n13), .Y(n10) );
  NOR2X1 U21 ( .A(n14), .B(n15), .Y(n13) );
  XOR2X1 U22 ( .A(rx_data[4]), .B(bus_address[4]), .Y(n15) );
  XOR2X1 U23 ( .A(rx_data[3]), .B(bus_address[3]), .Y(n14) );
  XNOR2X1 U24 ( .A(bus_address[5]), .B(rx_data[5]), .Y(n12) );
  XNOR2X1 U25 ( .A(bus_address[6]), .B(rx_data[6]), .Y(n11) );
  NAND3X1 U26 ( .A(n16), .B(n17), .C(n18), .Y(n9) );
  NOR2X1 U27 ( .A(n28), .B(n29), .Y(n18) );
  XOR2X1 U28 ( .A(rx_data[5]), .B(bus_address[4]), .Y(n29) );
  XOR2X1 U29 ( .A(rx_data[4]), .B(bus_address[3]), .Y(n28) );
  XNOR2X1 U30 ( .A(bus_address[5]), .B(rx_data[6]), .Y(n17) );
  XNOR2X1 U31 ( .A(bus_address[6]), .B(rx_data[7]), .Y(n16) );
  INVX1 U32 ( .A(n5), .Y(n7) );
  MUX2X1 U33 ( .B(n30), .A(n31), .S(address_mode), .Y(n5) );
  NAND3X1 U34 ( .A(n32), .B(n33), .C(n34), .Y(n31) );
  NOR2X1 U35 ( .A(n35), .B(n36), .Y(n34) );
  XNOR2X1 U36 ( .A(n37), .B(bus_address[1]), .Y(n36) );
  INVX1 U37 ( .A(rx_data[1]), .Y(n37) );
  XOR2X1 U38 ( .A(rx_data[0]), .B(bus_address[0]), .Y(n35) );
  XNOR2X1 U39 ( .A(bus_address[2]), .B(rx_data[2]), .Y(n33) );
  XNOR2X1 U40 ( .A(rx_data[7]), .B(bus_address[7]), .Y(n32) );
  NAND3X1 U41 ( .A(n38), .B(n39), .C(n40), .Y(n30) );
  XNOR2X1 U42 ( .A(bus_address[1]), .B(rx_data[2]), .Y(n40) );
  XNOR2X1 U43 ( .A(bus_address[2]), .B(rx_data[3]), .Y(n39) );
  XNOR2X1 U44 ( .A(bus_address[0]), .B(rx_data[1]), .Y(n38) );
  NOR2X1 U45 ( .A(n41), .B(n42), .Y(N3) );
  NAND2X1 U46 ( .A(sda_mid1), .B(scl_mid2), .Y(n42) );
  NAND2X1 U47 ( .A(scl_mid1), .B(n43), .Y(n41) );
  INVX1 U48 ( .A(sda_mid2), .Y(n43) );
  NOR2X1 U49 ( .A(n44), .B(n45), .Y(N2) );
  NAND2X1 U50 ( .A(sda_mid2), .B(scl_mid2), .Y(n45) );
  NAND2X1 U51 ( .A(scl_mid1), .B(n46), .Y(n44) );
  INVX1 U52 ( .A(sda_mid1), .Y(n46) );
endmodule


module slave_timer ( clk, n_rst, start, stop, rising_edge, falling_edge, 
        byte_received, ack_prep, ack_check, ack_done );
  input clk, n_rst, start, stop, rising_edge, falling_edge;
  output byte_received, ack_prep, ack_check, ack_done;
  wire   temp_ack_prep, temp_ack_check, n72, n73, n74, n75, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61;
  wire   [3:0] state;

  DFFSR \state_reg[0]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[3]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR ack_done_reg ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ack_done)
         );
  DFFSR byte_received_reg ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        byte_received) );
  DFFSR ack_prep_reg ( .D(temp_ack_prep), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        ack_prep) );
  DFFSR ack_check_reg ( .D(temp_ack_check), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(ack_check) );
  INVX1 U11 ( .A(n9), .Y(temp_ack_check) );
  INVX1 U12 ( .A(n10), .Y(n60) );
  OAI21X1 U13 ( .A(n11), .B(n12), .C(n13), .Y(n75) );
  OAI21X1 U14 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  OAI21X1 U15 ( .A(n17), .B(n18), .C(n19), .Y(n15) );
  OAI21X1 U16 ( .A(n20), .B(n21), .C(n22), .Y(n14) );
  OAI21X1 U17 ( .A(n11), .B(n23), .C(n24), .Y(n74) );
  OAI21X1 U18 ( .A(n25), .B(n26), .C(n16), .Y(n24) );
  OAI21X1 U19 ( .A(start), .B(n20), .C(n19), .Y(n26) );
  INVX1 U20 ( .A(n27), .Y(n19) );
  OAI21X1 U21 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  NOR2X1 U22 ( .A(temp_ack_prep), .B(n31), .Y(n30) );
  INVX1 U23 ( .A(n32), .Y(n31) );
  AND2X1 U24 ( .A(n61), .B(n12), .Y(temp_ack_prep) );
  NAND2X1 U25 ( .A(state[1]), .B(n12), .Y(n29) );
  INVX1 U26 ( .A(n33), .Y(n20) );
  OAI21X1 U27 ( .A(n12), .B(n34), .C(n35), .Y(n25) );
  OR2X1 U28 ( .A(n17), .B(state[1]), .Y(n34) );
  AND2X1 U29 ( .A(n36), .B(n28), .Y(n17) );
  OAI21X1 U30 ( .A(n11), .B(n37), .C(n38), .Y(n73) );
  OAI21X1 U31 ( .A(n39), .B(n40), .C(n16), .Y(n38) );
  OAI21X1 U32 ( .A(n28), .B(n41), .C(n9), .Y(n40) );
  NAND2X1 U33 ( .A(state[0]), .B(n61), .Y(n9) );
  NOR2X1 U34 ( .A(n23), .B(n36), .Y(n61) );
  INVX1 U35 ( .A(n42), .Y(n28) );
  INVX1 U36 ( .A(n43), .Y(n11) );
  INVX1 U37 ( .A(n44), .Y(n72) );
  AOI22X1 U38 ( .A(n45), .B(n16), .C(n43), .D(state[3]), .Y(n44) );
  OAI21X1 U39 ( .A(n45), .B(n46), .C(n16), .Y(n43) );
  NAND2X1 U40 ( .A(n47), .B(n10), .Y(n46) );
  INVX1 U41 ( .A(n48), .Y(n16) );
  NAND3X1 U42 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  AOI22X1 U43 ( .A(n52), .B(n33), .C(n53), .D(state[0]), .Y(n51) );
  NOR2X1 U44 ( .A(falling_edge), .B(n36), .Y(n53) );
  NOR2X1 U45 ( .A(stop), .B(n10), .Y(n33) );
  NAND3X1 U46 ( .A(n54), .B(state[3]), .C(state[2]), .Y(n10) );
  NOR2X1 U47 ( .A(start), .B(rising_edge), .Y(n52) );
  NAND3X1 U48 ( .A(n54), .B(n21), .C(n42), .Y(n50) );
  INVX1 U49 ( .A(start), .Y(n21) );
  OAI21X1 U50 ( .A(n55), .B(n56), .C(n57), .Y(n49) );
  INVX1 U51 ( .A(rising_edge), .Y(n57) );
  OAI22X1 U52 ( .A(state[0]), .B(n36), .C(state[3]), .D(n41), .Y(n56) );
  INVX1 U53 ( .A(n47), .Y(n55) );
  AOI21X1 U54 ( .A(n18), .B(n42), .C(n39), .Y(n47) );
  NAND3X1 U55 ( .A(n32), .B(n22), .C(n35), .Y(n39) );
  NAND3X1 U56 ( .A(state[0]), .B(n23), .C(n58), .Y(n35) );
  NAND2X1 U57 ( .A(n58), .B(n54), .Y(n22) );
  INVX1 U58 ( .A(n18), .Y(n54) );
  NAND3X1 U59 ( .A(state[1]), .B(n12), .C(n58), .Y(n32) );
  NOR2X1 U60 ( .A(state[2]), .B(state[3]), .Y(n42) );
  NAND2X1 U61 ( .A(n23), .B(n12), .Y(n18) );
  INVX1 U62 ( .A(state[0]), .Y(n12) );
  INVX1 U63 ( .A(state[1]), .Y(n23) );
  OAI21X1 U64 ( .A(n59), .B(n41), .C(n36), .Y(n45) );
  NAND2X1 U65 ( .A(state[3]), .B(n37), .Y(n36) );
  NAND2X1 U66 ( .A(state[0]), .B(state[1]), .Y(n41) );
  INVX1 U67 ( .A(n58), .Y(n59) );
  NOR2X1 U68 ( .A(n37), .B(state[3]), .Y(n58) );
  INVX1 U69 ( .A(state[2]), .Y(n37) );
endmodule


module slave_controller ( clk, n_rst, start, stop, address_match, rw_mode, 
        SDA_sync, address_mode, TX_fifo_empty, RX_fifo_full, en_clock_strech, 
        RX_fifo_almost_full, byte_received, ack_prep, ack_check, ack_done, 
        rx_enable, SCL_out_slave, busy_slave, TX_read_enable_slave, 
        RX_write_enable_slave, ack_error_set_slave, sda_mode, load_data, 
        tx_enable );
  input [1:0] address_match;
  output [1:0] sda_mode;
  input clk, n_rst, start, stop, rw_mode, SDA_sync, address_mode,
         TX_fifo_empty, RX_fifo_full, en_clock_strech, RX_fifo_almost_full,
         byte_received, ack_prep, ack_check, ack_done;
  output rx_enable, SCL_out_slave, busy_slave, TX_read_enable_slave,
         RX_write_enable_slave, ack_error_set_slave, load_data, tx_enable;
  wire   temp_rx_enable, temp_busy_slave, temp_load_data, n148, n149, n150,
         n151, n152, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139;
  wire   [4:0] state;
  wire   [1:0] temp_sda_mode;
  assign SCL_out_slave = 1'b0;

  DFFSR \state_reg[0]  ( .D(n152), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(n148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n151), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n150), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(n149), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR tx_enable_reg ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), .Q(tx_enable) );
  DFFSR rx_enable_reg ( .D(temp_rx_enable), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_enable) );
  DFFSR busy_slave_reg ( .D(temp_busy_slave), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(busy_slave) );
  DFFSR TX_read_enable_slave_reg ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(TX_read_enable_slave) );
  DFFSR RX_write_enable_slave_reg ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(RX_write_enable_slave) );
  DFFSR ack_error_set_slave_reg ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(ack_error_set_slave) );
  DFFSR \sda_mode_reg[1]  ( .D(temp_sda_mode[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(sda_mode[1]) );
  DFFSR \sda_mode_reg[0]  ( .D(temp_sda_mode[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(sda_mode[0]) );
  DFFSR load_data_reg ( .D(temp_load_data), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(load_data) );
  OAI21X1 U18 ( .A(n15), .B(n16), .C(n17), .Y(temp_rx_enable) );
  NOR2X1 U19 ( .A(n18), .B(n19), .Y(n17) );
  OR2X1 U20 ( .A(n20), .B(state[1]), .Y(n16) );
  NAND2X1 U21 ( .A(n21), .B(n22), .Y(temp_busy_slave) );
  AOI21X1 U22 ( .A(n23), .B(n24), .C(temp_sda_mode[1]), .Y(n22) );
  NAND3X1 U23 ( .A(n25), .B(n26), .C(n27), .Y(temp_sda_mode[1]) );
  INVX1 U24 ( .A(n28), .Y(n21) );
  MUX2X1 U25 ( .B(n24), .A(n29), .S(n30), .Y(n28) );
  AOI22X1 U26 ( .A(n31), .B(state[4]), .C(n32), .D(n33), .Y(n29) );
  NAND2X1 U27 ( .A(n31), .B(n33), .Y(n24) );
  OAI21X1 U28 ( .A(n34), .B(n35), .C(n36), .Y(n152) );
  NAND2X1 U29 ( .A(n37), .B(n38), .Y(n36) );
  NAND3X1 U30 ( .A(n39), .B(n40), .C(n41), .Y(n38) );
  AOI21X1 U31 ( .A(RX_fifo_almost_full), .B(n42), .C(n43), .Y(n41) );
  OAI21X1 U32 ( .A(state[0]), .B(n44), .C(n45), .Y(n43) );
  AOI21X1 U33 ( .A(n46), .B(n47), .C(n19), .Y(n44) );
  INVX1 U34 ( .A(n48), .Y(n19) );
  OAI21X1 U35 ( .A(TX_fifo_empty), .B(n49), .C(n50), .Y(n47) );
  NOR2X1 U36 ( .A(state[1]), .B(en_clock_strech), .Y(n46) );
  INVX1 U37 ( .A(n51), .Y(n39) );
  OAI22X1 U38 ( .A(n52), .B(n53), .C(n54), .D(SDA_sync), .Y(n51) );
  OAI21X1 U39 ( .A(n34), .B(n30), .C(n55), .Y(n151) );
  OAI21X1 U40 ( .A(n56), .B(n57), .C(n37), .Y(n55) );
  NAND2X1 U41 ( .A(n40), .B(n58), .Y(n57) );
  INVX1 U42 ( .A(n59), .Y(n40) );
  NAND3X1 U43 ( .A(n25), .B(n60), .C(n61), .Y(n59) );
  AOI21X1 U44 ( .A(n138), .B(n52), .C(n62), .Y(n61) );
  AOI21X1 U45 ( .A(address_mode), .B(address_match[1]), .C(n63), .Y(n62) );
  INVX1 U46 ( .A(n64), .Y(n138) );
  OAI21X1 U47 ( .A(n65), .B(n66), .C(n67), .Y(n56) );
  OR2X1 U48 ( .A(n54), .B(stop), .Y(n66) );
  INVX1 U49 ( .A(SDA_sync), .Y(n65) );
  NAND3X1 U50 ( .A(n68), .B(n69), .C(n70), .Y(n150) );
  AOI21X1 U51 ( .A(n139), .B(n52), .C(n71), .Y(n70) );
  OAI21X1 U52 ( .A(n23), .B(n72), .C(n73), .Y(n71) );
  NAND3X1 U53 ( .A(n74), .B(n75), .C(ack_done), .Y(n73) );
  INVX1 U54 ( .A(n76), .Y(n139) );
  NOR2X1 U55 ( .A(n42), .B(n77), .Y(n68) );
  INVX1 U56 ( .A(n26), .Y(n77) );
  OAI21X1 U57 ( .A(n34), .B(n33), .C(n78), .Y(n149) );
  OAI21X1 U58 ( .A(n79), .B(n80), .C(n37), .Y(n78) );
  OR2X1 U59 ( .A(n81), .B(n82), .Y(n80) );
  OAI21X1 U60 ( .A(n83), .B(n63), .C(n84), .Y(n79) );
  AOI21X1 U61 ( .A(address_match[0]), .B(n85), .C(n86), .Y(n84) );
  INVX1 U62 ( .A(n60), .Y(n85) );
  INVX1 U63 ( .A(address_match[1]), .Y(n83) );
  OR2X1 U64 ( .A(n87), .B(n88), .Y(n148) );
  OAI21X1 U65 ( .A(n34), .B(n89), .C(n90), .Y(n88) );
  INVX1 U66 ( .A(n81), .Y(n90) );
  OAI21X1 U67 ( .A(SDA_sync), .B(n54), .C(n91), .Y(n81) );
  AOI22X1 U68 ( .A(n92), .B(ack_check), .C(n93), .D(n52), .Y(n91) );
  NAND2X1 U69 ( .A(n54), .B(n64), .Y(n93) );
  NOR2X1 U70 ( .A(n35), .B(n94), .Y(n92) );
  AND2X1 U71 ( .A(n37), .B(n72), .Y(n34) );
  NAND2X1 U72 ( .A(n95), .B(n96), .Y(n72) );
  NOR2X1 U73 ( .A(n97), .B(n98), .Y(n96) );
  NAND3X1 U74 ( .A(n27), .B(n94), .C(n48), .Y(n98) );
  INVX1 U75 ( .A(n18), .Y(n27) );
  NAND3X1 U76 ( .A(n99), .B(n100), .C(n101), .Y(n97) );
  AND2X1 U77 ( .A(n63), .B(n60), .Y(n101) );
  NAND2X1 U78 ( .A(n102), .B(n31), .Y(n60) );
  NAND2X1 U79 ( .A(n31), .B(n103), .Y(n63) );
  INVX1 U80 ( .A(n104), .Y(n103) );
  INVX1 U81 ( .A(temp_sda_mode[0]), .Y(n100) );
  NAND3X1 U82 ( .A(n69), .B(n105), .C(n106), .Y(temp_sda_mode[0]) );
  NOR2X1 U83 ( .A(n107), .B(n108), .Y(n106) );
  NAND2X1 U84 ( .A(n25), .B(n67), .Y(n108) );
  INVX1 U85 ( .A(n45), .Y(n107) );
  INVX1 U86 ( .A(n137), .Y(n99) );
  NAND2X1 U87 ( .A(n53), .B(n26), .Y(n137) );
  NAND3X1 U88 ( .A(state[3]), .B(n35), .C(n102), .Y(n53) );
  NOR2X1 U89 ( .A(n109), .B(n110), .Y(n95) );
  NAND3X1 U90 ( .A(n111), .B(n112), .C(n54), .Y(n110) );
  NAND3X1 U91 ( .A(state[3]), .B(n35), .C(n113), .Y(n54) );
  INVX1 U92 ( .A(n86), .Y(n112) );
  NAND3X1 U93 ( .A(n76), .B(n64), .C(n114), .Y(n109) );
  NAND3X1 U94 ( .A(state[3]), .B(state[0]), .C(n113), .Y(n64) );
  NAND3X1 U95 ( .A(n31), .B(n30), .C(n20), .Y(n76) );
  NOR2X1 U96 ( .A(n33), .B(n23), .Y(n20) );
  NOR2X1 U97 ( .A(n115), .B(n116), .Y(n37) );
  OAI21X1 U98 ( .A(n48), .B(n117), .C(n118), .Y(n116) );
  OAI21X1 U99 ( .A(n18), .B(n82), .C(n119), .Y(n118) );
  NAND3X1 U100 ( .A(n45), .B(n26), .C(n69), .Y(n82) );
  NAND3X1 U101 ( .A(n120), .B(n35), .C(state[1]), .Y(n69) );
  NAND3X1 U102 ( .A(state[0]), .B(n120), .C(state[1]), .Y(n26) );
  NAND2X1 U103 ( .A(n31), .B(n113), .Y(n45) );
  INVX1 U104 ( .A(n121), .Y(n113) );
  NOR2X1 U105 ( .A(state[0]), .B(state[3]), .Y(n31) );
  NOR2X1 U106 ( .A(n15), .B(n104), .Y(n18) );
  OR2X1 U107 ( .A(state[0]), .B(start), .Y(n117) );
  OAI21X1 U108 ( .A(ack_done), .B(n105), .C(n122), .Y(n115) );
  AOI21X1 U109 ( .A(n123), .B(n52), .C(n124), .Y(n122) );
  AOI21X1 U110 ( .A(n58), .B(n25), .C(ack_prep), .Y(n124) );
  INVX1 U111 ( .A(n136), .Y(n25) );
  INVX1 U112 ( .A(n125), .Y(n58) );
  OAI21X1 U113 ( .A(n35), .B(n48), .C(n126), .Y(n125) );
  NOR2X1 U114 ( .A(n42), .B(n86), .Y(n126) );
  NOR2X1 U115 ( .A(n121), .B(n15), .Y(n86) );
  NAND3X1 U116 ( .A(n30), .B(n23), .C(state[2]), .Y(n121) );
  NOR2X1 U117 ( .A(n111), .B(stop), .Y(n42) );
  NAND3X1 U118 ( .A(n120), .B(n30), .C(state[0]), .Y(n111) );
  INVX1 U119 ( .A(n50), .Y(n120) );
  NAND3X1 U120 ( .A(n33), .B(n89), .C(state[4]), .Y(n50) );
  NAND3X1 U121 ( .A(n89), .B(n23), .C(n127), .Y(n48) );
  NOR2X1 U122 ( .A(state[2]), .B(state[1]), .Y(n127) );
  INVX1 U123 ( .A(stop), .Y(n52) );
  OAI21X1 U124 ( .A(ack_done), .B(n114), .C(n128), .Y(n123) );
  NAND3X1 U125 ( .A(state[0]), .B(n129), .C(n130), .Y(n128) );
  INVX1 U126 ( .A(ack_check), .Y(n129) );
  OAI21X1 U127 ( .A(n131), .B(n119), .C(n132), .Y(n87) );
  NOR2X1 U128 ( .A(temp_load_data), .B(n136), .Y(n132) );
  NOR2X1 U129 ( .A(n94), .B(state[0]), .Y(n136) );
  INVX1 U130 ( .A(n130), .Y(n94) );
  NOR2X1 U131 ( .A(n89), .B(n104), .Y(n130) );
  NAND3X1 U132 ( .A(n33), .B(n23), .C(state[1]), .Y(n104) );
  INVX1 U133 ( .A(state[3]), .Y(n89) );
  INVX1 U134 ( .A(n67), .Y(temp_load_data) );
  NAND3X1 U135 ( .A(state[0]), .B(n30), .C(n133), .Y(n67) );
  INVX1 U136 ( .A(n49), .Y(n133) );
  NAND3X1 U137 ( .A(n33), .B(n23), .C(state[3]), .Y(n49) );
  INVX1 U138 ( .A(state[2]), .Y(n33) );
  INVX1 U139 ( .A(state[1]), .Y(n30) );
  INVX1 U140 ( .A(ack_done), .Y(n119) );
  INVX1 U141 ( .A(n134), .Y(n131) );
  OAI21X1 U142 ( .A(n75), .B(n105), .C(n114), .Y(n134) );
  NAND3X1 U143 ( .A(state[3]), .B(state[0]), .C(n102), .Y(n114) );
  INVX1 U144 ( .A(n135), .Y(n102) );
  INVX1 U145 ( .A(n74), .Y(n105) );
  NOR2X1 U146 ( .A(n135), .B(n15), .Y(n74) );
  INVX1 U147 ( .A(n32), .Y(n15) );
  NOR2X1 U148 ( .A(n35), .B(state[3]), .Y(n32) );
  INVX1 U149 ( .A(state[0]), .Y(n35) );
  NAND3X1 U150 ( .A(state[1]), .B(n23), .C(state[2]), .Y(n135) );
  INVX1 U151 ( .A(state[4]), .Y(n23) );
  INVX1 U152 ( .A(rw_mode), .Y(n75) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [6:0] output_logic;

  DFFSR \output_logic_reg[0]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[0]) );
  DFFSR \output_logic_reg[1]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[1]) );
  DFFSR \output_logic_reg[2]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[2]) );
  DFFSR \output_logic_reg[3]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[3]) );
  DFFSR \output_logic_reg[4]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[4]) );
  DFFSR \output_logic_reg[5]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[5]) );
  DFFSR \output_logic_reg[6]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        output_logic[6]) );
  DFFSR \output_logic_reg[7]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  NAND2X1 U11 ( .A(n9), .B(n10), .Y(n35) );
  INVX1 U12 ( .A(n11), .Y(n10) );
  MUX2X1 U13 ( .B(parallel_in[0]), .A(output_logic[0]), .S(n12), .Y(n9) );
  OAI21X1 U14 ( .A(n13), .B(n14), .C(n15), .Y(n34) );
  AOI22X1 U15 ( .A(n11), .B(output_logic[0]), .C(output_logic[1]), .D(n12), 
        .Y(n15) );
  INVX1 U16 ( .A(parallel_in[1]), .Y(n14) );
  OAI21X1 U17 ( .A(n13), .B(n16), .C(n17), .Y(n33) );
  AOI22X1 U18 ( .A(output_logic[1]), .B(n11), .C(output_logic[2]), .D(n12), 
        .Y(n17) );
  INVX1 U19 ( .A(parallel_in[2]), .Y(n16) );
  OAI21X1 U20 ( .A(n13), .B(n18), .C(n19), .Y(n32) );
  AOI22X1 U21 ( .A(output_logic[2]), .B(n11), .C(output_logic[3]), .D(n12), 
        .Y(n19) );
  INVX1 U22 ( .A(parallel_in[3]), .Y(n18) );
  OAI21X1 U23 ( .A(n13), .B(n20), .C(n21), .Y(n31) );
  AOI22X1 U24 ( .A(output_logic[3]), .B(n11), .C(output_logic[4]), .D(n12), 
        .Y(n21) );
  INVX1 U25 ( .A(parallel_in[4]), .Y(n20) );
  OAI21X1 U26 ( .A(n13), .B(n22), .C(n23), .Y(n30) );
  AOI22X1 U27 ( .A(output_logic[4]), .B(n11), .C(output_logic[5]), .D(n12), 
        .Y(n23) );
  INVX1 U28 ( .A(parallel_in[5]), .Y(n22) );
  OAI21X1 U29 ( .A(n13), .B(n24), .C(n25), .Y(n29) );
  AOI22X1 U30 ( .A(output_logic[5]), .B(n11), .C(output_logic[6]), .D(n12), 
        .Y(n25) );
  INVX1 U31 ( .A(parallel_in[6]), .Y(n24) );
  OAI21X1 U32 ( .A(n13), .B(n26), .C(n27), .Y(n28) );
  AOI22X1 U33 ( .A(output_logic[6]), .B(n11), .C(serial_out), .D(n12), .Y(n27)
         );
  NOR2X1 U34 ( .A(n12), .B(load_enable), .Y(n11) );
  NOR2X1 U35 ( .A(shift_enable), .B(load_enable), .Y(n12) );
  INVX1 U36 ( .A(parallel_in[7]), .Y(n26) );
  INVX1 U37 ( .A(load_enable), .Y(n13) );
endmodule


module pts_sr_tx ( clk, n_rst, falling_edge, tx_enable, load_data, tx_data, 
        tx_out );
  input [7:0] tx_data;
  input clk, n_rst, falling_edge, tx_enable, load_data;
  output tx_out;
  wire   _0_net_;

  flex_pts_sr_NUM_BITS8_SHIFT_MSB1 PTS_SR_TX ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .load_enable(load_data), .parallel_in(tx_data), 
        .serial_out(tx_out) );
  AND2X1 U1 ( .A(tx_enable), .B(falling_edge), .Y(_0_net_) );
endmodule


module sda_select ( sda_mode, tx_out, SDA_out_slave );
  input [1:0] sda_mode;
  input tx_out;
  output SDA_out_slave;
  wire   n1;

  NAND2X1 U3 ( .A(sda_mode[0]), .B(n1), .Y(SDA_out_slave) );
  NAND2X1 U4 ( .A(tx_out), .B(sda_mode[1]), .Y(n1) );
endmodule


module slave_inner ( clk, n_rst, tx_data, address_mode, ms_select, bus_address, 
        en_clock_strech, TX_fifo_empty, RX_fifo_full, RX_fifo_almost_full, 
        SDA_sync, SCL_sync, rx_data_slave, set_transaction_complete_slave, 
        ack_error_set_slave, busy_slave, TX_read_enable_slave, 
        RX_write_enable_slave, SDA_out_slave, SCL_out_slave );
  input [7:0] tx_data;
  input [9:0] bus_address;
  output [7:0] rx_data_slave;
  input clk, n_rst, address_mode, ms_select, en_clock_strech, TX_fifo_empty,
         RX_fifo_full, RX_fifo_almost_full, SDA_sync, SCL_sync;
  output set_transaction_complete_slave, ack_error_set_slave, busy_slave,
         TX_read_enable_slave, RX_write_enable_slave, SDA_out_slave,
         SCL_out_slave;
  wire   rising_edge, falling_edge, rx_enable, rw_mode, start, byte_received,
         ack_prep, ack_check, ack_done, load_data, tx_enable, tx_out;
  wire   [1:0] address_match;
  wire   [1:0] sda_mode;
  assign SCL_out_slave = 1'b0;

  edge_detect EDGE_DETECTOR ( .clk(clk), .n_rst(n_rst), .SCL_sync(SCL_sync), 
        .rising_edge(rising_edge), .falling_edge(falling_edge) );
  stp_sr_rx STP_SR_RX ( .clk(clk), .n_rst(n_rst), .SDA_sync(SDA_sync), 
        .rising_edge(rising_edge), .rx_enable(rx_enable), .rx_data(
        rx_data_slave) );
  checker_block CHECKER_BLOCK ( .clk(clk), .n_rst(n_rst), .SDA_sync(SDA_sync), 
        .SCL_sync(SCL_sync), .rx_data(rx_data_slave), .bus_address(bus_address), .address_mode(address_mode), .rw_mode(rw_mode), .address_match(address_match), .start(start), .stop(set_transaction_complete_slave) );
  slave_timer TIMER ( .clk(clk), .n_rst(n_rst), .start(start), .stop(
        set_transaction_complete_slave), .rising_edge(rising_edge), 
        .falling_edge(falling_edge), .byte_received(byte_received), .ack_prep(
        ack_prep), .ack_check(ack_check), .ack_done(ack_done) );
  slave_controller CONTROLLER ( .clk(clk), .n_rst(n_rst), .start(start), 
        .stop(set_transaction_complete_slave), .address_match(address_match), 
        .rw_mode(rw_mode), .SDA_sync(SDA_sync), .address_mode(address_mode), 
        .TX_fifo_empty(TX_fifo_empty), .RX_fifo_full(RX_fifo_full), 
        .en_clock_strech(en_clock_strech), .RX_fifo_almost_full(
        RX_fifo_almost_full), .byte_received(byte_received), .ack_prep(
        ack_prep), .ack_check(ack_check), .ack_done(ack_done), .rx_enable(
        rx_enable), .busy_slave(busy_slave), .TX_read_enable_slave(
        TX_read_enable_slave), .RX_write_enable_slave(RX_write_enable_slave), 
        .ack_error_set_slave(ack_error_set_slave), .sda_mode(sda_mode), 
        .load_data(load_data), .tx_enable(tx_enable) );
  pts_sr_tx PTS_SR_TX ( .clk(clk), .n_rst(n_rst), .falling_edge(falling_edge), 
        .tx_enable(tx_enable), .load_data(load_data), .tx_data(tx_data), 
        .tx_out(tx_out) );
  sda_select SDA_SECLECT ( .sda_mode(sda_mode), .tx_out(tx_out), 
        .SDA_out_slave(SDA_out_slave) );
endmodule

