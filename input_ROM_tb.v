
`timescale 1ns / 1ps

module input_ROM_tb;

parameter PERIOD = 20;

reg  i_clk, i_cs;
reg [16:0] i_adr;
wire [7:0] o_data;


input_ROM rom_inst(.clk(i_clk), .cs(i_cs), .adr(i_adr), .data(o_data));

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
	i_adr = 8'd0;
   	i_cs = 1'b0;
   	#100 i_cs = 1'b1;

	#50 i_adr = 8'd1;
	#50 i_adr = 8'd2;
	#50 i_adr = 8'd3;
	#50 i_adr = 8'd4;
	#50 i_adr = 8'd5;
	#50 i_adr = 8'd6;
	#50 i_adr = 8'd7;
	#50 i_adr = 8'd8;
	#50 i_adr = 8'd9;
	#50 i_adr = 8'd10;
	#50 i_adr = 8'd11;
	#50 i_adr = 8'd12;
	#50 i_adr = 8'd13;
	#50 i_adr = 8'd14;
	#50 i_adr = 8'd15;
	#50 i_adr = 8'd16;
	#50 i_adr = 8'd17;

	
	#100 $display("simulation end");
     $finish;  
end

endmodule
