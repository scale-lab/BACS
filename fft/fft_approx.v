module fft (clk, enable, d, dataout);

parameter LEN = 8;

input  clk;
input  enable;
input signed [255:0] d;

output reg [255:0] dataout;

reg signed [15:0] dr [(LEN -  1):0];

reg signed [15:0] di [(LEN -  1):0];

wire signed [15:0] xr [(LEN -  1):0];

wire signed [15:0] xi [(LEN -  1):0];

wire signed [15:0] yr [(LEN -  1):0];

wire signed [15:0] yi [(LEN -  1):0];

wire signed [127:0] zr;

wire signed [127:0] zi;

integer j;

wire signed [15:0] temp1r;

wire signed [15:0] temp1i;

wire signed [15:0] temp2r;

wire signed [15:0] temp2i;

wire signed [15:0] temp3r;

wire signed [15:0] temp3i;

wire signed [15:0] temp4r;

wire signed [15:0] temp4i;

wire signed [15:0] temp5r;

wire signed [15:0] temp5i;

wire signed [15:0] temp6r;

wire signed [15:0] temp6i;

wire signed [15:0] temp7r;

wire signed [15:0] temp7i;

wire signed [15:0] temp8r;

wire signed [15:0] temp8i;

wire signed [15:0] temp9r;

wire signed [15:0] temp9i;

wire signed [15:0] temp10r;

wire signed [15:0] temp10i;

wire signed [15:0] temp11r;

wire signed [15:0] temp11i;

wire signed [15:0] temp12r;

wire signed [15:0] temp12i;

wire signed [25:0] tmp1r;

wire signed [25:0] tmp1i;

wire signed [25:0] tmp2r;

wire signed [25:0] tmp2i;

wire signed [25:0] tmp3r;

wire signed [25:0] tmp3i;

wire signed [25:0] tmp4r;

wire signed [25:0] tmp4i;

wire signed [25:0] tmp5r;

wire signed [25:0] tmp5i;

wire signed [25:0] tmp6r;

wire signed [25:0] tmp6i;

wire signed [25:0] tmp7r;

wire signed [25:0] tmp7i;

wire signed [25:0] tmp8r;

wire signed [25:0] tmp8i;

wire signed [25:0] tmp9r;

wire signed [25:0] tmp9i;

wire signed [25:0] tmp10r;

wire signed [25:0] tmp10i;

wire signed [25:0] tmp11r;

wire signed [25:0] tmp11i;

wire signed [25:0] tmp12r;

wire signed [25:0] tmp12i;

wire signed [25:0] f1;

wire signed [25:0] g1;

wire signed [25:0] h1;

wire signed [25:0] i1;

wire signed [25:0] f2;

wire signed [25:0] g2;

wire signed [25:0] h2;

wire signed [25:0] i2;

wire signed [25:0] f3;

wire signed [25:0] g3;

wire signed [25:0] h3;

wire signed [25:0] i3;

wire signed [25:0] f4;

wire signed [25:0] g4;

wire signed [25:0] h4;

wire signed [25:0] i4;

wire signed [25:0] f5;

wire signed [25:0] g5;

wire signed [25:0] h5;

wire signed [25:0] i5;

wire signed [25:0] f6;

wire signed [25:0] g6;

wire signed [25:0] h6;

wire signed [25:0] i6;

wire signed [25:0] g6_tmp;

wire signed [25:0] i6_tmp;

wire signed [25:0] f7;

wire signed [25:0] g7;

wire signed [25:0] h7;

wire signed [25:0] i7;

wire signed [25:0] f8;

wire signed [25:0] g8;

wire signed [25:0] h8;

wire signed [25:0] i8;

wire signed [25:0] g8_tmp;

wire signed [25:0] i8_tmp;

wire signed [25:0] f9;

wire signed [25:0] g9;

wire signed [25:0] h9;

wire signed [25:0] i9;

wire signed [25:0] f10;

wire signed [25:0] g10;

wire signed [25:0] h10;

wire signed [25:0] i10;

wire signed [25:0] f11;

wire signed [25:0] g11;

wire signed [25:0] h11;

wire signed [25:0] i11;

wire signed [25:0] g11_tmp;

wire signed [25:0] i11_tmp;

wire signed [25:0] f12;

wire signed [25:0] g12;

wire signed [25:0] h12;

wire signed [25:0] i12;

wire signed [9:0] f10_tmp;

wire signed [9:0] g10_tmp;

wire signed [9:0] f12_tmp;

wire signed [9:0] g12_tmp;

always @ (posedge clk)
begin

	if  (enable ==  1)  
	begin
	 dr[0][15:0] <=  d[31:16];

	 di[0][15:0] <=  d[15:0];

	 dr[1][15:0] <=  d[159:144];

	 di[1][15:0] <=  d[143:128];

	 dr[2][15:0] <=  d[95:80];

	 di[2][15:0] <=  d[79:64];

	 dr[3][15:0] <=  d[223:208];

	 di[3][15:0] <=  d[207:192];

	 dr[4][15:0] <=  d[63:48];

	 di[4][15:0] <=  d[47:32];

	 dr[5][15:0] <=  d[191:176];

	 di[5][15:0] <=  d[175:160];

	 dr[6][15:0] <=  d[127:112];

	 di[6][15:0] <=  d[111:96];

	 dr[7][15:0] <=  d[255:240];

	 di[7][15:0] <=  d[239:224];

	end
	
	else
	begin
	 dr[0][15:0] <= 0;
	 di[0][15:0] <= 0;
	 dr[1][15:0] <= 0;
	 di[1][15:0] <= 0;
	 dr[2][15:0] <= 0;
	 di[2][15:0] <= 0;
	 dr[3][15:0] <= 0;
	 di[3][15:0] <= 0;
	 dr[4][15:0] <= 0;
	 di[4][15:0] <= 0;
	 dr[5][15:0] <= 0;
	 di[5][15:0] <= 0;
	 dr[6][15:0] <= 0;
	 di[6][15:0] <= 0;
	 dr[7][15:0] <= 0;
	 di[7][15:0] <= 0;
	end
	
end

assign 	f1 =  ({dr[1] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	g1 = 0;
assign 	h1 =  (di[1] <<  8)  ;

assign 	i1 = 0;
assign 	tmp1r =  ({f1[25:2], {1'b0,1'b0}}  - g1);

assign 	tmp1i =  ({h1[25:2], {1'b0,1'b0}}  | {i1[25:2], {1'b0,1'b0}} );

assign 	temp1r =  (tmp1r /  256);

assign 	temp1i =  ({tmp1i[25:1], {1'b0}}  /  256);

assign  xr[0] =  ({dr[0] [15:2], {1'b0,1'b0}}  + {temp1r[15:1], {1'b0}} );

assign  xr[1] =  ({dr[0] [15:3], {1'b0,1'b0,1'b0}}  - {temp1r[15:3], {1'b0,1'b0,1'b0}} );

assign  xi[0] =  (di[0] | {temp1i[15:2], {1'b0,1'b0}} );

assign  xi[1] =  ({di[0] [15:1], {1'b0}}  - {temp1i[15:1], {1'b0}} );

assign 	f2 =  ({dr[3] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	g2 = 0;
assign 	h2 =  ({di[3] [15:1], {1'b0}}  <<  8)  ;

assign 	i2 = 0;
assign 	tmp2r =  ({f2[25:3], {1'b0,1'b0,1'b0}}  - {g2[25:1], {1'b0}} );

assign 	tmp2i =  ({h2[25:2], {1'b0,1'b0}}  + i2);

assign 	temp2r =  (tmp2r /  256);

assign 	temp2i =  (tmp2i /  256);

assign  xr[2] =  ({dr[2] [15:3], {1'b0,1'b0,1'b0}}  + {temp2r[15:1], {1'b0}} );

assign  xr[3] =  ({dr[2] [15:3], {1'b0,1'b0,1'b0}}  - {temp2r[15:3], {1'b0,1'b0,1'b0}} );

assign  xi[2] =  ({di[2] [15:1], {1'b0}}  | {temp2i[15:3], {1'b0,1'b0,1'b0}} );

assign  xi[3] =  ({di[2] [15:3], {1'b0,1'b0,1'b0}}  - {temp2i[15:2], {1'b0,1'b0}} );

assign 	f3 =  ({dr[5] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	g3 = 0;
assign 	h3 =  ({di[5] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	i3 = 0;
assign 	tmp3r =  (f3 - {g3[25:3], {1'b0,1'b0,1'b0}} );

assign 	tmp3i =  (h3 + i3);

assign 	temp3r =  ({tmp3r[25:1], {1'b0}}  /  256);

assign 	temp3i =  ({tmp3i[25:2], {1'b0,1'b0}}  /  256);

assign  xr[4] =  ({dr[4] [15:3], {1'b0,1'b0,1'b0}}  + {temp3r[15:2], {1'b0,1'b0}} );

assign  xr[5] =  ({dr[4] [15:3], {1'b0,1'b0,1'b0}}  - {temp3r[15:1], {1'b0}} );

assign  xi[4] =  ({di[4] [15:3], {1'b0,1'b0,1'b0}}  | {temp3i[15:3], {1'b0,1'b0,1'b0}} );

assign  xi[5] =  ({di[4] [15:1], {1'b0}}  - {temp3i[15:1], {1'b0}} );

assign 	f4 =  ({dr[7] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	g4 = 0;
assign 	h4 =  ({di[7] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	i4 = 0;
assign 	tmp4r =  (f4 - g4);

assign 	tmp4i =  ({h4[25:3], {1'b0,1'b0,1'b0}}  + {i4[25:3], {1'b0,1'b0,1'b0}} );

assign 	temp4r =  ({tmp4r[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign 	temp4i =  ({tmp4i[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign  xr[6] =  ({dr[6] [15:3], {1'b0,1'b0,1'b0}}  + {temp4r[15:2], {1'b0,1'b0}} );

assign  xr[7] =  ({dr[6] [15:3], {1'b0,1'b0,1'b0}}  - {temp4r[15:2], {1'b0,1'b0}} );

assign  xi[6] =  ({di[6] [15:3], {1'b0,1'b0,1'b0}}  + {temp4i[15:1], {1'b0}} );

assign  xi[7] =  ({di[6] [15:3], {1'b0,1'b0,1'b0}}  - {temp4i[15:1], {1'b0}} );

assign 	f5 =  ({xr[2] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	g5 = 0;
assign 	h5 =  (xi[2] <<  8)  ;

assign 	i5 = 0;
assign 	tmp5r =  ({f5[25:3], {1'b0,1'b0,1'b0}}  - {g5[25:1], {1'b0}} );

assign 	tmp5i =  ({h5[25:1], {1'b0}}  + {i5[25:1], {1'b0}} );

assign 	temp5r =  (tmp5r /  256);

assign 	temp5i =  (tmp5i /  256);

assign  yr[0] =  (xr[0] + {temp5r[15:2], {1'b0,1'b0}} );

assign  yr[2] =  ({xr[0] [15:1], {1'b0}}  - temp5r);

assign  yi[0] =  ({xi[0] [15:1], {1'b0}}  + temp5i);

assign  yi[2] =  (xi[0] - temp5i);

assign 	f6 = 0;
assign 	g6_tmp =  ({xi[3] [15:1], {1'b0}}  <<  8)  ;

assign 	g6 = - ((g6_tmp) ); 
assign 	h6 = 0;
assign 	i6_tmp =  ({xr[3] [15:1], {1'b0}}  <<  8)  ;

assign 	i6 = - ((i6_tmp) ); 
assign 	tmp6r =  (f6 - g6);

assign 	tmp6i =  ({h6[25:2], {1'b0,1'b0}}  | i6);

assign 	temp6r =  ({tmp6r[25:2], {1'b0,1'b0}}  /  256);

assign 	temp6i =  (tmp6i /  256);

assign  yr[1] =  ({xr[1] [15:1], {1'b0}}  | {temp6r[15:1], {1'b0}} );

assign  yr[3] =  (xr[1] - {temp6r[15:1], {1'b0}} );

assign  yi[1] =  ({xi[1] [15:3], {1'b0,1'b0,1'b0}}  + temp6i);

assign  yi[3] =  ({xi[1] [15:1], {1'b0}}  - {temp6i[15:2], {1'b0,1'b0}} );

assign 	f7 =  (xr[6] <<  8)  ;

assign 	g7 = 0;
assign 	h7 =  ({xi[6] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	i7 = 0;
assign 	tmp7r =  ({f7[25:2], {1'b0,1'b0}}  - g7);

assign 	tmp7i =  ({h7[25:3], {1'b0,1'b0,1'b0}}  | {i7[25:2], {1'b0,1'b0}} );

assign 	temp7r =  ({tmp7r[25:1], {1'b0}}  /  256);

assign 	temp7i =  ({tmp7i[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign  yr[4] =  ({xr[4] [15:2], {1'b0,1'b0}}  + {temp7r[15:2], {1'b0,1'b0}} );

assign  yr[6] =  ({xr[4] [15:1], {1'b0}}  - {temp7r[15:3], {1'b0,1'b0,1'b0}} );

assign  yi[4] =  ({xi[4] [15:2], {1'b0,1'b0}}  | {temp7i[15:2], {1'b0,1'b0}} );

assign  yi[6] =  ({xi[4] [15:3], {1'b0,1'b0,1'b0}}  - {temp7i[15:2], {1'b0,1'b0}} );

assign 	f8 = 0;
assign 	g8_tmp =  ({xi[7] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	g8 = - ((g8_tmp) ); 
assign 	h8 = 0;
assign 	i8_tmp =  ({xr[7] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	i8 = - ((i8_tmp) ); 
assign 	tmp8r =  ({f8[25:1], {1'b0}}  - {g8[25:3], {1'b0,1'b0,1'b0}} );

assign 	tmp8i =  ({h8[25:2], {1'b0,1'b0}}  | {i8[25:2], {1'b0,1'b0}} );

assign 	temp8r =  (tmp8r /  256);

assign 	temp8i =  ({tmp8i[25:2], {1'b0,1'b0}}  /  256);

assign  yr[5] =  ({xr[5] [15:3], {1'b0,1'b0,1'b0}}  + temp8r);

assign  yr[7] =  ({xr[5] [15:2], {1'b0,1'b0}}  - {temp8r[15:3], {1'b0,1'b0,1'b0}} );

assign  yi[5] =  ({xi[5] [15:2], {1'b0,1'b0}}  + {temp8i[15:3], {1'b0,1'b0,1'b0}} );

assign  yi[7] =  (xi[5] - {temp8i[15:3], {1'b0,1'b0,1'b0}} );

assign 	f9 =  ({yr[4] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	g9 = 0;
assign 	h9 =  ({yi[4] [15:3], {1'b0,1'b0,1'b0}}  <<  8)  ;

assign 	i9 = 0;
assign 	tmp9r =  ({f9[25:1], {1'b0}}  - {g9[25:2], {1'b0,1'b0}} );

assign 	tmp9i =  ({h9[25:2], {1'b0,1'b0}}  + {i9[25:3], {1'b0,1'b0,1'b0}} );

assign 	temp9r =  (tmp9r /  256);

assign 	temp9i =  (tmp9i /  256);

assign  zr[15:0] =  ({yr[0] [15:3], {1'b0,1'b0,1'b0}}  + {temp9r[15:2], {1'b0,1'b0}} );

assign  zr[79:64] =  ({yr[0] [15:1], {1'b0}}  - {temp9r[15:3], {1'b0,1'b0,1'b0}} );

assign  zi[15:0] =  (yi[0] + {temp9i[15:2], {1'b0,1'b0}} );

assign  zi[79:64] =  ({yi[0] [15:3], {1'b0,1'b0,1'b0}}  - {temp9i[15:1], {1'b0}} );

assign 	f10_tmp = 10'b0010110101;
assign 	g10_tmp = 10'b1101001011;
assign 	f10 =  ({f10_tmp[9:3], {1'b0,1'b0,1'b0}}  * yr[5]);

assign 	g10 =  (g10_tmp * yi[5]);

assign 	h10 =  (f10_tmp * yi[5]);

assign 	i10 =  (g10_tmp * yr[5]);

assign 	tmp10r =  ({f10[25:1], {1'b0}}  - g10);

assign 	tmp10i =  ({h10[25:3], {1'b0,1'b0,1'b0}}  + {i10[25:1], {1'b0}} );

assign 	temp10r =  ({tmp10r[25:1], {1'b0}}  /  256);

assign 	temp10i =  ({tmp10i[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign  zr[31:16] =  ({yr[1] [15:2], {1'b0,1'b0}}  + {temp10r[15:1], {1'b0}} );

assign  zr[95:80] =  (yr[1] - temp10r);

assign  zi[31:16] =  (yi[1] + temp10i);

assign  zi[95:80] =  ({yi[1] [15:1], {1'b0}}  - {temp10i[15:2], {1'b0,1'b0}} );

assign 	f11 = 0;
assign 	g11_tmp =  (yi[6] <<  8)  ;

assign 	g11 = - ((g11_tmp) ); 
assign 	h11 = 0;
assign 	i11_tmp =  ({yr[6] [15:2], {1'b0,1'b0}}  <<  8)  ;

assign 	i11 = - ((i11_tmp) ); 
assign 	tmp11r =  ({f11[25:1], {1'b0}}  - g11);

assign 	tmp11i =  (h11 + {i11[25:2], {1'b0,1'b0}} );

assign 	temp11r =  ({tmp11r[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign 	temp11i =  ({tmp11i[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign  zr[47:32] =  (yr[2] | {temp11r[15:3], {1'b0,1'b0,1'b0}} );

assign  zr[111:96] =  (yr[2] - {temp11r[15:1], {1'b0}} );

assign  zi[47:32] =  (yi[2] | {temp11i[15:1], {1'b0}} );

assign  zi[111:96] =  ({yi[2] [15:1], {1'b0}}  - {temp11i[15:2], {1'b0,1'b0}} );

assign 	f12_tmp = 10'b1101001011;
assign 	g12_tmp = 10'b1101001011;
assign 	f12 =  (f12_tmp * yr[7]);

assign 	g12 =  (g12_tmp * yi[7]);

assign 	h12 =  (f12_tmp * yi[7]);

assign 	i12 =  (g12_tmp * yr[7]);

assign 	tmp12r =  (f12 - {g12[25:3], {1'b0,1'b0,1'b0}} );

assign 	tmp12i =  ({h12[25:3], {1'b0,1'b0,1'b0}}  + {i12[25:2], {1'b0,1'b0}} );

assign 	temp12r =  ({tmp12r[25:1], {1'b0}}  /  256);

assign 	temp12i =  ({tmp12i[25:3], {1'b0,1'b0,1'b0}}  /  256);

assign  zr[63:48] =  (yr[3] + {temp12r[15:1], {1'b0}} );

assign  zr[127:112] =  ({yr[3] [15:2], {1'b0,1'b0}}  - {temp12r[15:2], {1'b0,1'b0}} );

assign  zi[63:48] =  (yi[3] | temp12i);

assign  zi[127:112] =  ({yi[3] [15:3], {1'b0,1'b0,1'b0}}  - temp12i);

always @ (posedge clk)
begin
 dataout[15:0] <=  zi[15:0];

 dataout[31:16] <=  zr[15:0];

 dataout[47:32] <=  zi[31:16];

 dataout[63:48] <=  zr[31:16];

 dataout[79:64] <=  zi[47:32];

 dataout[95:80] <=  zr[47:32];

 dataout[111:96] <=  zi[63:48];

 dataout[127:112] <=  zr[63:48];

 dataout[143:128] <=  zi[79:64];

 dataout[159:144] <=  zr[79:64];

 dataout[175:160] <=  zi[95:80];

 dataout[191:176] <=  zr[95:80];

 dataout[207:192] <=  zi[111:96];

 dataout[223:208] <=  zr[111:96];

 dataout[239:224] <=  zi[127:112];

 dataout[255:240] <=  zr[127:112];


end

endmodule
