module rom1(clk,addr,data_out);
input clk;
input [3:0] addr;

output reg [10:0] data_out;

always @(posedge clk) 
	case(addr)
		4'b0000: data_out=11'b00111110110;
		4'b0001: data_out=11'b00110101001;
		4'b0010: data_out=11'b00100011100;
		4'b0011: data_out=11'b00000100100;
		4'b0100: data_out=11'b11110011101;
		4'b0101: data_out=11'b00101101010; 
		4'b0110: data_out=11'b00101101010;
		4'b0111: data_out=11'b00101101010;
		4'b1000: data_out=11'b00101101010; 
		4'b1001: data_out=11'b00101101010;
		4'b1010: data_out=11'b00101101010;
		4'b1011: data_out=11'b00101101010;
		4'b1100: data_out=11'b00101101010;
		4'b1101: data_out=11'b00101101010;
		4'b1110: data_out=11'b00101101010;
		4'b1111: data_out=11'b00101101010;
		default: data_out=11'b00101101010;
	endcase 

endmodule 
