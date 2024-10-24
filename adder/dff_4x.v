module d_flip_flop_4x(clk, rst, enable, data_in, data_out);
	input clk, rst, enable;
	input [3:0] data_in;
	
	output [3:0] data_out;
	
	d_flip_flop d3(clk, rst, enable, data_in[3], data_out[3]);
	d_flip_flop d2(clk, rst, enable, data_in[2], data_out[2]);
	d_flip_flop d1(clk, rst, enable, data_in[1], data_out[1]);
	d_flip_flop d0(clk, rst, enable, data_in[0], data_out[0]);
endmodule
