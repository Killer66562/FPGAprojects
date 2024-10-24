module parser(clk, cmd_in, num_out, err_out);
	input clk;
	input [7:0] cmd_in;
	
	output reg err_out;
	output [1:0] num_out;
	
	reg [1:0] reg0, reg1, reg2, reg3, reg_tmp;
	
	wire [2:0] opcode, num1, num2, reg_id;
	
	assign opcode = cmd_in[7:6];
	assign num1 = cmd_in[5:4];
	assign num2 = cmd_in[3:2];
	assign reg_id = cmd_in[1:0];
	
	assign num_out = 
	(reg_id == 2'b00) ? reg0 :
	(reg_id == 2'b01) ? reg0 :
	(reg_id == 2'b10) ? reg0 :
	(reg_id == 2'b11) ? reg0 :
	reg_tmp;
	
	always @(posedge clk) begin
		case (opcode)
			2'b00: reg_tmp = num1 + num2;
			2'b01: reg_tmp = num1 - num2;
			2'b10: reg_tmp = num1 * num2;
			2'b11: begin
				if (num2 == 2'b00) err_out = 1'b1;
				else reg_tmp = num1 / num2;
			end
			default: err_out = 1'b1;
		endcase
		
		case (reg_id)
			2'b00: reg0 = reg_tmp;
			2'b01: reg1 = reg_tmp;
			2'b10: reg2 = reg_tmp;
			2'b11: reg3 = reg_tmp;
		endcase
	end
endmodule
