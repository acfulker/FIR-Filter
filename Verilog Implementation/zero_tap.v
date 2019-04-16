module zero_tap(
	input i_clk,
	input wire [2:0] i_dff,
	input wire [9:0] i_sum,
	output reg [2:0] o_dff,
	output wire[9:0] o_sum
);


always@(posedge i_clk)
begin
	o_dff <= i_dff;
end

assign o_sum = i_sum;
endmodule 