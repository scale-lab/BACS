module perceptron_test;

parameter nTest		= 1000;

parameter nSVs 		= 6;
parameter alpha_BW	= 16;
parameter data_BW	= 16;
parameter weight_BW	= 16;

reg clk, reset, start, DE_in;
wire label, DE_out;

parameter PERIOD = 20;
always #(PERIOD/2) clk = ~clk;

reg [alpha_BW-1:0] alpha [0:0];
reg [weight_BW-1:0] weight_rom [0:nSVs-1];
reg [data_BW-1:0] input_rom [0:(nTest*2)-1];

reg signed [weight_BW-1:0] weight;
reg signed [data_BW-1:0] data_x, data_y;

integer i,j,k,out;

// read inputs
initial
begin
	$readmemb("init_alpha.txt",alpha);				// 16 bits, 11 bits decimal
	$readmemb("init_weight.txt",weight_rom);  		// 16 bits, 15 bits decimal
	$readmemb("init_input.txt",input_rom);			// 16 bits, 13 bits decimal
end

// write output
initial
begin
	
	wait(DE_out);
	#(PERIOD/4);
	
	while(DE_out)
	begin
		$display("%1b", label);
		#PERIOD;
	end
	
	$finish;
end

initial
begin
	clk = 1;
	#(PERIOD/10);
	
	reset = 1;
	start = 0;
	DE_in = 0;
	#PERIOD;

	reset = 0;
	start = 1;
	#PERIOD;
	
	// read alpha
	#PERIOD;
	
	for (i=0; i<nSVs; i=i+1)
	begin
		weight = weight_rom[i];
		#PERIOD;
	end
	
	DE_in = 1;
	for (k=0; k<nTest*2; k=k+2)
	begin
		data_x = input_rom[k];
		data_y = input_rom[k+1];
		#PERIOD;
	end 
	DE_in = 0;
end


svm #( 
	.nSVs(nSVs), 
	.alpha_BW(alpha_BW), 
	.data_BW(data_BW), 
	.weight_BW(weight_BW)) 
	svm_main (
		.clk(clk), 
		.reset(reset),
		.start(start),
		.DE_in(DE_in), 
		.DE_out(DE_out),
		.alpha(alpha[0]),
		.weight(weight),
		.data_x(data_x),
		.data_y(data_y),
		.label(label)
      );
	  
endmodule
