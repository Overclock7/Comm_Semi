`timescale 1ns/1ps

module tb_transmit_qpsk;

	parameter BIT_DAC = 14;
	parameter SPS = 8;
	parameter CLOCK_PERIOD = 20; // 20ns

	reg CLOCK,RESET;
	wire [13:0] DAC_OUT;
	wire PLL_OUT_DA, DA_MODE, DA_WRTA;

	transmit_qpsk T(.CLOCK_50(CLOCK),.SW(RESET),.PLL_OUT_DA(PLL_OUT_DA),.DA_MODE(DA_MODE),.DA_WRTA(DA_WRTA),.DAC_OUT(DAC_OUT));

	initial CLOCK = 1'b0;
	always #(CLOCK_PERIOD/2) CLOCK = ~CLOCK;

	initial
	begin
	RESET = 1;
	#20 RESET = 0;
	#5 RESET = 1;
	end

	initial
	#(SPS*CLOCK_PERIOD*256) $stop;
	
endmodule
