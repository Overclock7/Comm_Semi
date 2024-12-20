`timescale 1ns/1ps

module tb_tdl;

	parameter SPAN = 16;
	parameter CLOCK_PERIOD = 20; // 20ns
	
	reg IN,CLOCK,RESET;
	wire [SPAN:0] STATE;
	
	tdl T0(.in(IN),.clock(CLOCK),.reset(RESET),.out(STATE));
	
	initial CLOCK = 1'b0;
	always #(CLOCK_PERIOD/2) CLOCK = ~CLOCK;
	
	initial
	begin
	RESET = 1;
	#20 RESET = 0;
	#5 RESET = 1;
	end
	
	initial IN = 1'b0;
	always @(posedge CLOCK)	IN = ~IN;
	
	initial
	#(SPAN*CLOCK_PERIOD*200) $stop;
	
	
endmodule
