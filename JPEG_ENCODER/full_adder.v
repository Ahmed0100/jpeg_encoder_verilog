module full_adder(a,b,cin,s,cout);
input  a,b,cin;
output wire s,cout;

assign {cout,s}=a+b+cin;


endmodule 