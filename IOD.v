
module IOD(clk1, clk2, rst, DW, ENW, DR, ENR, in, out);

input clk1, clk2, rst, ENW, ENR, in;
input [23:0] DW;
output out;
output reg [23:0] DR;


reg     [23:0]   shift_reg_in;
reg     [23:0]   shift_reg_out;
assign out = shift_reg_out[23];
                                        
always @(posedge clk2, negedge rst)begin

    if (~rst) begin
        shift_reg_out <= 0;
    end else begin
        shift_reg_out <= DW;
    end
    
end

always @(posedge clk1, negedge ENW)begin

    if (~ENW) begin
        shift_reg_out <= 0;
    end else begin
        shift_reg_out <= {shift_reg_out[22:0], shift_reg_out[23]};
    end
end 

always @(posedge clk2, negedge rst)begin

    if (~rst) begin
        shift_reg_in <= 0;
    end else begin
        DR <= shift_reg_in;
    end
    
end

always @(posedge clk1, negedge ENW)begin

    if (~ENW) begin
        shift_reg_in <= 0;
    end else begin
        shift_reg_in <= {shift_reg_in[22:0], in};
    end
end

   
endmodule







