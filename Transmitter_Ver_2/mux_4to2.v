module mux_4to2(in_i0,in_i1,in_q0,in_q1,sel,out_0,out_1);

parameter SPAN = 16;

input wire [SPAN:0]in_i0,in_i1,in_q0,in_q1;
input wire sel;
output wire [SPAN:0]out_0,out_1;

assign out_0 = (sel)? in_q0 : in_i0;
assign out_1 = (sel)? in_q1 : in_i1;

endmodule