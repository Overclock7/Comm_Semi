module pn_gen(clock,pn_out,pn_roll,reset,state);

input clock, reset;
output pn_out, pn_roll;
output [11:0] state;

parameter SEED = 12'b0000_0000_0001; // b(D) = 1
parameter GEN_POLY = 13'b1_0000_1101_0001; // g(D) = D^12+D^7+D^6+D^4+1

reg [11:0] state;
reg pn_roll;

always @(posedge clock,negedge reset)
begin
	if (!reset)
		begin
			state <= SEED;
			pn_roll <= 1;
		end
	else
		begin
			state = {state[10:0],^(GEN_POLY[12:1] & state)};
			if (state == SEED) pn_roll = 1;
			else pn_roll = 0;
		end
end

assign pn_out = state[0];
endmodule
