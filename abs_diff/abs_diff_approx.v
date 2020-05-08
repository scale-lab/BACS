module abs_diff ( 
    a, b, r);
input [7:0] a; 
input [7:0] b;
output [8:0] r;

circuit DUT(
  .g0(a[7]), 
  .g1(a[6]),
  .g2(a[5]),
  .g3(a[4]),
  .g4(a[3]),
  .g5(a[2]),
  .g6(a[1]),
  .g7(a[0]),
  
  .g8(b[7]),
  .g9(b[6]),
  .g10(b[5]),
  .g11(b[4]),
  .g12(b[3]),
  .g13(b[2]),
  .g14(b[1]),
  .g15(b[0]),
      
  .g253(r[8]),  
  .g252(r[7]),  
  .g251(r[6]), 
  .g250(r[5]), 
  .g249(r[4]), 
  .g248(r[3]),  
  .g247(r[2]), 
  .g246(r[1]), 
  .g245(r[0]) 
);
  
endmodule



// Benchmark "circuit" written by ABC on Thu Apr 23 17:40:54 2020

module circuit ( 
    g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15,
    g253, g252, g251, g250, g249, g248, g247, g246, g245  );
  input  g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14,
    g15;
  output g253, g252, g251, g250, g249, g248, g247, g246, g245;
  wire g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29,
    g30, g31, g32, g33, g34, g35, g36, g37, g38, g39, g40, g41, g42, g43,
    g44, g45, g46, g47, g48, g49, g50, g51, g52, g53, g54, g55, g56, g57,
    g58, g59, g60, g61, g62, g63, g64, g65, g66, g67, g68, g69, g70, g71,
    g72, g73, g74, g75, g76, g77, g78, g79, g80, g81, g82, g83, g84, g85,
    g86, g87, g88, g89, g90, g91, g92, g93, g94, g95, g96, g97, g98, g99,
    g100, g101, g102, g103, g104, g105, g106, g107, g108, g109, g110, g111,
    g112, g113, g114, g115, g116, g121, g122, g123, g124, g125, g126, g127,
    g128, g129, g130, g131, g132, g133, g134, g135, g136, g137, g138, g139,
    g140, g141, g142, g143, g149, g150, g151, g152, g153, g154, g155, g156,
    g157, g158, g159, g160, g161, g162, g163, g164, g165, g166, g167, g168,
    g170, g171, g172, g173, g174, g176, g178, g179, g180, g181, g182, g184,
    g191, g192, g193, g194, g195, g199, g200, g201, g202, g203, g204, g205,
    g206, g207, g209, g210, g212, g214, g215, g216, g217, g218, g219, g220,
    g222, g223, g224, g228, g229, g230, g235, g240, g241, g242, g243, \0 ;
  assign g16 = ~g15;
  assign g17 = ~g7 | ~g16;
  assign g18 = ~g7;
  assign g19 = ~g15 | ~g18;
  assign g20 = ~g17 | ~g19;
  assign g21 = ~g9;
  assign g22 = ~g10;
  assign g23 = ~g11;
  assign g24 = ~g12;
  assign g25 = ~g13;
  assign g26 = ~g14;
  assign g27 = ~g0;
  assign g28 = ~g7;
  assign g29 = ~g15 | ~g28;
  assign g30 = ~g4;
  assign g31 = ~g12 | ~g30;
  assign g32 = ~g6;
  assign g33 = ~g15 | ~g18;
  assign g34 = ~g13;
  assign g35 = ~g5 | ~g34;
  assign g36 = ~g6;
  assign g37 = ~g14 | ~g32;
  assign g38 = ~g12 | ~g30;
  assign g39 = ~g5;
  assign g40 = ~g13 & ~g39;
  assign g41 = ~g4;
  assign g42 = ~g6 | ~g26;
  assign g43 = ~g37 | ~g42;
  assign g44 = ~g5 & ~g25;
  assign g45 = ~g4 | ~g24;
  assign g46 = ~g3 | ~g23;
  assign g47 = ~g3 & ~g23;
  assign g48 = ~g2 | ~g22;
  assign g49 = ~g2 & ~g22;
  assign g50 = ~g47 & ~g49;
  assign g51 = ~g1 | ~g21;
  assign g52 = ~g1 & ~g21;
  assign g53 = ~g8 | ~g27;
  assign g54 = ~g8 & ~g27;
  assign g55 = ~g52 & ~g54;
  assign g56 = ~g50 | ~g55;
  assign g57 = ~g20;
  assign g58 = ~g33 | ~g43;
  assign g59 = ~g43;
  assign g60 = ~g44;
  assign g61 = ~g31 | ~g40;
  assign g62 = ~g45 | ~g61;
  assign g63 = ~g62;
  assign g64 = ~g47;
  assign g65 = ~g49;
  assign g66 = ~g46;
  assign g67 = ~g65 | ~g66;
  assign g68 = ~g48 | ~g67;
  assign g69 = ~g68;
  assign g70 = ~g51 | ~g52;
  assign g71 = ~g54;
  assign g72 = ~g51;
  assign g73 = ~g71 | ~g72;
  assign g74 = ~g53 | ~g73;
  assign g75 = ~g74;
  assign g76 = ~g55;
  assign g77 = ~g75 | ~g76;
  assign g78 = ~g69 | ~g75;
  assign g79 = ~g77 | ~g78;
  assign g80 = ~g56;
  assign g81 = ~g52;
  assign g82 = ~g33;
  assign g83 = ~g14 | ~g36;
  assign g84 = ~g12 | ~g41;
  assign g85 = ~g29 | ~g83;
  assign g86 = ~g51 | ~g69;
  assign g87 = ~g38 | ~g60;
  assign g88 = ~g35 | ~g60;
  assign g89 = ~g45 | ~g84;
  assign g90 = ~g46 | ~g64;
  assign g91 = ~g48 | ~g65;
  assign g92 = ~g51 | ~g81;
  assign g93 = ~g50 | ~g81;
  assign g94 = ~g53 | ~g71;
  assign g95 = ~g59 | ~g82;
  assign g96 = ~g58 | ~g95;
  assign g97 = ~g29 | ~g83;
  assign g98 = ~g42 | ~g85;
  assign g99 = ~g98;
  assign g100 = ~g88;
  assign g101 = ~g89;
  assign g102 = ~g63 | ~g99;
  assign g103 = ~g63 | ~g87;
  assign g104 = ~g102 | ~g103;
  assign g105 = ~g90;
  assign g106 = ~g91;
  assign g107 = ~g92;
  assign g108 = ~g70 | ~g86;
  assign g109 = ~g93;
  assign g110 = ~g94;
  assign g111 = ~g102 | ~g103;
  assign g112 = ~g42 | ~g97;
  assign g113 = ~g104;
  assign g114 = ~g112;
  assign g115 = ~g104;
  assign g116 = ~g96;
  assign g121 = ~g57 | ~g116;
  assign g122 = ~g100 | ~g114;
  assign g123 = ~g88 | ~g112;
  assign g124 = ~g122 | ~g123;
  assign g125 = ~g60 | ~g112;
  assign g126 = ~g35 | ~g125;
  assign g127 = ~g126;
  assign g128 = ~g101 | ~g127;
  assign g129 = ~g89 | ~g126;
  assign g130 = ~g128 | ~g129;
  assign g131 = ~g105 | ~g115;
  assign g132 = ~g90 | ~g111;
  assign g133 = ~g131 | ~g132;
  assign g134 = ~g133;
  assign g135 = ~g64 | ~g113;
  assign g136 = ~g46 | ~g135;
  assign g137 = ~g136;
  assign g138 = ~g106 | ~g137;
  assign g139 = ~g91 | ~g136;
  assign g140 = ~g138 | ~g139;
  assign g141 = ~g50 | ~g113;
  assign g142 = ~g111;
  assign g143 = ~g69 | ~g141;
  assign g149 = ~g130;
  assign g150 = ~g134;
  assign g151 = ~g140;
  assign g152 = ~g149;
  assign g153 = ~g150;
  assign g154 = ~g121 & ~g124;
  assign g155 = ~g130 & ~g134;
  assign g156 = ~g154 | ~g155;
  assign g157 = ~g92 | ~g143;
  assign g158 = ~g109 | ~g142;
  assign g159 = ~g108 | ~g158;
  assign g160 = ~g159;
  assign g161 = ~g110 | ~g160;
  assign g162 = ~g94 | ~g159;
  assign g163 = ~g161 | ~g162;
  assign g164 = ~g80 | ~g142;
  assign g165 = ~g79 | ~g164;
  assign g166 = ~g165;
  assign g167 = ~g143;
  assign g168 = ~g154;
  assign g170 = ~g156;
  assign g171 = ~g163;
  assign g172 = ~g156;
  assign g173 = ~g151;
  assign g174 = ~g170;
  assign g176 = ~g151 | ~g170;
  assign g178 = ~g152 & ~g168;
  assign g179 = ~g166;
  assign g180 = ~g179;
  assign g181 = ~g179;
  assign g182 = ~g179;
  assign g184 = ~g182;
  assign g191 = ~g134 | ~g184;
  assign g192 = ~g140 | ~g184;
  assign g193 = ~g163 | ~g184;
  assign g194 = ~g107 | ~g167;
  assign g195 = ~g157 | ~g194;
  assign g199 = ~g178;
  assign g200 = ~g153 | ~g199;
  assign g201 = ~g150 | ~g178;
  assign g202 = ~g200 | ~g201;
  assign g203 = ~g202;
  assign g204 = ~g170 | ~g173;
  assign g205 = ~g151 | ~g174;
  assign g206 = ~g204 | ~g205;
  assign g207 = ~g195;
  assign g209 = ~g207;
  assign g210 = ~g176;
  assign g212 = ~g140 & ~g195;
  assign g214 = ~g181 | ~g203;
  assign g215 = ~g180 | ~g206;
  assign g216 = ~g184 | ~g195;
  assign g217 = ~g176 | ~g209;
  assign g218 = ~g207 | ~g210;
  assign g219 = ~g217 | ~g218;
  assign g220 = ~g219;
  assign g222 = ~g172 | ~g212;
  assign g223 = ~g180 | ~g220;
  assign g224 = ~g163 | ~g222;
  assign g228 = ~g171 | ~\0 ;
  assign g229 = ~g224 | ~g228;
  assign g230 = ~g229;
  assign g235 = ~g181 | ~g230;
  assign g240 = ~g191 | ~g214;
  assign g241 = ~g192 | ~g215;
  assign g242 = ~g216 | ~g223;
  assign g243 = ~g193 | ~g235;
  assign g245 = \0 ;
  assign g246 = \0 ;
  assign g247 = \0 ;
  assign g248 = \0 ;
  assign g249 = g240;
  assign g250 = g241;
  assign g251 = g242;
  assign g252 = g243;
  assign g253 = \0 ;
  assign \0  = 1'b0;
endmodule


