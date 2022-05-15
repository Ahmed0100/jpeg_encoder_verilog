
module flip_flop(clk,reset,din,dout);
input clk,reset;
input din;
output reg dout;
always @(posedge clk or posedge reset)
	if(reset)
		dout<=0;
	else
		dout<=din;
endmodule 