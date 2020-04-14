`timescale 1ns/1ps

module filetest;
parameter LEN=8;
reg enable,wt, clk;
integer j,f;
reg signed[LEN*32-1:0] d;
wire signed[LEN*32-1:0] dataout;
reg signed[31:0]data[0:LEN-1];

always #(10) clk = ~clk;

initial begin
#0 enable = 0;
#0 wt = 0;
#0 clk = 0;
$readmemh("infft.txt",data);

for (j = 0; j < LEN; j = j+1) begin
    d[32*j+:32]=data[j];
end

#20 enable = 1;
#200 wt = 1;
#10 
$finish;
end

fft DUT(clk, enable,d,dataout);

reg signed[15:0]datr[LEN-1:0];
reg signed[15:0]dati[LEN-1:0];

always@(posedge wt) begin
	for (j = 0; j <LEN; j = j + 1) begin
  	$displayh(dataout[32*j+:32]);
    dati[j]=dataout[j*32+:16];
	datr[j]=dataout[(j*32+16)+:16];
	end
end

endmodule

