/* The AES S-box */
module aes_sbox (b, Sb );
input [7:0] b;
output [7:0] Sb;
wire [7:0] g;
wire [9:0] m;
wire [3:0] p, l;
wire [17:0] e;
Input M1(b, g, m);
Top M2(g, m, p);
Middle M3(p, l);
Bottom M4(g, m, l, e);
Output M5(e, Sb );
endmodule


/* Gates implemented as modules to prevent
unintentional optimization of the DC */
module XOR (t, a, b);
output t;
input a, b;
xor (t, a, b);
endmodule
module XNOR (t, a, b);
output t;
input a, b;
xnor (t, a, b);
endmodule
module NAND (t, a, b);
output t;
input a, b;
nand (t, a, b);
endmodule
module NOR (t, a, b);
output t;
input a, b;
nor (t, a, b);
endmodule


/* input matrix */
module Input (b, g, m);
input [7:0] b;
output [7:0] g;
output [9:0] m;
wire t1 , t2 , t3 , t4 , t5 , t6 , t7 , t8 , t9 , t10 ,
t11 , t12 , t13 , t14 , t15 , t16 , t17 , t18 , t19 ;
XOR m1(t1 , b[7], b[4]);
XOR m2(t2 , b[3], b[1]);
XOR m3(t3 , b[2], t2 );
XOR m4(t4 , b[6], t3 );
XOR m5(t5 , b[0], t4 );
XOR m6(t6 , b[5], t3 );
XOR m7(t7 , t5 , t6 );
XOR m8(t8 , b[4], t7 );
XOR m9(t9 , t1 , t2 );
XOR m10 (t10 , t1 , t8 );
XOR m11 (t11 , b[0], t9 );
XOR m12 (t12 , b[4], b[2]);
XOR m13 (t13 , b[1], t7 );
XOR m14 (t14 , b[7], b[2]);
XOR m15 (t15 , t13 , t14 );
XOR m16 (t16 , b[7], b[1]);
XOR m17 (t17 , t12 , t16 );
XOR m18 (t18 , t6 , t9 );
XOR m19 (t19 , t7 , t11 );
assign g = {b[0], t11 , t5 , t7 , t8 , t15 , t10 , t13 };
assign m = {t9 , t17 , t4 , t1 , t19 , t14 , t18 , t12 , t6 , t16 };
endmodule

/* top part : GF (2^4) multiplier and GF (2^4) square - scaler */
module Top (g, m, p);
input [7:0] g;
input [9:0] m;
output [3:0] p;
wire t1 , t2 , t3 , t4 , t5 , t6 , t7 , t8 , t9 , t10 , t11 , t12 , t13 ,
t14 , t15 , t16 , t17 , t18 , t19 , t20 , t21 , t22 , t23 , t24 ;
NAND m1(t1 , g[6], g[2]);
NAND m2(t2 , m[9], m[8]);
NAND m3(t3 , g[7], g[3]);
XOR m4(t13 , t1 , t2 );
XOR m5(t14 , t3 , t1 );
NAND m6(t4 , m[7], m[6]);
NOR m7(t5 , m[7], m[6]);
NAND m8(t6 , m[3], m[2]);
NOR m9(t7 , m[3], m[2]);
NAND m10 (t8 , m[5], m[4]);
XOR m11 (t15 , t5 , t6 );
XOR m12 (t16 , t8 , t7 );
XOR m13 (t17 , t4 , t6 );
XOR m14 (t18 , t8 , t6 );
NAND m15 (t9 , g[4], g[0]);
NOR m16 (t10 , m[1], m[0]);
NAND m17 (t11 , g[5], g[1]);
NOR m18 (t12 , g[4], g[0]);
XOR m19 (t19 , t9 , t10 );
XOR m20 (t20 , t11 , t12 );
XOR m21 (t21 , t13 , t15 );
XOR m22 (t22 , t14 , t16 );
XOR m23 (t23 , t19 , t17 );
XOR m24 (t24 , t20 , t18 );
assign p[3] = t21 ;
assign p[2] = t22 ;
assign p[1] = t23 ;
assign p[0] = t24 ;
endmodule


/* middle part : GF (2^4) inverse */
module Middle (p, l);
input [3:0] p;
output [3:0] l;
wire t1 , t2 , t3 , t4 , t5 , t6 , t7 , t8 , t9 , t10 ,
t11 , t12 , t13 , t14 , t15;
NAND m1(t1 , p[3], p[0]);
NOR m2(t2 , t1 , p[2]);
NAND m3(t3 , p[2], p[0]);
XOR m4(t4 , p[1], t3 );
NOR m5(t5 , p[2], t4 );
NAND m6(t6 , p[1], t4 );
NOR m7(t7 , p[3], t4 );
NOR m8(t8 , t7 , t2 );
XNOR m9(t9 , t5 , t7 );
XNOR m10 (t10 , t9 , p[3]);
NAND m11 (t11 , t6 , t8 );
NAND m12 (t12 , t8 , p[1]);
XNOR m13 (t13 , p[0], t12 );
NAND m14 (t14 , t1 , p[2]);
NAND m15 (t15 , t9 , t14 );
assign l[3] = t13 ;
assign l[2] = t11 ;
assign l[1] = t15 ;
assign l[0] = t10 ;
endmodule


/* bottom part : GF (2^4) multipliers */
module Bottom (g, m, l, e);
input [7:0] g;
input [9:0] m;
input [3:0] l;
output [17:0] e;
wire k4 , k3 , k2 , k1 , k0;
XOR m1(k4 , l[3], l[2]);
XOR m2(k3 , l[3], l[1]);
XOR m3(k2 , l[2], l[0]);
XOR m4(k1 , k3 , k2 );
XOR m5(k0 , l[1], l[0]);
NAND m6(e[17], g[2], l[2]);
NAND m7(e[16], g[3], l[3]);
NAND m8(e[15], m[8], k4 );
NAND m9(e[14], m[2], k1 );
NAND m10 (e[13], m[4], k2 );
NAND m11 (e[12], m[6], k3 );
NAND m12 (e[11], g[0], l[0]);
NAND m13 (e[10], g[1], l[1]);
NAND m14 (e[9], m[0], k0 );
NAND m15 (e[8], g[6], l[2]);
NAND m16 (e[7], g[7], l[3]);
NAND m17 (e[6], m[9], k4 );
NAND m18 (e[5], m[3], k1 );
NAND m19 (e[4], m[5], k2 );
NAND m20 (e[3], m[7], k3 );
NAND m21 (e[2], g[4], l[0]);
NAND m22 (e[1], g[5], l[1]);
NAND m23 (e[0], m[1], k0 );
endmodule


/* output matrix */
module Output (e, Sb );
input [17:0] e;
output [7:0] Sb;
wire E11 , E10 , E9 , E8 , E7 , E6 , E5 , E4 , E3 , E2 , E1 , E0;
wire t1 , t2 , t3 , t4 , t5 , t6 , t7 , t8 , t9 , t10 ,
t11 , t12 , t13 , t14 , t15 , t16 , t17 ;
XOR m1(E11 , e[17], e[16]);
XOR m2(E10 , e[15], e[16]);
XOR m3(E9 , e[14], e[13]);
XOR m4(E8 , e[12], e[13]);
XOR m5(E7 , e[11], e[10]);
XOR m6(E6 , e[9], e[10]);
XOR m7(E5 , e[8], e[7]);
XOR m8(E4 , e[6], e[7]);
XOR m9(E3 , e[5], e[4]);
XOR m10 (E2 , e[3], e[4]);
XOR m11 (E1 , e[2], e[1]);
XOR m12 (E0 , e[0], e[1]);
XOR m13 (t1 , E2 , E0 );
XOR m14 (t2 , E10 , t1 );
XOR m15 (t3 , E8 , t2 );
XOR m16 (t4 , E5 , E1 );
XOR m17 (t5 , E5 , E3 );
XOR m18 (t6 , E7 , t5 );
XOR m19 (t7 , E8 , E6 );
XOR m20 (t8 , E2 , t3 );
XOR m21 (t9 , E4 , t8 );
XOR m22 (t10 , t1 , t5 );
XNOR m23 (t11 , E9 , t6 );
XNOR m24 (t12 , t4 , t7 );
XOR m25 (t13 , t3 , t6 );
XOR m26 (t14 , E11 , t13 );
XNOR m27 (t15 , t1 , t9 );
XOR m28 (t16 , t10 , t12 );
XOR m29 (t17 , t4 , t9 );
assign Sb = {t3 , t15 , t11 , t9 , t17 , t14 , t16 , t12 };
endmodule