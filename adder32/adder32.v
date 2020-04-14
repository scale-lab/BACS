module adder32 (a,b,r);
input [31:0] a,b;
output [32:0] r;

assign r = a+b;

endmodule
