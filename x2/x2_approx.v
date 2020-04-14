module x2(pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, po0, po1, po2, po3, po4, po5, po6);
input pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09;
output po0, po1, po2, po3, po4, po5, po6;
wire k0, k1, k2, k3, k4, k5;
x2_w6 DUT1 (pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, k0, k1, k2, k3, k4, k5);
x2_h6 DUT2 (k0, k1, k2, k3, k4, k5, po0, po1, po2, po3, po4, po5, po6);
endmodule

module x2_w6(in9, in8, in7, in6, in5, in4, in3, in2, in1, in0, k5, k4, k3, k2, k1, k0);
input in9, in8, in7, in6, in5, in4, in3, in2, in1, in0;
output k5, k4, k3, k2, k1, k0;
assign k0 = 0;
assign k1 =   in6 & in7 & ~in9 & ~in8;
assign k2 =   in8 | (in7 ^ in9);
assign k3 =   in6 & ((~in1 & ~in0 & in2 & in9 & (~in8 ^ in7)) | (in7 & ~in9 & (~in8 | (~in4 & in3))));
assign k4 =   in6 & ((in8 & ((~in7 & (~in5 | ~in9)) | (in9 & in7 & (in0 | in1 | in2)))) | (in9 & ~in7 & ~in8));
assign k5 =   (in8 & ((in4 & in3 & ~in9 & in7) | (in5 & in9 & ~in7))) | (~in8 & (~in9 ^ in7)) | ~in6 | (~in2 & ~in1 & ~in0 & in9 & in7);
endmodule

module x2_h6(k5, k4, k3, k2, k1, k0, out6, out5, out4, out3, out2, out1, out0);
input k5, k4, k3, k2, k1, k0;
output out6, out5, out4, out3, out2, out1, out0;
assign out0 = k5 | k4 | k1;
assign out1 = k2;
assign out2 = k5;
assign out3 = k5 | k4 | k3 | k2 | k1;
assign out4 = k5 | k4;
assign out5 = k5 | k3;
assign out6 = k5;
endmodule
