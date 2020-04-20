// Benchmark "ex" written by ABC on Wed Apr 15 10:44:50 2020

module ex ( 
    a, b, c, d, e, f, g, h, i, j,
    F  );
  input  a, b, c, d, e, f, g, h, i, j;
  output F;
  assign F = (b & ((f & g & ~a & c) | (e & a & ~c))) | (~b & (~a ^ c)) | ~d | (~h & ~i & ~j & a & c);
endmodule


