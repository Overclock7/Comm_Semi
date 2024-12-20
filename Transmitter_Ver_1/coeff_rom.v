module coeff_rom (address,data);

parameter FILE_NAME = "coeff_8.txt";
parameter BIT_WIDTH=11;
parameter MEMORY_DEPTH = 8;

input [$clog2(MEMORY_DEPTH)-1:0] address;
output reg [BIT_WIDTH-1:0] data;

reg [BIT_WIDTH-1:0] coeff_rom [0:MEMORY_DEPTH-1];

initial $readmemb(FILE_NAME,coeff_rom);

always @(address)
begin
	data = coeff_rom[address];
end

endmodule

