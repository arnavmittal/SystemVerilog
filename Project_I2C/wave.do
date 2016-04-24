onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_slave_inner/tb_clk
add wave -noupdate -radix binary /tb_slave_inner/tb_bus_address
add wave -noupdate /tb_slave_inner/tb_SDA_sync
add wave -noupdate /tb_slave_inner/tb_SCL_sync
add wave -noupdate -radix decimal /tb_slave_inner/i
add wave -noupdate -radix decimal /tb_slave_inner/k
add wave -noupdate -radix binary /tb_slave_inner/tb_rx_data_slave
add wave -noupdate /tb_slave_inner/SLAVE_INNER/start
add wave -noupdate /tb_slave_inner/SLAVE_INNER/stop
add wave -noupdate /tb_slave_inner/tb_SDA_out_slave
add wave -noupdate /tb_slave_inner/tb_SCL_sync_out_slave
add wave -noupdate /tb_slave_inner/SLAVE_INNER/CONTROLLER/state
add wave -noupdate -radix binary /tb_slave_inner/SLAVE_INNER/CONTROLLER/address_match
add wave -noupdate /tb_slave_inner/tb_address_mode
add wave -noupdate /tb_slave_inner/SLAVE_INNER/CONTROLLER/ack_prep
add wave -noupdate /tb_slave_inner/SLAVE_INNER/CONTROLLER/ack_check
add wave -noupdate /tb_slave_inner/SLAVE_INNER/CONTROLLER/ack_done
add wave -noupdate /tb_slave_inner/SLAVE_INNER/TIMER/state
add wave -noupdate /tb_slave_inner/tb_RX_write_enable_slave
add wave -noupdate /tb_slave_inner/tb_TX_read_enable_slave
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14766412 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21 us}
