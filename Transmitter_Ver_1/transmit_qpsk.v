module transmit_qpsk(CLOCK_50,SW,PLL_OUT_DA,DA_MODE,DA_WRTA,DAC_OUT);

parameter BIT_DAC = 14;

input CLOCK_50;
input [0:0] SW;

output PLL_OUT_DA,DA_MODE,DA_WRTA;
output [13:0] DAC_OUT;

wire [13:0] if_out;

filter_qpsk QPSK(.clock_5000(CLOCK_50),.reset(SW[0]),.if_out(if_out));

assign PLL_OUT_DA = CLOCK_50; 	// PLL_OUT_DA C0
assign DA_MODE = 1'b1;			// DA_MODE
assign DA_WRTA = ~CLOCK_50;	// DA_WRTA

assign DAC_OUT[13] = ~if_out[13];
assign DAC_OUT[12:0] = if_out[12:0];

endmodule
