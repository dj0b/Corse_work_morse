
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

vlog  input_ROM.v output_ROM.v output_ROM_tb.v

# Open testbench module for simulation

vsim -novopt work.output_ROM_tb

# Add all testbench signals to waveform diagram

add wave /output_ROM_tb/i_clk
add wave /output_ROM_tb/i_cs
add wave -radix unsigned /output_ROM_tb/i_adr
add wave -radix ASCII /output_ROM_tb/o_data_input
add wave -radix ASCII /output_ROM_tb/i_data_output

onbreak resume

# Run simulation
run -all

wave zoom full