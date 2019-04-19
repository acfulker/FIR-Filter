`timescale 1ns / 1ns
module testbench_filter;	
	reg clk;
	reg [2:0] sample;
	wire [9:0] result;
	
	fir_filter DUT (
		.i_clk(clk),
		.signal(sample),
		.result(result)
	);

	initial begin
		clk = 0;
	end 
	
	always
		#10 clk = !clk; // Every 10ns invert the clk
	
	initial begin

		sample = 3'd0;
		#170;

		sample = 3'd6;
		#20
		
		sample = 3'd4;
		#20;
		
		sample = 3'd1;
		#20
		
		sample = 3'd5;
		#20
		
		sample = 3'd2;
		#20
		
		sample = 3'd5;
		#20
		
		sample = 3'd1;
		#20
		
		sample = 3'd0;
		#20
		
		sample = 3'd7;
		#20
		
		sample = 3'd2;
		#20
		
		sample = 3'd2;
		#20
		
		sample = 3'd0;
		#20
		
		#100;
		$finish;
	end
	
endmodule 