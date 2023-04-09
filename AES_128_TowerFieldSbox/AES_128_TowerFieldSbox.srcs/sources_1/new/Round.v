`timescale 1ns / 1ps
module Round(in,out,RoundKey);
input wire [127:0] in;
input wire [127:0] RoundKey;
output wire [127:0] out;
wire [127:0] temp1,temp2,temp3;
SubBytes mod1 (.in(in), .out(temp1));
ShiftRows mod2 (.in(temp1), .out(temp2));
MixColumns mod3 (.in(temp2), .out(temp3));
//AddRoundKey mod4 (.data_in(temp3), .key(W), .out(temp4) );
assign out = RoundKey^temp3;
endmodule
