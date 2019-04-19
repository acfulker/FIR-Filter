module fir_filter(
	input wire i_clk,
	input wire [2:0] signal,
	output wire [9:0] result
);


parameter integer n_taps = 8;

//wire [2:0] signal; // Incoming signal from outside source (signal_generator)
wire [9:0] tap_sums [n_taps-1:0]; // Interconnecting wires that attach the sums
wire [2:0] tap_dff  [n_taps-1:0]; // Interconnecting wires to create delay line

// Bank of registers that hold the coefficients
reg  [2:0] coeffs [n_taps-1:0];

initial begin

coeffs[0] = 3'd0;
coeffs[1] = 3'd1;
coeffs[2] = 3'd2;
coeffs[3] = 3'd3;
coeffs[4] = 3'd4;
coeffs[5] = 3'd5;
coeffs[6] = 3'd6;
coeffs[7] = 3'd7;

end

/* 
Generates n_taps and interconnects the outputs of one to the output of
another.
*/

genvar ii;
generate
	for (ii=0; ii<n_taps; ii=ii+1) begin : FIR_filter
		if (ii == 0) begin
			tap u_tap(
				.i_clk(i_clk),
				.coeff(coeffs[ii]),
				.i_sum(10'd0),
				.i_dff(signal),
				.o_dff(tap_dff[ii]),
				.o_sum(tap_sums[ii])
			);
		end 
		else begin
			tap u_tap(
				.i_clk(i_clk),
				.coeff(coeffs[ii]),
				.i_sum(tap_sums[ii-1]),
				.i_dff(tap_dff[ii-1]),
				.o_dff(tap_dff[ii]),
				.o_sum(tap_sums[ii])
			);
		end
	end
endgenerate

// Assign the last element of the summation to the output "y[n]"
 
assign result = tap_sums[n_taps-1];

endmodule 