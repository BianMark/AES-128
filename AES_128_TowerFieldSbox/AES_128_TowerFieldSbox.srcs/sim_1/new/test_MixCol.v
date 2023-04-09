`timescale 1ns / 1ps
module test_MixCol();
reg [127:0] in;
reg [127:0] out;

initial begin
in[127:0] <= 128'h6353e08c0960e104cd70b751bacad0e7; #100;
end

MixColumns test (.in(in), .out(out) );

endmodule
