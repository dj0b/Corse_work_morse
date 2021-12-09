

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

vlog  cd.v dc.v input_ROM.v dc_tb.v

# Open testbench module for simulation

vsim -novopt work.dc_tb

# Add all testbench signals to waveform diagram

add wave /dc_tb/i_clk
add wave /dc_tb/i_cs
add wave /dc_tb/i_en_cd
add wave /dc_tb/i_en_dc
add wave -radix unsigned /dc_tb/i_adr
add wave -radix ASCII /dc_tb/o_data
add wave -radix hexadecimal /dc_tb/o_data
add wave -radix binary /dc_tb/o_y_cd
add wave -radix hexadecimal /dc_tb/o_y_dc
add wave -radix ASCII /dc_tb/o_y_dc


onbreak resume

# Run simulation
run -all

wave zoom full