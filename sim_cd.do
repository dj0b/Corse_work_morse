
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

vlog  cd.v input_ROM.v cd_tb.v

# Open testbench module for simulation

vsim -novopt work.cd_tb

# Add all testbench signals to waveform diagram

add wave /cd_tb/i_clk
add wave /cd_tb/i_cs
add wave /cd_tb/i_en
add wave -radix unsigned /cd_tb/i_adr
add wave -radix ASCII /cd_tb/o_data
add wave -radix hexadecimal /cd_tb/o_data
add wave -radix binary /cd_tb/o_y

onbreak resume

# Run simulation
run -all

wave zoom full