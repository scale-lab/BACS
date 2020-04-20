`timescale 1ns/1ps
module bench_tb();

parameter PERIOD = 1;
parameter INPUT_SIZE = 1000;

parameter INPUT_WIDTH = 8;
parameter OUTPUT_WIDTH = 9;

integer i,f, seed;

reg [INPUT_WIDTH-1:0] a, b;
wire [OUTPUT_WIDTH-1:0] r;

abs_diff DUT (.in_0(a),.in_1(b),.res(r));

initial
begin
  seed = 0;
	a = 0;
	b = 0;
	#(PERIOD/2);

    for(i=0; i<INPUT_SIZE; i=i+1)
    begin           
        a = $urandom(seed);
        seed = seed + 1;
        b = $urandom(seed);
        seed = seed + 1;
	      #(PERIOD);
        $display("%3d", r);
    end
    $finish;
    
end
		  
endmodule
