`timescale 1ns / 1ps
module test_aestop();

reg [127:0] data_in,key;
reg clk,rst;
wire [127:0] data_out;
aes_top testbench (.clk(clk), .rst(rst), .datain(data_in), .key(key), .dataout(data_out));

always #1 clk<=~clk;
initial 
    begin
        data_in <= 128'h00112233445566778899aabbccddeeff;
        key <= 128'h000102030405060708090a0b0c0d0e0f;
        clk <= 1'b0;
        rst <= 1'b1;
        
        #2
        data_in <= 128'h193de3bea0f4e22b9ac68d2ae9f84808;
        key <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
        
        #2
        data_in <= 128'h293de3bea0f4e22b9ac68d2ae9f84808;
        key <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
        
        #2
        data_in <= 128'h393de3bea0f4e22b9ac68d2ae9f84808;
        key <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
    end
endmodule
