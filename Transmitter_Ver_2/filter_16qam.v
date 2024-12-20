module filter_16qam(clock_sample,clock_symbol,reset,count,symbol,dac_out);

parameter SPS = 8;
parameter SPAN = 16;
parameter BIT_SYM = 4;
parameter BIT_WIDTH = 15;

integer k;
input clock_sample,clock_symbol,reset;
input [$clog2(SPS)-1:0] count;
input [BIT_SYM-1:0] symbol;

wire [SPAN:0] state_i0,state_i1,state_q0,state_q1;
wire [SPAN:0] state_0,state_1;

wire signed [BIT_WIDTH-1:0] rom [0:SPAN][0:BIT_SYM-1];

reg signed [BIT_WIDTH-1:0] sum ;

output [BIT_WIDTH-2:0] dac_out;

// Tap Delayed Line
tdl I0 (.in(symbol[0]),.clock(clock_symbol),.reset(reset),.out(state_i0));
tdl I1 (.in(symbol[1]),.clock(clock_symbol),.reset(reset),.out(state_i1));
tdl Q0 (.in(symbol[2]),.clock(clock_symbol),.reset(reset),.out(state_q0));
tdl Q1 (.in(symbol[3]),.clock(clock_symbol),.reset(reset),.out(state_q1));

// IQ Data Control
mux_4to2 #(.SPAN(SPAN)) M (.in_i0(state_i0),.in_i1(state_i1),.in_q0(state_q0),.in_q1(state_q1),.sel(count[0]),.out_0(state_0),.out_1(state_1));

// Read Raised Cosine Filter Coefficient
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_0.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R000 (.address(count),.data(rom[0][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_1.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R001 (.address(count),.data(rom[1][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_2.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R002 (.address(count),.data(rom[2][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_3.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R003 (.address(count),.data(rom[3][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_4.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R004 (.address(count),.data(rom[4][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_5.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R005 (.address(count),.data(rom[5][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_6.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R006 (.address(count),.data(rom[6][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_7.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R007 (.address(count),.data(rom[7][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_8.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R008 (.address(count),.data(rom[8][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_9.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R009 (.address(count),.data(rom[9][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_10.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R010 (.address(count),.data(rom[10][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_11.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R011 (.address(count),.data(rom[11][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_12.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R012 (.address(count),.data(rom[12][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_13.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R013 (.address(count),.data(rom[13][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_14.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R014 (.address(count),.data(rom[14][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_15.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R015 (.address(count),.data(rom[15][0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P3_16.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R016 (.address(count),.data(rom[16][0]));

coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_0.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R100 (.address(count),.data(rom[0][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_1.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R101 (.address(count),.data(rom[1][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_2.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R102 (.address(count),.data(rom[2][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_3.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R103 (.address(count),.data(rom[3][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_4.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R104 (.address(count),.data(rom[4][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_5.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R105 (.address(count),.data(rom[5][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_6.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R106 (.address(count),.data(rom[6][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_7.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R107 (.address(count),.data(rom[7][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_8.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R108 (.address(count),.data(rom[8][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_9.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R109 (.address(count),.data(rom[9][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_10.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R110 (.address(count),.data(rom[10][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_11.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R111 (.address(count),.data(rom[11][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_12.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R112 (.address(count),.data(rom[12][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_13.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R113 (.address(count),.data(rom[13][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_14.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R114 (.address(count),.data(rom[14][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_15.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R115 (.address(count),.data(rom[15][1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_P1_16.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R116 (.address(count),.data(rom[16][1]));

coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_0.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R200 (.address(count),.data(rom[0][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_1.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R201 (.address(count),.data(rom[1][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_2.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R202 (.address(count),.data(rom[2][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_3.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R203 (.address(count),.data(rom[3][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_4.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R204 (.address(count),.data(rom[4][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_5.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R205 (.address(count),.data(rom[5][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_6.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R206 (.address(count),.data(rom[6][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_7.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R207 (.address(count),.data(rom[7][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_8.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R208 (.address(count),.data(rom[8][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_9.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R209 (.address(count),.data(rom[9][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_10.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R210 (.address(count),.data(rom[10][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_11.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R211 (.address(count),.data(rom[11][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_12.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R212 (.address(count),.data(rom[12][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_13.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R213 (.address(count),.data(rom[13][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_14.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R214 (.address(count),.data(rom[14][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_15.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R215 (.address(count),.data(rom[15][2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M1_16.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R216 (.address(count),.data(rom[16][2]));

coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_0.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R300 (.address(count),.data(rom[0][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_1.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R301 (.address(count),.data(rom[1][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_2.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R302 (.address(count),.data(rom[2][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_3.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R303 (.address(count),.data(rom[3][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_4.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R304 (.address(count),.data(rom[4][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_5.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R305 (.address(count),.data(rom[5][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_6.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R306 (.address(count),.data(rom[6][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_7.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R307 (.address(count),.data(rom[7][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_8.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R308 (.address(count),.data(rom[8][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_9.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R309 (.address(count),.data(rom[9][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_10.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R310 (.address(count),.data(rom[10][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_11.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R311 (.address(count),.data(rom[11][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_12.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R312 (.address(count),.data(rom[12][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_13.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R313 (.address(count),.data(rom[13][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_14.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R314 (.address(count),.data(rom[14][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_15.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R315 (.address(count),.data(rom[15][3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/simulation/coeff_M3_16.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R316 (.address(count),.data(rom[16][3]));

// Adder
always @(posedge clock_sample)
begin
	
	sum = 1'sb0;
	for(k=0;k<=SPAN;k=k+1) 
	begin
		sum = sum + rom[k][{state_1[k],state_0[k]}];
	end
	
end

// DAC Out
assign dac_out = {~sum[14],sum[13:1]};

endmodule
