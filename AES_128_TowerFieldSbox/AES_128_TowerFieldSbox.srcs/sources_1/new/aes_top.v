`timescale 1ns / 1ps
module aes_top(clk,rst,datain,key,dataout);
input wire clk,rst;
input wire [127:0] datain;
input wire [127:0] key;
output wire [127:0] dataout;

//ÃÜÔ¿À©Õ¹
reg [127:0]round_key_1,round_key_2,round_key_3,round_key_4,round_key_5,round_key_6,round_key_7,round_key_8,round_key_9,round_key_10;
wire [127:0]k_1,k_2,k_3,k_4,k_5,k_6,k_7,k_8,k_9,k_10;

KeyExtend extend (.key(key), .round_key_1(k_1), .round_key_2(k_2), .round_key_3(k_3), 
.round_key_4(k_4), .round_key_5(k_5), .round_key_6(k_6), .round_key_7(k_7), .round_key_8(k_8), 
.round_key_9(k_9), .round_key_10(k_10)); 

always @(*)
    begin
        round_key_1<=k_1;
        round_key_2<=k_2;
        round_key_3<=k_3;
        round_key_4<=k_4;
        round_key_5<=k_5;
        round_key_6<=k_6;
        round_key_7<=k_7;
        round_key_8<=k_8;
        round_key_9<=k_9;
        round_key_10<=k_10;
    end

//ÖĞ¼ä¾ÅÂÖ
reg [127:0] temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10;
wire [127:0]t_1,t_2,t_3,t_4,t_5,t_6,t_7,t_8,t_9,t_10;
Round r1 (.in(temp0), .out(t_1), .RoundKey(round_key_1)) ;
Round r2 (.in(temp1), .out(t_2), .RoundKey(round_key_2)) ;
Round r3 (.in(temp2), .out(t_3), .RoundKey(round_key_3)) ;
Round r4 (.in(temp3), .out(t_4), .RoundKey(round_key_4)) ;
Round r5 (.in(temp4), .out(t_5), .RoundKey(round_key_5)) ;
Round r6 (.in(temp5), .out(t_6), .RoundKey(round_key_6)) ;
Round r7 (.in(temp6), .out(t_7), .RoundKey(round_key_7)) ;
Round r8 (.in(temp7), .out(t_8), .RoundKey(round_key_8)) ;
Round r9 (.in(temp8), .out(t_9), .RoundKey(round_key_9)) ;
Round_fin r10 (.in(temp9), .out(t_10), .round_key(round_key_10)) ;

//key
always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                round_key_1<=128'b0;
                round_key_2<=128'b0;
                round_key_3<=128'b0;
                round_key_4<=128'b0;
                round_key_5<=128'b0;
                round_key_6<=128'b0;
                round_key_7<=128'b0;
                round_key_8<=128'b0;
                round_key_9<=128'b0;
                round_key_10<=128'b0;
            end
//        else
//            begin
//                round_key_1<=round_key_1;
//                round_key_2<=round_key_2;
//                round_key_3<=round_key_3;
//                round_key_4<=round_key_4;
//                round_key_5<=round_key_5;
//                round_key_6<=round_key_6;
//                round_key_7<=round_key_7;
//                round_key_8<=round_key_8;
//                round_key_9<=round_key_9;
//                round_key_10<=round_key_10;
//            end
    end

//round
always@(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                temp0<=128'b0;
                temp1<=128'b0;
                temp2<=128'b0;
                temp3<=128'b0;
                temp4<=128'b0;
                temp5<=128'b0;
                temp6<=128'b0;
                temp7<=128'b0;
                temp8<=128'b0;
                temp9<=128'b0;
            end
        else
            begin
                temp0<=key^datain;
                temp1<=t_1;
                temp2<=t_2;
                temp3<=t_3;
                temp4<=t_4;
                temp5<=t_5;
                temp6<=t_6;
                temp7<=t_7;
                temp8<=t_8;
                temp9<=t_9;
                temp10<=t_10;
            end
    end

assign dataout = temp10;
endmodule