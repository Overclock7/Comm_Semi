module clock_generator_2(clock,reset,count,carry,clock_mod2,clock_mod4,clock_mod8);

parameter MOD = 8;
parameter BITS = $clog2(MOD);

input clock,reset;
output reg [BITS-1:0] count;
output reg carry;
output clock_mod2,clock_mod4,clock_mod8;

always @(posedge clock or negedge reset)
	begin
		if(!reset)
			begin
			count <= 1'b0;
			carry <= 1'b0;
			end
		else if (count < MOD - 1)
			begin
			count <= count + 1'b1;
			carry <= 1'b0;
			end
		else
			begin
			count <= 1'b0;
			carry <= 1'b1;
			end
	end
	
assign clock_mod2 = ~count[0];
assign clock_mod4 = ~count[1];
assign clock_mod8 = ~count[2];

endmodule