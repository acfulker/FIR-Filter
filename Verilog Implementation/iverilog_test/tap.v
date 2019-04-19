module tap(
	input i_clk,
	input wire [2:0] i_dff,
	input wire [2:0] coeff,
	input wire [9:0] i_sum,
	output reg [2:0] o_dff,
	output wire[9:0] o_sum
);

reg [5:0] product;

always@(posedge i_clk)
begin
	o_dff <= i_dff;
	product <= i_dff * coeff;
end

assign o_sum = i_sum + product;

endmodule 