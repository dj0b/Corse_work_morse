
module output_ROM(clk, cs, adr, data);

input           clk;
input		cs;
input [16:0]	adr;
input  [7:0]   data;

reg     [7:0]   o_rom[4095:0];

wire    sys_clk = clk;
wire    sys_cs  = cs;   

always @(posedge sys_clk, negedge sys_cs) begin
        o_rom[adr] <= data;
end

endmodule
