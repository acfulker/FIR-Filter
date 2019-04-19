module fir_filter(
	input wire i_CLK,
	input wire [2:0] x_n,
	output reg [8:0] y_n
);

// Filter coefficients stored into a block of memory
reg [2:0] coeffs [2:0];
coeffs[0] = 3'b4;
coeffs[1] = 3'b1;
coeffs[2] = 3'b2;


// Holds all of the values that the shift registerse pass from one to another
reg[2:0] inner_conn [2:0];
inner_conn[0] = x_n;

// Holds the sum of each tap
reg[8:0] sums [2:0];
sums[0] = 0;
y_n = sums[2];


// Use the generate feature to instantiate alot of taps interconnected to each other
genvar i;
generate

for (i=0; i<3; i=i+1) begin : Filter
	tap u_tap(
		.i_CLK(i_CLK),
		.i_coeff(coeff[i])
		.i_tap_dff(inner_conn[i]),
		.o_tap_dff(inner_conn[i+1]),
		.i_tap_sum(sums[i]),
		.o_tap_sum(sums[i+1])
	);
end

endgenerate

endmodule