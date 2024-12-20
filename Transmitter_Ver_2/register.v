module register(in,clock,reset,out);

parameter SIZE = 4;

input in,clock,reset;
output reg [SIZE-1:0]out;


always @(posedge clock or negedge reset)
begin

	if(!reset)
		out = 1'b0;
	else
	begin
		out = {out[SIZE-2:0], in};
	end

end

endmodule
