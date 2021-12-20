module controller(in_clk, rst, DT, cst, adrT, DR, csr, adrR, ENW, clk1, clk2, ENR);

input in_clk, rst;
input [7:0] DT;		//control signal for stop
input [7:0] DR;
output reg [15:0] adrT = 0;
output reg [15:0] adrR = 0;
output reg cst, csr, ENW, ENR;	//activ high 
output wire clk1, clk2;  //clk1 - for shiftreg in IOD, clk2 - for other


parameter PERIOD = 20;//clk from generator
parameter T_dot = 1000;//ns
parameter K = T_dot/PERIOD;


nco_advanced #(.K(K))  gen_inst(.clk_in(in_clk), .rst(rst), .clk_out1(clk1), .clk_out2(clk2));

always @(posedge rst) begin
	cst = 1'b1;
	ENW = 1'b1;
	csr = 1'b1;
	ENR = 1'b1; 
end

always @(posedge clk2) begin
	if(DT == 8'hff) begin cst = 0; ENW = 0;	end 
end

always @(posedge clk2) begin
	if(cst) adrT = adrT + 1'b1;
end

always @(posedge clk2) begin
	if(DR == 8'hff) begin csr = 0; ENR = 0; end
end

always @(posedge clk2) begin
	if(csr) adrR = adrR + 1'b1;
end














endmodule
