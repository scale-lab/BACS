// This is the top Module for FFT algorithm.
module fft(clk, enable, d, dataout);
parameter LEN=8;
input clk, enable;
input signed[255:0] d;
output reg [255:0] dataout;

reg signed[15:0]dr[LEN-1:0];
reg signed[15:0]di[LEN-1:0];
wire signed[15:0]xr[LEN-1:0];
wire signed[15:0]xi[LEN-1:0];
wire signed[15:0]yr[LEN-1:0];
wire signed[15:0]yi[LEN-1:0];
wire signed[127:0]zr;
wire signed[127:0]zi;

integer j;
wire signed[15:0] temp1r,temp1i,temp2r,temp2i; 
wire signed[15:0] temp3r,temp3i,temp4r,temp4i;
wire signed[15:0] temp5r,temp5i,temp6r,temp6i; 
wire signed[15:0] temp7r,temp7i,temp8r,temp8i; 
wire signed[15:0] temp9r,temp9i,temp10r,temp10i; 
wire signed[15:0] temp11r,temp11i,temp12r,temp12i;

wire signed[25:0] tmp1r,tmp1i,tmp2r,tmp2i; 
wire signed[25:0] tmp3r,tmp3i,tmp4r,tmp4i;
wire signed[25:0] tmp5r,tmp5i,tmp6r,tmp6i; 
wire signed[25:0] tmp7r,tmp7i,tmp8r,tmp8i; 
wire signed[25:0] tmp9r,tmp9i,tmp10r,tmp10i; 
wire signed[25:0] tmp11r,tmp11i,tmp12r,tmp12i;

wire signed[25:0] f1,g1,h1,i1;
wire signed[25:0] f2,g2,h2,i2;
wire signed[25:0] f3,g3,h3,i3;
wire signed[25:0] f4,g4,h4,i4;
wire signed[25:0] f5,g5,h5,i5;
wire signed[25:0] f6,g6,h6,i6,g6_tmp, i6_tmp;
wire signed[25:0] f7,g7,h7,i7;
wire signed[25:0] f8,g8,h8,i8,g8_tmp, i8_tmp;
wire signed[25:0] f9,g9,h9,i9;
wire signed[25:0] f10,g10,h10,i10;
wire signed[25:0] f11,g11,h11,i11, g11_tmp, i11_tmp;
wire signed[25:0] f12,g12,h12,i12;

wire signed[9:0] f10_tmp, g10_tmp;
wire signed[9:0] f12_tmp, g12_tmp;

always @(posedge clk)
begin

    if (enable==1)
    begin
        dr[0][15:0]<=d[31:16]; //datar[0];
        di[0][15:0]<=d[15:0]; //datai[0];
        dr[1][15:0]<=d[159:144]; //datar[4];
        di[1][15:0]<=d[143:128]; //datai[4];
        dr[2][15:0]<=d[95:80]; //datar[2];
        di[2][15:0]<=d[79:64]; //datai[2];
        dr[3][15:0]<=d[223:208]; //datar[6];
        di[3][15:0]<=d[207:192]; //datai[6];
        dr[4][15:0]<=d[63:48]; //datar[1];
        di[4][15:0]<=d[47:32]; //datai[1];
        dr[5][15:0]<=d[191:176]; //datar[5];
        di[5][15:0]<=d[175:160]; //datai[5];
        dr[6][15:0]<=d[127:112]; //datar[3];
        di[6][15:0]<=d[111:96]; //datai[3];
        dr[7][15:0]<=d[255:240]; //datar[7];
        di[7][15:0]<=d[239:224]; //datai[7];
    end
    else
    begin
        dr[0][15:0]<=0;
        di[0][15:0]<=0;
        dr[1][15:0]<=0;
        di[1][15:0]<=0;
        dr[2][15:0]<=0;
        di[2][15:0]<=0;
        dr[3][15:0]<=0;
        di[3][15:0]<=0;
        dr[4][15:0]<=0;
        di[4][15:0]<=0;
        dr[5][15:0]<=0;
        di[5][15:0]<=0;
        dr[6][15:0]<=0;
        di[6][15:0]<=0;
        dr[7][15:0]<=0;
        di[7][15:0]<=0;
    end
end

///////////////// FIRST STAGE: /////////////////////
assign	f1 = dr[1]<<8; assign g1 = 0;
assign	h1 = di[1]<<8; assign i1 = 0;
assign  tmp1r = f1 - g1;
assign  tmp1i = h1 + i1;
assign	temp1r = (tmp1r /(256));
assign	temp1i = (tmp1i /(256));
assign  xr[0] = dr[0] + temp1r;
assign	xr[1] = dr[0] - temp1r;
assign	xi[0] = di[0] + temp1i;
assign	xi[1] = di[0] - temp1i;
	
assign	f2 = dr[3]<<8; assign g2 = 0;
assign	h2 = di[3]<<8; assign i2 = 0;
assign  tmp2r = f2 - g2;
assign  tmp2i = h2 + i2;
assign	temp2r = (tmp2r /(256));
assign	temp2i = (tmp2i /(256));
assign	xr[2] = dr[2] + temp2r;
assign	xr[3] = dr[2] - temp2r;
assign	xi[2] = di[2] + temp2i;
assign	xi[3] = di[2] - temp2i;
	
assign  f3 = dr[5]<<8; assign g3 = 0;
assign  h3 = di[5]<<8; assign i3 = 0;
assign  tmp3r = f3 - g3;
assign  tmp3i = h3 + i3;
assign	temp3r = (tmp3r /(256));
assign	temp3i = (tmp3i /(256));
assign	xr[4] = dr[4] + temp3r;
assign	xr[5] = dr[4] - temp3r;
assign	xi[4] = di[4] + temp3i;
assign	xi[5] = di[4] - temp3i;

assign	f4 = dr[7]<<8; assign g4 = 0;
assign	h4 = di[7]<<8; assign i4 = 0;
assign  tmp4r = f4 - g4;
assign  tmp4i = h4 + i4;
assign	temp4r = (tmp4r /(256));
assign	temp4i = (tmp4i /(256));
assign	xr[6] = dr[6] + temp4r;
assign	xr[7] = dr[6] - temp4r;
assign	xi[6] = di[6] + temp4i;
assign	xi[7] = di[6] - temp4i;
	
/////////////////////// SECOND STAGE: /////////////////////////////

assign	f5 = xr[2]<<8; assign g5 = 0;
assign	h5 = xi[2]<<8; assign i5 = 0;
assign  tmp5r = f5 - g5;
assign  tmp5i = h5 + i5;
assign	temp5r = (tmp5r /(256));
assign	temp5i = (tmp5i /(256));
assign	yr[0] = xr[0] + temp5r;
assign	yr[2] = xr[0] - temp5r;
assign	yi[0] = xi[0] + temp5i;
assign	yi[2] = xi[0] - temp5i;

assign	f6 = 0; assign g6_tmp = (xi[3]<<8); assign g6 = -(g6_tmp);
assign	h6 = 0; assign i6_tmp = (xr[3]<<8); assign i6 = -(i6_tmp);
assign  tmp6r = f6 - g6;
assign  tmp6i = h6 + i6;
assign	temp6r = (tmp6r /(256));
assign	temp6i = (tmp6i /(256));
assign	yr[1] = xr[1] + temp6r;
assign	yr[3] = xr[1] - temp6r;
assign	yi[1] = xi[1] + temp6i;
assign	yi[3] = xi[1] - temp6i;

assign	f7 = xr[6]<<8; assign g7 = 0;
assign	h7 = xi[6]<<8; assign i7 = 0;
assign  tmp7r = f7 - g7;
assign  tmp7i = h7 + i7;
assign	temp7r = (tmp7r /(256));
assign	temp7i = (tmp7i /(256));
assign	yr[4] = xr[4] + temp7r;
assign	yr[6] = xr[4] - temp7r;
assign	yi[4] = xi[4] + temp7i;
assign	yi[6] = xi[4] - temp7i;

assign	f8 = 0; assign g8_tmp = (xi[7]<<8); assign g8 = -(g8_tmp);
assign	h8 = 0; assign i8_tmp = (xr[7]<<8); assign i8 = -(i8_tmp);
assign  tmp8r = f8 - g8;
assign  tmp8i = h8 + i8;
assign	temp8r = (tmp8r /(256));
assign	temp8i = (tmp8i /(256));
assign	yr[5] = xr[5] + temp8r;
assign	yr[7] = xr[5] - temp8r;
assign	yi[5] = xi[5] + temp8i;
assign	yi[7] = xi[5] - temp8i;

////////////////////// THIRD STAGE: /////////////////////////////

assign	f9 = yr[4]<<8; assign g9 = 0;
assign	h9 = yi[4]<<8; assign i9 = 0;
assign  tmp9r = f9 - g9;
assign  tmp9i = h9 + i9;
assign	temp9r = (tmp9r /(256));
assign	temp9i = (tmp9i /(256));
assign	zr[15:0] = yr[0] + temp9r;
assign	zr[79:64] = yr[0] - temp9r;
assign	zi[15:0] = yi[0] + temp9i;
assign	zi[79:64] = yi[0] - temp9i;

assign  f10_tmp = 10'b0010110101; 
assign  g10_tmp = 10'b1101001011;
assign	f10 = f10_tmp*yr[5]; assign g10 = g10_tmp*yi[5];
assign	h10 = f10_tmp*yi[5]; assign i10 = g10_tmp*yr[5];
assign  tmp10r = f10 - g10;
assign  tmp10i = h10 + i10;
assign	temp10r = (tmp10r /(256));
assign	temp10i = (tmp10i /(256));
assign	zr[31:16] = yr[1] + temp10r;
assign	zr[95:80] = yr[1] - temp10r;
assign	zi[31:16] = yi[1] + temp10i;
assign	zi[95:80] = yi[1] - temp10i;

assign	f11 = 0; assign g11_tmp = (yi[6]<<8); assign g11 = -(g11_tmp);
assign	h11 = 0; assign i11_tmp = (yr[6]<<8); assign i11 = -(i11_tmp);
assign  tmp11r = f11 - g11;
assign  tmp11i = h11 + i11;
assign	temp11r = (tmp11r /(256));
assign	temp11i = (tmp11i /(256));
assign	zr[47:32] = yr[2] + temp11r;
assign	zr[111:96] = yr[2] - temp11r;
assign	zi[47:32] = yi[2] + temp11i;
assign	zi[111:96] = yi[2] - temp11i;

assign  f12_tmp = 10'b1101001011;
assign  g12_tmp = 10'b1101001011;
assign	f12 = f12_tmp*yr[7]; assign g12 = g12_tmp*yi[7];
assign	h12 = f12_tmp*yi[7]; assign i12 = g12_tmp*yr[7];
assign  tmp12r = f12 - g12;
assign  tmp12i = h12 + i12;
assign	temp12r = (tmp12r /(256));
assign	temp12i = (tmp12i /(256));
assign	zr[63:48] = yr[3] + temp12r;
assign	zr[127:112] = yr[3] - temp12r;
assign	zi[63:48] = yi[3] + temp12i;
assign	zi[127:112] = yi[3] - temp12i;


always @(posedge clk)
begin
	dataout[15:0] <= zi[15:0];
	dataout[31:16] <= zr[15:0];
	dataout[47:32] <= zi[31:16];
	dataout[63:48] <= zr[31:16];
	dataout[79:64] <= zi[47:32];
	dataout[95:80] <= zr[47:32];
	dataout[111:96] <= zi[63:48];
	dataout[127:112] <= zr[63:48];
	dataout[143:128] <= zi[79:64];
	dataout[159:144] <= zr[79:64];
	dataout[175:160] <= zi[95:80];
	dataout[191:176] <= zr[95:80];
	dataout[207:192] <= zi[111:96];
	dataout[223:208] <= zr[111:96];
	dataout[239:224] <= zi[127:112];
	dataout[255:240] <= zr[127:112];
end


endmodule
