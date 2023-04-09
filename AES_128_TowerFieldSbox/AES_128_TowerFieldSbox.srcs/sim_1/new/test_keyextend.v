`timescale 1ns / 1ps
module test_keyextend();
reg [127:0] in;
wire [127:0]k_1,k_2,k_3,k_4,k_5,k_6,k_7,k_8,k_9,k_10;

initial begin
in[127:0] <= 128'h000102030405060708090a0b0c0d0e0f; #100;
end

KeyExtend test (.key(in), .round_key_1(k_1), .round_key_2(k_2), .round_key_3(k_3), 
.round_key_4(k_4), .round_key_5(k_5), .round_key_6(k_6), .round_key_7(k_7), .round_key_8(k_8), 
.round_key_9(k_9), .round_key_10(k_10));

endmodule
