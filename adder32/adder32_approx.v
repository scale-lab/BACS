module adder32 (a,b,r);
input [31:0] a,b;
output [32:0] r;

assign r[32:16] = a[31:16]+b[31:16];
assign r[15:0]= a[15:0]|b[15:0];

endmodule
