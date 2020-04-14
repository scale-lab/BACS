`timescale 1ns/1ps
module but_tb();

parameter PERIOD = 4;
parameter INPUT_SIZE = 1000;

parameter INPUT_WIDTH = 8;
parameter OUTPUT_WIDTH = 9;

integer i,f, seed;

reg [INPUT_WIDTH-1:0] a, b;
wire [OUTPUT_WIDTH-1:0] sum, diff;

but DUT (.a(a),.b(b),.sum(sum),.diff(diff));

initial
begin
    seed = 0;
	a = 0;
	b = 0;
	#(PERIOD/2);
	
    f = $fopen("acc_output.txt");

    for(i=0; i<INPUT_SIZE; i=i+1)
    begin           
        a = $urandom(seed)%(2**INPUT_WIDTH);
        b = $urandom(seed)%(2**INPUT_WIDTH);
        $display("%h\t%h\n", a, b);
		#(PERIOD);
        $fwrite(f,"%3d\t%3d\n", sum, diff);
    end
    $fclose(f);
    $finish;
    
end
		   
endmodule
