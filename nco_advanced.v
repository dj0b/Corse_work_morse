
module nco_advanced(clk_in, rst, clk_out1, clk_out2);

input   clk_in;
input   rst;
output  clk_out1; //main clk
output  clk_out2; //clk for adr

wire    sys_clk     = clk_in;
wire    sys_rst_n   = rst;

//NCO param
parameter N = 32;
parameter K = 3.5; //pametr of devide clk from generator to main clk

reg     [N-1:0]  phase;
reg     [N-1:0]  phase_step;
reg     [N-1:0]  phase_step_in;

assign  clk_out1 = phase[N-1]; 
//NCO param

//devide main clk for adr
parameter       DIV_BY      = 24;
localparam      CNT_CONST   = DIV_BY - 1;
localparam      CNT         = $clog2(DIV_BY);

reg     [CNT-1:0] cnt;

wire    preload_cnt = ~|cnt;

assign clk_out2 = preload_cnt;

always @(posedge clk_out1, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        cnt <= CNT_CONST;
    end else begin
        if (preload_cnt)
            cnt <= CNT_CONST;
        else
            cnt <= cnt - 1'b1;
    end
end
//devide main clk for IOD

//NCO


always @(posedge sys_clk, negedge sys_rst_n) begin
	phase_step_in = 33'd4294967296 / K;
end


always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        phase_step <= 0;
    end else begin
        phase_step <= phase_step_in;   //for simplicity here we dont use synchronization
    end
end

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        phase <= 0;
    end else begin
        phase <= phase + phase_step;
    end
end
//NCO
endmodule
