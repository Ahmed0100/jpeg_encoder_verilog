module dct(clk,reset,en,data_in,data_out);

input clk,reset,en;
input [7:0] data_in;
output reg [11:0] data_out;
reg [7:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
reg [7:0] r0,r1,r2,r3,r4,r5,r6,r7;
reg [10:0] sr0,sr1,sr2,sr3,sr4,sr5,sr6,sr7;
reg [7:0] buff0,buff1,buff2,buff3,buff4,buff5,buff6,buff7;
reg [11:0] u0,u1,u2,u3,u4,u5,u6,u7;
reg [5:0] index1,index2;
wire r0b0,r1b0,r2b0,r3b0,r4b0,r5b0,r6b0,r7b0;
wire au0,au1,au2,au3;
wire av0,av1,av2,av3;

wire d0,d1,d2,d3,d4,d5,d6,d7;
wire q0,q1,q2,q3,q4,q5,q6,q7;
wire cout0,cout1,cout2,cout3;
wire bout0,bout1,bout2,bout3;
wire [10:0] rom_a0,rom_a1,rom_a2,rom_a3,rom_a4,rom_a5,rom_a6,rom_a7;
wire [10:0] rom_b0,rom_b1,rom_b2,rom_b3,rom_b4,rom_b5,rom_b6,rom_b7;
wire [3:0] a_bus_u,a_bus_v;

full_adder afa0(r0b0,r7b0,q0,au0,d0);
full_adder afa1(r1b0,r6b0,q1,au1,d1);
full_adder afa2(r2b0,r5b0,q2,au2,d2);
full_adder afa3(r3b0,r4b0,q3,au3,d3);

full_sub afs0(r0b0,r7b0,q4,av0,d4);
full_sub afs1(r1b0,r6b0,q5,av1,d5);
full_sub afs2(r2b0,r5b0,q6,av2,d6);
full_sub afs3(r3b0,r4b0,q7,av3,d7);

flip_flop f0(clk,reset,d0,q0);
flip_flop f1(clk,reset,d1,q1);
flip_flop f2(clk,reset,d2,q2);
flip_flop f3(clk,reset,d3,q3);
flip_flop f4(clk,reset,d4,q4);
flip_flop f5(clk,reset,d5,q5);
flip_flop f6(clk,reset,d6,q6);
flip_flop f7(clk,reset,d7,q7);

assign a_bus_u={au3,au2,au1,au0};
assign a_bus_v={av3,av2,av1,av0};


assign r0b0=r0[0]; assign r1b0=r1[0]; assign r2b0=r2[0]; assign r3b0=r3[0]; assign r4b0=r4[0]; assign r5b0=r5[0]; assign r6b0=r6[0]; assign r7b0=r7[0]; 

rom0 a0(clk,a_bus_u,rom_a0);
rom1 a1(clk,a_bus_v,rom_a1);
rom2 a2(clk,a_bus_u,rom_a2);
rom3 a3(clk,a_bus_v,rom_a3);
rom4 a4(clk,a_bus_u,rom_a4);
rom5 a5(clk,a_bus_v,rom_a5);
rom6 a6(clk,a_bus_u,rom_a6);
rom7 a7(clk,a_bus_v,rom_a7);


always @(posedge clk or posedge reset)
	if(reset)
		begin
		index1<=0;
		index2<=0;
		end
	else if(en)
		begin
		Q0<=Q1;
		Q1<=Q2;
		Q2<=Q3;
		Q3<=Q4;
		Q4<=Q5;
		Q5<=Q6;
		Q6<=Q7;
		Q7<={data_in};
		if(index1==8)
			begin
			r0<=Q0;
			r1<=Q1;	
			r2<=Q2;
			r3<=Q3;
			r4<=Q4;
			r5<=Q5;
			r6<=Q6;
			r7<=Q7;
			index1<=1;
			end
		else 	
			begin
			r0<=r0>>1;
			r1<=r1>>1;
			r2<=r2>>1;
			r3<=r3>>1;
			r4<=r4>>1;
			r5<=r5>>1;
			r6<=r6>>1;
			r7<=r7>>1;
			index1<=index1+1;
			end
		if(index2==20)
			begin
			u0<={sr0[3],sr0[2],sr0[1],sr0[0],buff0}>>1;
			u1<={sr1[3],sr1[2],sr1[1],sr1[0],buff1}>>1;
			u2<={sr2[3],sr2[2],sr2[1],sr2[0],buff2}>>1;
			u3<={sr3[3],sr3[2],sr3[1],sr3[0],buff3}>>1;
			u4<={sr4[3],sr4[2],sr4[1],sr4[0],buff4}>>1;
			u5<={sr5[3],sr5[2],sr5[1],sr5[0],buff5}>>1;
			u6<={sr6[3],sr6[2],sr6[1],sr6[0],buff6}>>1;
			u7<={sr7[3],sr7[2],sr7[1],sr7[0],buff7}>>1;
			index2<=13;
			end
		else 
			begin
			u0<=u1;
			u1<=u2;
			u2<=u3;
			u3<=u4;
			u4<=u5;
			u5<=u6;
			u6<=u7;
			index2<=index2+1;
			end	
			data_out<=u0;
		end
always @(posedge clk or posedge reset)
	if(reset)
		begin sr0=0; sr1=0; sr2=0; sr3=0; sr4=0; sr5=0; sr6=0; sr7=0; end
	else if(en)
		if(index2==19)
		begin
	
		{sr0,buff0}={sr0[10],({sr0,buff0}>>1)};
		sr0=sr0-rom_b0;
		
		{sr1,buff1}={sr1[10],({sr1,buff1}>>1)};
		sr1=(sr1-rom_b1)>>1;
		
		{sr2,buff2}={sr2[10],({sr2,buff2}>>1)};
		sr2=(sr2-rom_b2)>>1;
		
		{sr3,buff3}={sr3[10],({sr3,buff3}>>1)};
		sr3=(sr3-rom_b3)>>1;
	
		{sr4,buff4}={sr4[10],({sr4,buff4}>>1)};
		sr4=(sr4-rom_b4)>>1;
	
		{sr5,buff5}={sr5[10],({sr5,buff5}>>1)};
		sr5=(sr5-rom_b5)>>1;
	
		{sr6,buff6}={sr6[10],({sr6,buff6}>>1)};
		sr6=(sr6-rom_b6)>>1;
	
		{sr7,buff7}={sr7[10],({sr7,buff7}>>1)};
		sr7=(sr7-rom_b7)>>1;
		end
	else 
		begin
		{sr0,buff0}={sr0[10],({sr0,buff0}>>1)};
		sr0=sr0+rom_a0;
		
		{sr1,buff1}={sr1[10],({sr1,buff1}>>1)};
		sr1=sr1+rom_a1;
		
		{sr2,buff2}={sr2[10],({sr2,buff2}>>1)};
		sr2=sr2+rom_a2;
		
		{sr3,buff3}={sr3[10],({sr3,buff3}>>1)};
		sr3=sr3+rom_a3;
		
		{sr4,buff4}={sr4[10],({sr4,buff4}>>1)};
		sr4=sr4+rom_a4;
	
		{sr5,buff5}={sr5[10],({sr5,buff5}>>1)};
		sr5=sr5+rom_a5;
		
		{sr6,buff6}={sr6[10],({sr6,buff6}>>1)};
		sr6=sr6+rom_a6;
	
		{sr7,buff7}={sr7[10],({sr7,buff7}>>1)};
		sr7=sr7+rom_a7;
	
		end
endmodule 