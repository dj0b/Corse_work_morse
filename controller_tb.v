
`timescale 1ns / 1ps

module controller_tb;

parameter T_dot = 1000;//ns
parameter PERIOD = 20;//clk from generator
parameter K = T_dot/PERIOD;

reg  i_clk, i_rst;

wire o_clk1, o_clk2;

wire o_cst;
wire [15:0] o_adrT;
wire [7:0] data_t;

wire [23:0] o_ycd;

wire o_ENW, o_ENR, o_out; 

wire [23:0] o_xdc;

wire o_csr;
wire [15:0] o_adrR;
wire [7:0] data_r;


reg     [7:0]  rom[4095:0];

controller ctrl_inst(.in_clk(i_clk), .rst(i_rst), .DT(data_t), .cst(o_cst), .adrT(o_adrT), .DR(data_r), .csr(o_csr), .adrR(o_adrR), .ENW(o_ENW), .clk1(o_clk1), .clk2(o_clk2), .ENR(o_ENR));

input_ROM rom_inst(.clk(o_clk2), .cs(o_cst), .adr(o_adrT), .data(data_t));

cd cd_inst(.clk(o_clk2), .x(data_t), .y(o_ycd));

IOD iod_inst(.clk1(o_clk1), .clk2(o_clk2), .rst(i_rst), .DW(o_ycd), .ENW(o_ENW), .DR(o_xdc), .ENR(o_ENR), .in(o_out), .out(o_out));

dc dc_inst(.clk(o_clk2), .x(o_xdc), .y(data_r));

output_ROM rom_out_inst(.clk(o_clk2), .cs(o_csr), .adr(o_adrR), .data(data_r));

initial begin
    forever #(PERIOD) if(o_csr) begin
	rom[o_adrR] = data_r;
	end
end

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end


initial begin
   	i_rst = 1'b0;
   	@(negedge i_clk) i_rst = 1'b1; 

    	repeat (50) @(negedge o_clk2);
	$writememh("outh.txt", rom);
    	$finish;  
end
  
endmodule
