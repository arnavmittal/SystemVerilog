# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {slave_controller.sv flex_pts_sr.sv flex_stp_sr.sv pts_sr_tx.sv stp_sr_rx.sv sda_select.sv edge_detect.sv slave_timer.sv checker_block.sv slave_inner.sv}
elaborate slave_inner -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/slave_inner.rep
report_area >> reports/slave_inner.rep
report_power -hier >> reports/slave_inner.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/slave_inner.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
