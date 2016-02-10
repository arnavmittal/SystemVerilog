# Step 1:  Read in the source file
analyze -format sverilog -lib WORK { mealy.sv}
elaborate mealy -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/mealy.rep
report_area >> reports/mealy.rep
report_power -hier >> reports/mealy.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/mealy.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
