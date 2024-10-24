module adder(clk, a, b, s);
	input clk;
	input [3:0] a, b;
	
	output reg [4:0] s;
	
	wire [3:0] g, p;
	wire [4:0] cin;
	
	assign g[0] = a[0] & b[0];
	assign g[1] = a[1] & b[1];
	assign g[2] = a[2] & b[2];
	assign g[3] = a[3] & b[3];
	
	assign p[0] = a[0] ^ b[0];
	assign p[1] = a[1] ^ b[1];
	assign p[2] = a[2] ^ b[2];
	assign p[3] = a[3] ^ b[3];
	
	assign cin[0] = 1'b0;
	assign cin[1] = g[0] | (p[0] & cin[0]);
	assign cin[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin[0]);
	assign cin[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin[0]);
	assign cin[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin[0]);
	
	always @(posedge clk) begin
		s[0] <= a[0] + b[0] + cin[0];
		s[1] <= a[1] + b[1] + cin[1];
		s[2] <= a[2] + b[2] + cin[2];
		s[3] <= a[3] + b[3] + cin[3];
		s[4] <= cin[4];
	end
endmodule
