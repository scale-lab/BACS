`timescale 1ns/1ps
module adder32_tb();

parameter PERIOD = 4;
parameter INPUT_SIZE = 1000;

parameter INPUT_WIDTH = 32;
parameter OUTPUT_WIDTH = 33;

integer i,f, seed;

reg [INPUT_WIDTH-1:0] a, b;
wire [OUTPUT_WIDTH-1:0] r;

adder32 DUT (.a(a),.b(b),.r(r));

initial
begin
    seed = 0;
	a = 0;
	b = 0;
	#(PERIOD/2);
	
 //   f = $fopen("acc_output.txt");

    for(i=0; i<INPUT_SIZE; i=i+1)
    begin           
        a = $urandom(seed);
        b = $urandom(seed);
       // $display("%h\t%h\n", a, b);
		#(PERIOD);
        $display("%3d", r);
    end
  //  $fclose(f);
    $finish;
    
end
		   
endmodule
