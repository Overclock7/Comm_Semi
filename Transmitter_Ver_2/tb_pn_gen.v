`timescale 1ns/1ps

module tb_pn_gen;
	
	parameter PERIOD = 4095;
	parameter CLK_PERIOD = 20;
	
	reg CLK,RESET;
	wire PN_ROLL, PN_OUT;
	wire [11:0]STATE;
	
	pn_gen UDT (.clock(CLK),.reset(RESET),.pn_out(PN_OUT),.pn_roll(PN_ROLL),.state(STATE));
	
	initial CLK = 0;
	always #(CLK_PERIOD/2) CLK = ~CLK;
	
	initial
	begin
		RESET = 1;
		#30 RESET = 0;
		#20 RESET = 1;
	end
	
	initial
	#(PERIOD*CLK_PERIOD*4) $stop;
	
endmodule