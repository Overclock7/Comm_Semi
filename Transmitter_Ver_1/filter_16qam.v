module filter_16qam(clock_5000,reset,if_out,base_out);

parameter SPS = 8;
parameter SPAN = 16;
parameter BIT_DAC = 14;
parameter BIT_WIDTH = 13;
parameter BIT_RE = 2;

integer k,m;

input clock_5000, reset;
wire clock_2500, clock_1250, clock_0625;
wire [$clog2(SPS)-1:0] count;

wire in_i0,in_i1,in_q0,in_q1;
wire [SPAN:0] state_i0,state_i1,state_q0,state_q1;
wire [SPAN:0] state_0,state_1;

wire signed [BIT_WIDTH-1:0] rom [0:SPAN];

reg signed [BIT_WIDTH+BIT_RE-2:0] product [0:SPAN];

reg signed [BIT_WIDTH+BIT_RE-2:0] sum ;

output reg signed [BIT_DAC-1:0] base_out;

output reg signed [BIT_DAC-1:0] if_out;

// Clock
clock_generator #(.MOD(SPS)) C (.clock(clock_5000),.reset(reset),.count(count),.clock_mod2(clock_2500),.clock_mod4(clock_1250),.clock_mod8(clock_0625));

// Input (m-Sequence)
pn_gen #(.SEED(12'b0000_0000_0001),.GEN_POLY(13'b1_0000_1101_0001)) S0 (.clock(clock_0625),.pn_out(in_i0),.reset(reset));
pn_gen #(.SEED(12'b0000_0000_0011),.GEN_POLY(13'b1_0000_1101_0001)) S1 (.clock(clock_0625),.pn_out(in_i1),.reset(reset));
pn_gen #(.SEED(12'b0000_0000_0101),.GEN_POLY(13'b1_0000_1101_0001)) S2 (.clock(clock_0625),.pn_out(in_q0),.reset(reset));
pn_gen #(.SEED(12'b0000_0000_1011),.GEN_POLY(13'b1_0000_1101_0001)) S3 (.clock(clock_0625),.pn_out(in_q1),.reset(reset));

// Tap Delayed Line
tdl I0 (.in(in_i0),.clock(clock_0625),.reset(reset),.out(state_i0));
tdl I1 (.in(in_i1),.clock(clock_0625),.reset(reset),.out(state_i1));
tdl Q0 (.in(in_q0),.clock(clock_0625),.reset(reset),.out(state_q0));
tdl Q1 (.in(in_q1),.clock(clock_0625),.reset(reset),.out(state_q1));

// IQ Data Control
mux_4to2 #(.SPAN(SPAN)) M (.in_i0(state_i0),.in_i1(state_i1),.in_q0(state_q0),.in_q1(state_q1),.sel(count[0]),.out_0(state_0),.out_1(state_1));

// Read Raised Cosine Filter Coefficient
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_0.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R00 (.address(count[2:0]),.data(rom[0]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_1.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R01 (.address(count[2:0]),.data(rom[1]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_2.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R02 (.address(count[2:0]),.data(rom[2]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_3.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R03 (.address(count[2:0]),.data(rom[3]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_4.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R04 (.address(count[2:0]),.data(rom[4]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_5.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R05 (.address(count[2:0]),.data(rom[5]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_6.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R06 (.address(count[2:0]),.data(rom[6]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_7.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R07 (.address(count[2:0]),.data(rom[7]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_8.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R08 (.address(count[2:0]),.data(rom[8]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_9.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R09 (.address(count[2:0]),.data(rom[9]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_10.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R10 (.address(count[2:0]),.data(rom[10]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_11.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R11 (.address(count[2:0]),.data(rom[11]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_12.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R12 (.address(count[2:0]),.data(rom[12]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_13.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R13 (.address(count[2:0]),.data(rom[13]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_14.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R14 (.address(count[2:0]),.data(rom[14]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_15.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R15 (.address(count[2:0]),.data(rom[15]));
coeff_rom #(.FILE_NAME("C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/simulation/coeff_roll_off_0_35_length_13bit_16.txt"),.BIT_WIDTH(BIT_WIDTH),.MEMORY_DEPTH(SPS)) R16 (.address(count[2:0]),.data(rom[16]));

// Multiplier & Adder
// sum
always @(posedge clock_5000 or negedge reset)
begin
	
	if(!reset) 
	begin
		sum = 1'sb0;
	end
	else
	begin
		sum = 1'sb0;
		for(k=0;k<=SPAN;k=k+1) sum = sum + product[k];
	end
		
end

// product
always @(posedge clock_5000 or negedge reset)
begin
	
	if(!reset)
	begin
		for(k=0;k<=SPAN;k=k+1) product[k] = 1'sb0;
	end
	else
	begin		
		for(k=0;k<=SPAN;k=k+1)
		begin
			case({state_1[k],state_0[k]})
			2'b00 : product[k] = 3 * rom[k];
			2'b01 : product[k] = 1 * rom[k];
			2'b10 : product[k] = -1 * rom[k];
			2'b11 : product[k] = -3 * rom[k];
		endcase
		end
	end
		
end

// Base Out
always @(posedge clock_5000 or negedge reset)
begin
	base_out = sum;
end

// Sign Control
always @(posedge clock_5000 or negedge reset)
begin
	
	if(!reset) if_out = 1'sb0;
	else if_out = (~count[1]) ? -1*base_out : 1*base_out;

end

endmodule

