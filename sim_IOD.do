

###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library

vlib work

# Compile all the Verilog sources in current folder into working library

vlog  cd.v input_ROM.v nco_advanced.v IOD.v IOD_test.v 

# Open testbench module for simulation

vsim -novopt work.IOD_tb

# Add all testbench signals to waveform diagram

add wave /IOD_tb/o_clk1
add wave /IOD_tb/o_clk2
add wave /IOD_tb/o_out
add wave /IOD_tb/o_r
add wave -radix unsigned /IOD_tb/i_adr
add wave -radix ASCII /IOD_tb/o_data
add wave -radix hexadecimal /IOD_tb/o_data
add wave -radix binary /IOD_tb/o_y
 

onbreak resume

# Run simulation
run -all

wave zoom full