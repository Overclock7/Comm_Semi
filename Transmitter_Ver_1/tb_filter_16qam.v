`timescale 1ns/1ps

module tb_filter_16qam;

	parameter BIT_DAC = 14;
	parameter SPS = 8;
	parameter CLOCK_PERIOD = 20; // 20ns

	reg CLOCK,RESET;
	wire signed [BIT_DAC-1:0] IF_OUT, BASE_OUT;
	wire signed [13:0] SUM;
	 
	filter_16qam F(.clock_5000(CLOCK),.reset(RESET),.base_out(BASE_OUT),.if_out(IF_OUT));

	initial CLOCK = 1'b0;
	always #(CLOCK_PERIOD/2) CLOCK = ~CLOCK;

	initial
	begin
	RESET = 1;
	#20 RESET = 0;
	#5 RESET = 1;
	end

	initial
	#(SPS*CLOCK_PERIOD*4096) $stop;
	
endmodule