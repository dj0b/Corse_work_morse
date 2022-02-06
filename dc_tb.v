

`timescale 1ns / 1ps

module dc_tb;

parameter PERIOD = 20;

reg  i_clk, i_cs;
reg [16:0] i_adr;
wire [7:0] o_data;

wire [23:0] o_y_cd;

wire [7:0] o_y_dc;

input_ROM rom_inst(.clk(i_clk), .cs(i_cs), .adr(i_adr), .data(o_data));
cd cd_inst(.clk(i_clk), .x(o_data), .y(o_y_cd));
dc dc_inst(.clk(i_clk), .x(o_y_cd), .y(o_y_dc));


initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
    i_adr = 0;
    forever @(posedge i_clk) if(i_cs) i_adr = i_adr + 1'b1;
end

initial begin
	i_adr = 8'd0;
   	i_cs = 1'b0;
   	@(negedge i_clk) i_cs = 1'b1;
	
	repeat (52) @(negedge i_clk);
	
     $finish;  
end

endmodule
