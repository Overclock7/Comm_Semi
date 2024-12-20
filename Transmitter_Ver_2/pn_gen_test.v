module pn_gen_test (CLOCK_50,KEY,GPIO);

input CLOCK_50;
input [3:0] KEY;
output [35:0] GPIO;

pn_gen U1 (.clock(CLOCK_50), .pn_out(GPIO[0]), .pn_roll(GPIO[1]),.reset(KEY[0]),.state(GPIO[13:2]));

assign GPIO[14] = CLOCK_50;

endmodule