`timescale 1ns/1ps
module sad_tb();

parameter PERIOD = 4;
parameter INPUT_SIZE = 1000;

parameter INPUT_WIDTH = 8;
parameter OUTPUT_WIDTH = 33;

integer i,file, seed;

reg clk, rst;

reg [INPUT_WIDTH-1:0] a, b, c, d, e, f;
wire [OUTPUT_WIDTH-1:0] out;

sad DUT (.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.out(out),.clk(clk),.rst(rst));

always
begin
    #(PERIOD/2) clk = ~clk;
end

initial
begin
    clk = 0;
    rst = 0;
    #(5*PERIOD) rst = 1;
    seed = 0;
	a = 0;
	b = 0;
	#(PERIOD);
	
    file = $fopen("acc_output.txt");

    for(i=0; i<INPUT_SIZE; i=i+1)
    begin           
        a = $urandom(seed)%(2**INPUT_WIDTH);
        b = $urandom(seed)%(2**INPUT_WIDTH);
        c = $urandom(seed)%(2**INPUT_WIDTH);
        d = $urandom(seed)%(2**INPUT_WIDTH);
        e = $urandom(seed)%(2**INPUT_WIDTH);
        f = $urandom(seed)%(2**INPUT_WIDTH);
        $display("%h\t%h\t%h\t%h\t%h\t%h\n", a, b, c, d, e, f);
		#(PERIOD);
        $fwrite(file,"%3d\n", out);
    end
    $fclose(file);
    $finish;
    
end
		   
endmodule
