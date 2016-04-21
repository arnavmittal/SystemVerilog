`timescale 1ns / 10ps

module tb_checker_block();
  
  // Define parameters
  parameter CLK_PERIOD        = 10;
  parameter SCL_PERIOD    = 300;
  parameter sclwait       = 300;
  
  reg tb_clk;
  reg tb_n_rst;
  reg tb_SDA_sync;
  reg tb_SCL_sync;
  reg [7:0] tb_rx_data;
  reg [9:0] tb_bus_address;
  reg tb_address_mode;
  reg tb_rw_mode;
  reg [1:0] tb_address_match;
  reg tb_start;
  reg tb_stop;
  
  checker_block DUT
  (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .SDA_sync(tb_SDA_sync),
    .SCL_sync(tb_SCL_sync),
    .rx_data(tb_rx_data),
    .bus_address(tb_bus_address),
    .address_mode(tb_address_mode),
    .rw_mode(tb_rw_mode),
    .address_match(tb_address_match),
    .start(tb_start),
    .stop(tb_stop)
  );
  
  always
  begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end
  
  always
  begin : SCL_GEN
      tb_SCL_sync = 1'b0;
      #(SCL_PERIOD / 3);
      tb_SCL_sync = 1'b1;
      #(SCL_PERIOD / 3); 
      tb_SCL_sync = 1'b0;
      #(SCL_PERIOD / 3);
  end 
  
  initial
  begin 
    tb_n_rst = 1'b0;
    tb_rx_data = 8'b00000000;
    tb_bus_address = 10'b0000000000;
    tb_address_mode = 1'b0;
    #1;
    tb_SDA_sync = 1'b1;
    tb_n_rst = 1'b1;
    #120;
    //test start found
    tb_SDA_sync = 1'b0;
    
    #30;
    tb_SDA_sync = 1'b1;
    
    #40;
    tb_rx_data = 8'b10111011;

    #120;
    tb_bus_address = 10'b0011011101;

    #200;
    tb_address_mode = 1'b1;
    tb_bus_address = 10'b1011001001;
    #30;
    tb_rx_data = 8'b11110101; // A9-A8 = 10
    #180;
    tb_rx_data = 8'b11001001; // A7-A0
    #150;

  end 
endmodule