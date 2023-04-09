`timescale 1ns / 1ps
module test_sbox();
reg [7:0] in;
wire [7:0] out;

initial begin
in[7:0] <= 8'hff; #100;
in[7:0] <= 8'h10; #100; 
in[7:0] <= 8'hf0; #100; 
end

aes_sbox test (.a(in), .d(out) );

endmodule
