`timescale 1ns / 1ps
module AddRoundKey(data_in,key,out);
//input wire clk,rst;
input wire [127:0] data_in;
input wire [127:0] key;
output reg [127:0] out;

always@(*) out <= key^data_in;

endmodule