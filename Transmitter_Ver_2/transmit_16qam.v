module transmit_16qam(CLOCK_50,RESET,PLL_OUT_DA,DA_MODE,DA_WRTA,DAC_OUT);

parameter SPS = 8;
parameter BIT_SYM = 4;
parameter BIT_DAC = 14;

input CLOCK_50;
input RESET;

output PLL_OUT_DA,DA_MODE,DA_WRTA;
output [13:0] DAC_OUT;

wire clock_2500,clock_0625;
wire [$clog2(SPS)-1:0] count;
wire pn_out;
wire [BIT_SYM-1:0] reg_out;

// Clock
clock_generator_2 #(.MOD(SPS)) C (.clock(CLOCK_50),.reset(RESET),.count(count),.clock_mod2(clock_2500),.clock_mod8(clock_0625));

// Input (m-Sequence)
pn_gen #(.SEED(12'b0000_0000_0001),.GEN_POLY(13'b1_0000_1101_0001)) S (.clock(clock_2500),.pn_out(pn_out),.reset(RESET));

// Register
register #(.SIZE(BIT_SYM)) R (.in(pn_out),.clock(clock_2500),.reset(RESET),.out(reg_out));  // Symbol Rate = 6.25MHz

// Filter
filter_16qam QAM (.clock_sample(CLOCK_50),.clock_symbol(clock_0625),.reset(RESET),.count(count),.symbol(reg_out),.dac_out(DAC_OUT));

// For DAC
assign PLL_OUT_DA = CLOCK_50; // PLL_OUT_DA C0
assign DA_MODE = 1'b1;			// DA_MODE
assign DA_WRTA = ~CLOCK_50;	// DA_WRTA

endmodule