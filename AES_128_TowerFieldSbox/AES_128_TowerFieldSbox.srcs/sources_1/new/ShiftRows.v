`timescale 1ns / 1ps
module ShiftRows(in,out);
input wire [127:0] in;
output reg [127:0] out;
wire [7:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;
assign s1 = in[127:120];
assign s2 = in[119:112];
assign s3 = in[111:104];
assign s4 = in[103:96];
assign s5 = in[95:88];
assign s6 = in[87:80];
assign s7 = in[79:72];
assign s8 = in[71:64];
assign s9 = in[63:56];
assign s10 = in[55:48];
assign s11 = in[47:40];
assign s12 = in[39:32];
assign s13 = in[31:24];
assign s14 = in[23:16];
assign s15 = in[15:8];
assign s16 = in[7:0];

always@(*) out <= {s1,s6,s11,s16,s5,s10,s15,s4,s9,s14,s3,s8,s13,s2,s7,s12 };

endmodule
