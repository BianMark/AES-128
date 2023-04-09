`timescale 1ns / 1ps

module Round_fin(in,out,round_key);
input [127:0]in;
input [127:0]round_key;
output [127:0]out;
wire [127:0]SubBytes,ShiftRows;
SubBytes sub_byte(.in(in), .out(SubBytes));
ShiftRows shiftrows(.in(SubBytes), .out(ShiftRows));
assign out=round_key^ShiftRows;
endmodule