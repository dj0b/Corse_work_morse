
`timescale 1ns / 1ps

module output_ROM_tb;

parameter PERIOD = 20;

reg  i_clk, i_cs;
reg [16:0] i_adr;
wire [7:0] o_data_input;

reg [7:0] i_data_output;

input_ROM rom_in_inst(.clk(i_clk), .cs(i_cs), .adr(i_adr), .data(o_data_input));
output_ROM rom_out_inst(.clk(i_clk), .cs(i_cs), .adr(i_adr), .data(i_data_output));

reg     [7:0]  rom[4095:0];

initial begin
    forever #(PERIOD) if(i_cs) begin
	i_data_output = o_data_input;
	rom[i_adr] = i_data_output;
	end
end

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
    i_adr = 0;
    forever #(PERIOD) if(i_cs) i_adr = i_adr + 1'b1;
end

initial begin
	i_adr = 0;
   	i_cs = 1'b0;
   	@(negedge i_clk) i_cs = 1'b1;
	repeat (50) @(negedge i_clk);
	$writememh("outh.txt", rom);
	$finish;
end



endmodule
