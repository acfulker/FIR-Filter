module  Signal_Generator(
	input wire CLOCK_50,
	output reg [2:0] signal);
					

//Signal generator elements

reg[2:0] sinAddr = 3'd0;
reg[2:0] sine = 3'd0;

//Variables to hold captured values



always@(posedge CLOCK_50)
begin
	sinAddr <= sinAddr + 3'd1;
	signal <= sine;
end

//Sin Wave ROM Table
always@(sinAddr)
	begin
		case(sinAddr)
			3'd0: sine = 3'd0;
			3'd1: sine = 3'd1;
			3'd2: sine = 3'd2;
			3'd3: sine = 3'd3;
			3'd4: sine = 3'd4;
			3'd5: sine = 3'd5;
			3'd6: sine = 3'd6;
			3'd7: sine = 3'd7;
			default: sine = 3'd0;
		endcase
	end	
	
endmodule


