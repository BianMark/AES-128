`timescale 1ns / 1ps
module MixColumns(in,out);
input wire [127:0] in;
output reg [127:0] out;

wire [7:0] s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15;
assign s0 = in[127:120];
assign s1 = in[119:112];
assign s2 = in[111:104];
assign s3 = in[103:96];
assign s4 = in[95:88];
assign s5 = in[87:80];
assign s6 = in[79:72];
assign s7 = in[71:64];
assign s8 = in[63:56];
assign s9 = in[55:48];
assign s10 = in[47:40];
assign s11 = in[39:32];
assign s12 = in[31:24];
assign s13 = in[23:16];
assign s14 = in[15:8];
assign s15 = in[7:0];

wire [7:0] sub0,sub1,sub2,sub3,sub4,sub5,sub6,sub7,sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15;
assign sub0 = GF2(s0) ^ GF3(s1) ^ s2 ^ s3;
assign sub1 = s0 ^ GF2(s1) ^ GF3(s2) ^ s3;
assign sub2 = s0 ^ s1 ^ GF2(s2) ^ GF3(s3);
assign sub3 = GF3(s0) ^ s1 ^ s2 ^ GF2(s3);
assign sub4 = GF2(s4) ^ GF3(s5) ^ s6 ^ s7;
assign sub5 = s4 ^ GF2(s5) ^ GF3(s6) ^ s7;
assign sub6 = s4 ^ s5 ^ GF2(s6) ^ GF3(s7);
assign sub7 = GF3(s4) ^ s5 ^ s6 ^ GF2(s7);
assign sub8 = GF2(s8) ^ GF3(s9) ^ s10 ^ s11;
assign sub9 = s8 ^ GF2(s9) ^ GF3(s10) ^ s11;
assign sub10 = s8 ^ s9 ^ GF2(s10) ^ GF3(s11);
assign sub11 = GF3(s8) ^ s9 ^ s10 ^ GF2(s11);
assign sub12 = GF2(s12) ^ GF3(s13) ^ s14 ^ s15;
assign sub13 = s12 ^ GF2(s13) ^ GF3(s14) ^ s15;
assign sub14 = s12 ^ s13 ^ GF2(s14) ^ GF3(s15);
assign sub15 = GF3(s12) ^ s13 ^ s14 ^ GF2(s15);

always@(*) out[127:0] <= {sub0,sub1,sub2,sub3,sub4,sub5,sub6,sub7,sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15};

//定义GF域上乘法
function [7:0] GF2;
input [7:0] datain;
begin
if(datain[7]==0)
begin
GF2 = { datain[6:0] ,1'b0 };
end

else
begin
GF2 = { datain[6:0] ,1'b0 } ^ 8'b00011011 ;
end
end
endfunction

function [7:0] GF3;
input [7:0] datain;
begin
GF3 = GF2(datain) ^ datain;
end
endfunction

endmodule
