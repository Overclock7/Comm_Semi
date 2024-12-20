module clock_generator(clock,reset,count,clock_mod2,clock_mod4,clock_mod8);

parameter MOD = 8;
parameter BITS = $clog2(MOD);

input clock, reset;
output clock_mod2, clock_mod4, clock_mod8;
output wire [BITS-1:0] count;
wire clock_inv,clock_inv2,clock_inv4,clock_inv8;

assign clock_inv2 = ~clock_mod2;
assign clock_inv4 = ~clock_mod4;
assign clock_inv8 = ~clock_mod8;

d_filp_flop D0(.clock(clock),.reset(reset),.d(clock_inv2),.q(clock_mod2));
d_filp_flop D1(.clock(clock_mod2),.reset(reset),.d(clock_inv4),.q(clock_mod4));
d_filp_flop D2(.clock(clock_mod4),.reset(reset),.d(clock_inv8),.q(clock_mod8));


assign count = {clock_inv8,clock_inv4,clock_inv2};

endmodule