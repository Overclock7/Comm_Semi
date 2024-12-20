module transmit_qpsk(CLOCK_50,RESET,PLL_OUT_DA,DA_MODE,DA_WRTA,DAC_OUT);

parameter SPS = 8;
parameter BIT_SYM = 2;
parameter BIT_DAC = 14;

input CLOCK_50;
input RESET;

output PLL_OUT_DA,DA_MODE,DA_WRTA;
output [13:0] DAC_OUT;

wire clock_1250,clock_0625;
wire [$clog2(SPS)-1:0] count;
wire pn_out;
wire [BIT_SYM-1:0] reg_out;
wire [BIT_DAC-1:0] if_out;

// Clock
clock_generator_2 #(.MOD(SPS)) C (.clock(CLOCK_50),.reset(RESET),.count(count),.clock_mod4(clock_1250),.clock_mod8(clock_0625));

// Input (m-Sequence)
pn_gen #(.SEED(12'b0000_0000_0001),.GEN_POLY(13'b1_0000_1101_0001)) S (.clock(clock_1250),.pn_out(pn_out),.reset(RESET));

// Register
register #(.SIZE(BIT_SYM)) R (.in(pn_out),.clock(clock_1250),.reset(RESET),.out(reg_out));  // Symbol Rate = 6.25MHz

// Filter
filter_qpsk QPSK (.clock_sample(CLOCK_50),.clock_symbol(clock_0625),.reset(RESET),.count(count),.symbol(reg_out),.if_out(if_out));

// For DAC
assign PLL_OUT_DA = CLOCK_50; 	// PLL_OUT_DA C0
assign DA_MODE = 1'b1;			// DA_MODE
assign DA_WRTA = ~CLOCK_50;	// DA_WRTA

assign DAC_OUT[13] = ~if_out[13];
assign DAC_OUT[12:0] = if_out[12:0];

endmodule
