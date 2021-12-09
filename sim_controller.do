

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

vlog  nco_advanced.v input_ROM.v cd.v IOD.v dc.v output_ROM.v controller_tb.v

# Open testbench module for simulation

vsim -novopt work.controller_tb

# Add all testbench signals to waveform diagram

add wave /controller_tb/o_clk1
add wave /controller_tb/o_clk2
add wave /controller_tb/o_out
add wave -radix unsigned /controller_tb/i_adr
add wave -radix ASCII /controller_tb/o_data
 

onbreak resume

# Run simulation
run -all

wave zoom full
