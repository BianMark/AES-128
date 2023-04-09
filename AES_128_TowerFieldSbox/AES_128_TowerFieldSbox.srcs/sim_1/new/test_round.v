`timescale 1ns / 1ps
module test_round();
reg [127:0] in;
wire [127:0] out;
reg [127:0] W_r1;
wire [127:0] temp1,temp2,temp3,temp4;

initial begin
in[127:0] <= 128'h00102030405060708090a0b0c0d0e0f0; #100;
W_r1 <= 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;
end

Round r1 (.in(in), .out(out), .RoundKey(W_r1), .temp1(temp1), .temp2(temp2), .temp3(temp3));
//, .temp1(temp1), .temp2(temp2), .temp3(temp3), .temp4(temp4)
endmodule
