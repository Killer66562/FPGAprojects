module d_flip_flop(clk, rst, enable, data_in, data_out);
	input clk, rst, enable, data_in;
	
	output reg data_out;
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) data_out = 1'b0;
		else if (enable == 1'b1) data_out = data_in;
	end
endmodule
