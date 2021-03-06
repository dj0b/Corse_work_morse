
`timescale 1ns / 1ps

module controller_tb;

parameter T_dot = 1000;//ns
parameter PERIOD = 20;//clk from generator
parameter K = T_dot/PERIOD;

reg  i_clk, i_rst, i_en;
wire o_clk1, o_clk2;

wire i_in, o_out;

reg [15:0] i_adr;
wire [7:0] o_data;

wire [23:0] o_y;

wire [23:0] o_r;

wire [7:0] i_data;

reg     [7:0]  rom[4095:0];

nco_advanced #(.K(K))  gen_inst(.clk_in(i_clk), .rst(i_rst), .clk_out1(o_clk1), .clk_out2(o_clk2));


input_ROM rom_inst(.clk(o_clk1), .cs(i_en), .adr(i_adr), .data(o_data));

cd cd_inst(.clk(o_clk1), .en(i_en), .x(o_data), .y(o_y));

IOD iod_inst(.clk1(o_clk1), .clk2(o_clk2), .rst(i_rst), .DW(o_y), .ENW(i_en), .DR(o_r), .ENR(i_en), .in(o_out), .out(o_out));

dc dc_inst(.clk(o_clk1), .en(i_en), .x(o_r), .y(i_data));

output_ROM rom_out_inst(.clk(o_clk1), .cs(i_en), .adr(i_adr), .data(i_data));

initial begin
    forever #(PERIOD) if(i_en) begin
	rom[i_adr] = i_data;
	end
end

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
    i_adr = 0;
    forever @(posedge o_clk2) if(i_en) i_adr = i_adr + 1'b1;
end

initial begin
	i_adr = 8'd0;
   	i_rst = 1'b0;
   	i_en = 1'b0;
   	@(negedge i_clk) begin i_en = 1'b1; i_rst = 1'b1; end

    	repeat (55) @(negedge o_clk2);
	$writememh("outh.txt", rom);
    	$finish;  
end
  
endmodule