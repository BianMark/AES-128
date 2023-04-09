`timescale 1ns / 1ps
module test_SubBytes();
reg [127:0] in;
wire [127:0] out;

initial begin
in[127:0] <= 128'h00102030405060708090a0b0c0d0e0f0; #100;
end

SubBytes test (.in(in), .out(out) );

endmodule
