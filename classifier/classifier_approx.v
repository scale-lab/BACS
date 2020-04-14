module svm (clk, reset, start, DE_in, DE_out, alpha, weight, data_x, data_y, label);

parameter nSVs = 6;
parameter alpha_BW = 16;
parameter data_BW = 16;
parameter weight_BW = 16;
parameter kernel_BW = 32;
parameter result_BW = 48;
parameter sum_BW = 53;

input  clk;
input  reset;
input  start;
input  DE_in;
input signed [(alpha_BW -  1):0] alpha;
input signed [(weight_BW -  1):0] weight;
input signed [(data_BW -  1):0] data_x;
input signed [(data_BW -  1):0] data_y;

output reg  DE_out;

reg  DE_out1;

reg  DE_out2;

reg  DE_out3;
output reg  label;

reg signed [(alpha_BW -  1):0] alpha_reg;
reg signed [(weight_BW -  1):0] weights [0:(nSVs -  1)];
reg signed [(data_BW -  1):0] support_vectors [0:(nSVs -  1)][0:1];
reg signed [(kernel_BW -  1):0] kernel [0:(nSVs -  1)];
reg signed [(result_BW -  1):0] result [0:(nSVs -  1)];
reg signed [(sum_BW -  1):0] sum_temp [0:(nSVs -  1)];
reg signed [(sum_BW -  1):0] final_sum;

integer i;

parameter IDLE = 0;

parameter START = 1;

parameter WEIGHTS = 2;

parameter SUPPORT_VECS = 3;

parameter COMPUTE = 4;

reg [2:0] current_state;

reg [2:0] next_state;

reg [(nSVs -  1):0] count_SVs;

always @ (posedge clk or posedge reset)
begin

	if  (reset)	count_SVs <= 0;
	else 
	if  (count_SVs == (nSVs -  1)) 	count_SVs <= 0;
	else 
	if  (current_state == WEIGHTS) 	count_SVs <=  (count_SVs -  6'b111111);

end

always @ (posedge clk or posedge reset)
begin

	if  (reset)	current_state <= (IDLE); 
	else	current_state <= (next_state); 
end

always @ (*)
begin

	if  (current_state == IDLE) 
	begin
	if  (start)	next_state = (START); 
	else	next_state = (IDLE); 
	end
	
	else 
	if  (current_state == START) 
	begin
		next_state = (WEIGHTS); 
	end
	
	else 
	if  (current_state == WEIGHTS) 
	begin
	if  (count_SVs == (nSVs -  1)) 	next_state = (COMPUTE); 
	else	next_state = (WEIGHTS); 
	end
	
	else
	begin
	if  (DE_in)	next_state = (COMPUTE); 
	else	next_state = (IDLE); 
	end
	
end

always @ (posedge clk)
begin

	if  (current_state == START) 
	begin
		alpha_reg <= ({alpha[(alpha_BW  - 1):2], {1'b0,1'b0}});

	end
	
end

always @ (posedge clk)
begin

	if  (current_state == WEIGHTS) 
	begin
	 weights [count_SVs] <= (weight); 
	end
	
end

always @ (posedge clk)
begin
	DE_out1 <= (DE_in); 
	DE_out2 <= (DE_out1); 
	DE_out3 <= (DE_out2); 
	DE_out <= (DE_out3); 

end

always @ (posedge clk or posedge reset)
begin

	if  (reset)
	begin
	 kernel[0] <= 1'b0;
	 kernel[1] <= 1'b0;
	 kernel[2] <= 1'b0;
	 kernel[3] <= 1'b0;
	 kernel[4] <= 1'b0;
	 kernel[5] <= 1'b0;
	 result[0] <= 1'b0;
	 result[1] <= 1'b0;
	 result[2] <= 1'b0;
	 result[3] <= 1'b0;
	 result[4] <= 1'b0;
	 result[5] <= 1'b0;
		final_sum <= 1'b0;
		label <= 1'b0;
	end
	
	else
	begin
	 kernel[0] <= $signed ({2'b01,{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}});

	 kernel[1] <= $signed ({data_x,{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}});

	 kernel[2] <= $signed ({data_y,{1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}});

	 kernel[3] <=  (data_x * data_y);

	 kernel[4] <=  (data_x * data_x);

	 kernel[5] <=  (data_y * data_y);

	 result[0] <=  ({weights[0] [(weight_BW  - 1):3], {1'b0,1'b0,1'b0}}  * {kernel[0] [(kernel_BW  - 1):3], {1'b0,1'b0,1'b0}} );

	 result[1] <= 0;
	 result[2] <= 0;
	 result[3] <=  (weights[3] * kernel[3]);

	 result[4] <=  (weights[4] * (kernel[4] + kernel[2]));

	 result[5] <=  (kernel[5] * (weights[1] + weights[5]));

		final_sum <= ({sum_temp[(nSVs  - 1)] [(sum_BW  - 1):2], {1'b0,1'b0}});

		label <= ~ ( final_sum [ (sum_BW -  1) ] );

	end
	
end

always @ (*)
begin
 sum_temp[0] =  result[0];

 sum_temp[1] =  ({sum_temp[0] [(sum_BW  - 1):2], {1'b0,1'b0}}  + {result[1] [(result_BW  - 1):1], {1'b0}} );

 sum_temp[2] =  (sum_temp[1] + {result[2] [(result_BW  - 1):1], {1'b0}} );

 sum_temp[3] =  (sum_temp[2] + result[3]);

 sum_temp[4] =  (sum_temp[3] + result[4]);

 sum_temp[5] =  (sum_temp[4] + result[5]);


end

endmodule
