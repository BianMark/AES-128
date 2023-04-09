`timescale 1ns / 1ps
module T(key,flag,round_key);
input wire [127:0] key; 
input wire [3:0] flag;        
output wire [127:0] round_key; 

//行移位+字节代换
wire [31:0]sbox_out,xor_out;
aes_sbox u0 (.b(key[31:24]), .Sb(sbox_out[7:0]) );
aes_sbox u1 (.b(key[23:16]), .Sb(sbox_out[31:24]) );
aes_sbox u2 (.b(key[15:8]), .Sb(sbox_out[23:16]) );
aes_sbox u3 (.b(key[7:0]), .Sb(sbox_out[15:8]) );

//轮常量异或
round_xor round_xor(.in(sbox_out), .out(xor_out), .flag(flag));
assign round_key[127:96]=key[127:96]^xor_out;
assign round_key[95:64]=key[95:64]^round_key[127:96];
assign round_key[63:32]=key[63:32]^round_key[95:64];
assign round_key[31:0]=key[31:0]^round_key[63:32];

endmodule
