module top(
	input wire CLOCK_50,
	output wire [9:0] result
//	input wire trigger
);

//reg [1:0] coeffs [2:0];
reg [2:0] coeffs0 = 3'd3;
reg [2:0] coeffs1 = 3'd2;

wire [2:0] buffer;
wire [9:0] tap_sums;
wire [2:0] tap_dff;


Signal_Generator sig_gen(
	.CLOCK_50(CLOCK_50),
	.signal(buffer)
);

tap tap_1 (
		.i_clk(CLOCK_50),
		.coeff(coeffs0),
		.i_sum(10'd0),
		.i_dff(buffer),
		.o_dff(tap_dff),
		.o_sum(tap_sums)
);

tap tap_2 (
		.i_clk(CLOCK_50),
		.coeff(coeffs1),
		.i_sum(tap_sums),
		.i_dff(tap_dff),
		.o_sum(result)
);

endmodule