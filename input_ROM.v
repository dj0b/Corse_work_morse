module input_ROM(clk, cs, adr, data);

input           clk;
input		cs;
input [15:0]	adr;
output  [7:0]   data;

reg     [7:0]   i_rom[4095:0];
reg	[7:0]	ascii;

wire    sys_clk = clk;
wire    sys_cs  = cs;

assign  data = ascii;   

initial $readmemh("inh.txt", i_rom);

always @(posedge sys_clk, negedge sys_cs) begin
    if(~sys_cs) begin
        ascii <= 8'hz;
    end else begin
        ascii <= i_rom[adr];
    end
end

endmodule
