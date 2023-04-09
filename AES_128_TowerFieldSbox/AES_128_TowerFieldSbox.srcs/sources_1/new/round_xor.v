`timescale 1ns / 1ps

module round_xor(in,out,flag);
input [3:0]flag;
input [31:0]in;
output reg[31:0]out;
always@(*)
begin
case(flag)
4'b0001:out=in^32'h01000000;
4'b0010:out=in^32'h02000000;
4'b0011:out=in^32'h04000000;
4'b0100:out=in^32'h08000000;
4'b0101:out=in^32'h10000000;
4'b0110:out=in^32'h20000000;
4'b0111:out=in^32'h40000000;
4'b1000:out=in^32'h80000000;
4'b1001:out=in^32'h1b000000;
4'b1010:out=in^32'h36000000;
default:out=in;
endcase
end
endmodule