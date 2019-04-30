sW=10-1 #Width of sum
dW=3-1 #Width of signal
cW=3-1 #Width of coeffs
zThresh=10#zero threshold



#Loop over coefficients
i=0
with open("filter.v", "w+") as f:

	f.write('module fir_filter(')
	f.write('	input wire i_clk,')
	f.write('	input wire [' + str(dW) + ':0] signal,')
	f.write('	output wire [' + str(sW) + ':0] result')
	f.write(');')
	f.write('')
	with open("coeffs.csv", "r") as coeffs:
		for c in f:
			c=int(c.rstrip(",\n"))
			
			t=1
			#decide type, t
			#set c
			# if(c<=zThresh):
			# 	t=0
			# #elif():#power of 2 condition
				
			# #	t=1
			# else:
			# 	t=2
			
			
			if(t=0):#zero
				f.write('zero_tap tap' + str(i) + '(')
				f.write('		.i_CLK(i_CLK),')
				f.write('		.i_dff(inner_conn[' + str(i-1) + ']),')
				f.write('		.i_sum(sums[' + str(i-1) + ']),')
				f.write('		.o_dff(inner_conn[' + str(i) + ']),')
				f.write('		.o_sum(sums[' + str(i) + '])')
				f.write(');')
				f.write()
			elif(t=1):#normal
				f.write('tap tap' + str(i) + '(')
				f.write('		.i_CLK(i_CLK),')
				f.write('		.i_dff(inner_conn[' + str(i-1) + ']),')
				f.write('		.i_sum(sums[' + str(i-1) + ']),')
				f.write('		.o_dff(inner_conn[' + str(i) + ']),')
				f.write('		.o_sum(sums[' + str(i) + ']),')
				f.write('		.coeff(' + str(cW) + '\'d' + str(c) + ')')
				f.write(');')
				f.write()
			else:#shift
				f.write('shift_tap tap' + str(i) + '(')
				f.write('		.i_CLK(i_CLK),')
				f.write('		.i_dff(inner_conn[' + str(i-1) + ']),')
				f.write('		.i_sum(sums[' + str(i-1) + ']),')
				f.write('		.o_dff(inner_conn[' + str(i) + ']),')
				f.write('		.o_sum(sums[' + str(i) + ']),')
				f.write('		.shift(' + str(cW) + '\'d' + str(c) + ')')
				f.write(');')
				f.write()
				
			i+=1
		
	f.write('wire[' + str(i) + ':0] sums [' + str(sW) + ':0];')
	f.write('wire[' + str(i) + ':0] inner_conn [' + str(dW) + ':0];')
	f.write()
	f.write('endmodule')