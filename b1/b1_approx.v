module b1(pi0, pi1, pi2, po0, po1, po2, po3);
input pi0, pi1, pi2;
output po0, po1, po2, po3;
wire k0, k1, k2;
b1_w3 DUT1 (pi0, pi1, pi2, k0, k1, k2);
b1_h3 DUT2 (k0, k1, k2, po0, po1, po2, po3);
endmodule

module b1_w3(in2, in1, in0, k2, k1, k0);
input in2, in1, in0;
output k2, k1, k0;
assign k0 =   ~in1 ^ ~in0;
assign k1 =   in2 ? (~in1 & ~in0) : (in1 & in0);
assign k2 =   ~in2;
endmodule

module b1_h3(k2, k1, k0, out3, out2, out1, out0);
input k2, k1, k0;
output out3, out2, out1, out0;
assign out0 = 0;
assign out1 = k0;
assign out2 = k1;
assign out3 = k2;
endmodule
