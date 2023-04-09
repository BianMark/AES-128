`timescale 1ns / 1ps
module KeyExtend(key,round_key_1,round_key_2,round_key_3,round_key_4,round_key_5,
round_key_6,round_key_7,round_key_8,round_key_9,round_key_10);
input wire [127:0] key;
output wire [127:0]round_key_1,round_key_2,round_key_3,round_key_4,round_key_5,
round_key_6,round_key_7,round_key_8,round_key_9,round_key_10;

wire [3:0]flag_1=4'b0001;
wire [3:0]flag_2=4'b0010;
wire [3:0]flag_3=4'b0011;
wire [3:0]flag_4=4'b0100;
wire [3:0]flag_5=4'b0101;
wire [3:0]flag_6=4'b0110;
wire [3:0]flag_7=4'b0111;
wire [3:0]flag_8=4'b1000;
wire [3:0]flag_9=4'b1001;
wire [3:0]flag_10=4'b1010;

T T_1(.key(key), .flag(flag_1), .round_key(round_key_1));
T T_2(.key(round_key_1), .flag(flag_2), .round_key(round_key_2));
T T_3(.key(round_key_2), .flag(flag_3), .round_key(round_key_3));
T T_4(.key(round_key_3), .flag(flag_4), .round_key(round_key_4));
T T_5(.key(round_key_4), .flag(flag_5), .round_key(round_key_5));
T T_6(.key(round_key_5), .flag(flag_6), .round_key(round_key_6));
T T_7(.key(round_key_6), .flag(flag_7), .round_key(round_key_7));
T T_8(.key(round_key_7), .flag(flag_8), .round_key(round_key_8));
T T_9(.key(round_key_8), .flag(flag_9), .round_key(round_key_9));
T T_10(.key(round_key_9), .flag(flag_10), .round_key(round_key_10));

endmodule
