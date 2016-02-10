onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_sensor_s/NUM_TEST_CASES
add wave -noupdate /tb_sensor_s/MAX_TEST_VAL
add wave -noupdate /tb_sensor_s/test_number
add wave -noupdate /tb_sensor_s/tmp_input
add wave -noupdate /tb_sensor_s/expected_output
add wave -noupdate /tb_sensor_s/test_input
add wave -noupdate /tb_sensor_s/test_output
add wave -noupdate /tb_sensor_s/test_number
add wave -noupdate /tb_sensor_s/tmp_input
add wave -noupdate /tb_sensor_s/expected_output
add wave -noupdate /tb_sensor_s/test_input
add wave -noupdate /tb_sensor_s/test_output
add wave -noupdate /tb_sensor_s/test_number
add wave -noupdate /tb_sensor_s/tmp_input
add wave -noupdate /tb_sensor_s/expected_output
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61279 ps} 0}
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
WaveRestoreZoom {0 ps} {210 ns}
