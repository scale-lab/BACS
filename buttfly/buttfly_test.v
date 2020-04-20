module bench_tb();

parameter PERIOD = 1;
parameter INPUT_SIZE = 1000;

parameter INPUT_WIDTH = 16;
parameter OUTPUT_WIDTH = 17;

integer i,f, seed;

reg [INPUT_WIDTH-1:0] a, b;
wire [OUTPUT_WIDTH-1:0] r0, r1;

buttfly DUT (.in_0(a),.in_1(b),.res_0(r0),.res_1(r1));

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
        $display("%3d %3d", r0, r1);
    end
    $finish;
    
end
		   
endmodule
