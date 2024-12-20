module tdl(in,clock,reset,out);

parameter SPAN = 16;

input in,clock,reset;
output reg [SPAN:0]out;


always @(posedge clock or negedge reset)
begin

	if(!reset)
		out = 1'b0;
	else
	begin
		out = {out[SPAN-1:0], in};
	end

end

endmodule
