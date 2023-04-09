`timescale 1ns / 1ps
module SubBytes(in,out);
input wire [127:0] in;
output wire [127:0] out;

wire [7:0] sub1,sub2,sub3,sub4,sub5,sub6,sub7,sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15,sub16;

aes_sbox s1 (.b(in[127:120]), .Sb(sub1));
aes_sbox s2 (.b(in[119:112]), .Sb(sub2));
aes_sbox s3 (.b(in[111:104]), .Sb(sub3));
aes_sbox s4 (.b(in[103:96]), .Sb(sub4));
aes_sbox s5 (.b(in[95:88]), .Sb(sub5));
aes_sbox s6 (.b(in[87:80]), .Sb(sub6));
aes_sbox s7 (.b(in[79:72]), .Sb(sub7));
aes_sbox s8 (.b(in[71:64]), .Sb(sub8));
aes_sbox s9 (.b(in[63:56]), .Sb(sub9));
aes_sbox s10 (.b(in[55:48]), .Sb(sub10));
aes_sbox s11 (.b(in[47:40]), .Sb(sub11));
aes_sbox s12 (.b(in[39:32]), .Sb(sub12));
aes_sbox s13 (.b(in[31:24]), .Sb(sub13));
aes_sbox s14 (.b(in[23:16]), .Sb(sub14));
aes_sbox s15 (.b(in[15:8]), .Sb(sub15));
aes_sbox s16 (.b(in[7:0]), .Sb(sub16));

assign out = {sub1,sub2,sub3,sub4,sub5,sub6,sub7,sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15,sub16};

endmodule
