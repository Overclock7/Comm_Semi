`timescale 1ns/1ps

module tb_clock_generator_2;
	
	parameter MOD = 8;
	parameter BITS = $clog2(MOD);
	parameter CLK_PERIOD = 20; //20ns
	
	reg CLK,RESET;
	wire CLK_MOD2,CLK_MOD4,CLK_MOD8;
	wire [BITS-1:0] COUNT;
	
	clock_generator_2 G0(.clock(CLK),.reset(RESET),.count(COUNT),.clock_mod2(CLK_MOD2),.clock_mod4(CLK_MOD4),.clock_mod8(CLK_MOD8));
	
	initial CLK = 1'b0;
	always #(CLK_PERIOD/2) CLK = ~CLK;
	
	initial
	begin
	RESET = 1;
	#20 RESET = 0;
	#5 RESET = 1;
	end
	
	initial
	#(MOD*CLK_PERIOD*20) $stop;
	
endmodule