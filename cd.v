
module cd(clk, en, x, y);
input clk, en;
input [7:0] x;
output reg [23:0] y;

wire sys_clk = clk;
wire sys_en = en;

always @(negedge sys_clk, negedge sys_en) begin
if(~sys_en)begin
	y = 24'b0;
end else begin

case(x) 
8'h41	:	y=	24'b	0101110	;
8'h42	:	y=	24'b	01110101010	;
8'h43	:	y=	24'b	0111010111010	;
8'h44	:	y=	24'b	011101010	;
8'h45	:	y=	24'b	010	;
8'h46	:	y=	24'b	01010111010	;
8'h47	:	y=	24'b	01110111010	;
8'h48	:	y=	24'b	010101010	;
8'h49	:	y=	24'b	01010	;
8'h4A	:	y=	24'b	010111011101110	;
8'h4B	:	y=	24'b	01110101110	;
8'h4C	:	y=	24'b	0101110101	;
8'h4D	:	y=	24'b	011101110	;
8'h4E	:	y=	24'b	0111010	;
8'h4F	:	y=	24'b	0111011101110	;
8'h50	:	y=	24'b	010111011101	;
8'h51	:	y=	24'b	011101110101110	;
8'h52	:	y=	24'b	010111010	;
8'h53	:	y=	24'b	0101010	;
8'h54	:	y=	24'b	01110	;
8'h55	:	y=	24'b	010101110	;
8'h56	:	y=	24'b	01010101110	;
8'h57	:	y=	24'b	01011101110	;
8'h58	:	y=	24'b	0111010101110	;
8'h59	:	y=	24'b	011101011101110	;
8'h5A	:	y=	24'b	0111011101010	;

8'h31	:	y=	24'b	0101110111011101110	;
8'h32	:	y=	24'b	01010111011101110	;
8'h33	:	y=	24'b	010101011101110	;
8'h34	:	y=	24'b	0101010101110	;
8'h35	:	y=	24'b	01010101010	;
8'h36	:	y=	24'b	0111010101010	;
8'h37	:	y=	24'b	011101110101010	;
8'h38	:	y=	24'b	01110111011101010	;
8'h39	:	y=	24'b	0111011101110111010	;
8'h30	:	y=	24'b	011101110111011101110	;
8'h2E	:	y=	24'b	0101010101010	;
8'h2C	:	y=	24'b	0101110101110101110	;
8'h3A	:	y=	24'b	011101110111010101	;
8'h3B	:	y=	24'b	0111010111010111010	;
8'h28	:	y=	24'b	011101011101110101110	;
8'h27	:	y=	24'b	010111011101110111010	;
8'h22	:	y=	24'b	01011101010111010	;
8'h2D	:	y=	24'b	01110101010101110	;
8'h2F	:	y=	24'b	011101010111010	;
8'h5F	:	y=	24'b	0101011101110101110	;
8'h3F	:	y=	24'b	0101011101110101	;
8'h21	:	y=	24'b	01110111010101110111	;
8'h2B	:	y=	24'b	010111010111010	;

8'h40	:	y=	24'b	0101110111010111010	;
8'hFF	:	y=	24'b	010101110101110	;
8'h20	:	y=	24'b	0	;


default y=24'b0;

endcase

end

end

endmodule