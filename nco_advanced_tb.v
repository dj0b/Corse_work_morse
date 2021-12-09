
`timescale 1ns / 1ps

module nco_advanced_tb;

parameter T_dot = 1000;//ns

parameter PERIOD = 20;//clk from generator
parameter K = T_dot/PERIOD;

reg  i_clk, i_rst;
wire o_clk1, o_clk2;


nco_advanced #(.K(K))  gen_inst(.clk_in(i_clk), .rst(i_rst), .clk_out1(o_clk1), .clk_out2(o_clk2));

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin

   	i_rst = 1'b0;
   	@(negedge i_clk) i_rst = 1'b1;
	
	#30000 $display("simulation end");
     $finish;  
end

endmodule