sW=10-1 #Width of sum
dW=3-1 #Width of signal
cW=3-1 #Width of coeffs
zThresh= #zero threshold



#Loop over coefficients
i=0
with open("filter.v", "w+") as f:
	f.write('reg[8:0] sums [2:0];')
	f.write('reg[2:0] inner_conn [2:0];')
	with open("coeffs.csv", "r") as coeffs:
		for c in f:
			c=float(c.rstrip(",\n"))
			
			#decide type, t
			#set c
			if(c<=zThresh):
				t=0
			#elif():#power of 2 condition
				
			#	t=1
			else:
				t=2
			
			
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
				f.write('		.coeff(' + str(cW) + '\'d' + str(c) + ')')
				f.write(');')
				f.write()
				
			i+=1
		
		for j in range(i):#create wires
			f.write('\n')
			