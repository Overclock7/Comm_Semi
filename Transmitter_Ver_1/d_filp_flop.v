module d_filp_flop(clock,reset,d,q);

input clock,reset,d;
output reg q;

always @(posedge clock or negedge reset)
	begin
	if(!reset)
		begin
		q <= 1'b0;
		end
	else
		begin
		q <= d;
		end
	end
	
endmodule