module mux_2to1(in_i,in_q,sel,out);

parameter SPAN = 16;

input wire [SPAN:0]in_i,in_q;
input wire sel;
output wire [SPAN:0]out;

assign out = (sel)? in_q : in_i;

endmodule