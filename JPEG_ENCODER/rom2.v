module rom2(clk,addr,data_out);
input clk;
input [3:0] addr;

output reg [10:0] data_out;

always @(posedge clk) 
	case(addr)
		4'b0000: data_out=11'b00000000000;
		4'b0001: data_out=11'b00000100000;
		4'b0010: data_out=11'b00000100000;
		4'b0011: data_out=11'b00001000000;
		4'b0100: data_out=11'b00000100000;
		4'b0101: data_out=11'b00001000000; 
		4'b0110: data_out=11'b00001000000;
		4'b0111: data_out=11'b00001100000;
		4'b1000: data_out=11'b00000100000; 
		4'b1001: data_out=11'b00001000000;
		4'b1010: data_out=11'b00001000000;
		4'b1011: data_out=11'b00001100000;
		4'b1100: data_out=11'b00001000000;
		4'b1101: data_out=11'b00001100000;
		4'b1110: data_out=11'b00001100000;
		4'b1111: data_out=11'b00010000000;
		default: data_out=11'b00000000000;
	endcase 

endmodule 
