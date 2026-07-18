//2bit Comparator
module com_2bit(a,b,lt,gt,eq);
	input [1:0]a,b;
	output reg lt,gt,eq;
	always @(*)begin
		lt=0;
		gt=0;
		eq=0;
		if(a>b) gt=1;
		else if(a<b) lt=1;
		else eq=1;
	end
endmodule

//TestBench
module top;
	reg [1:0]a,b;
	wire lt,gt,eq;
	com_2bit dut(a,b,lt,gt,eq);
	initial begin
		repeat(10)begin
			{a,b}=$random;
			#1;
			$display("A=%b B=%b LT=%b GT=%b EQ=%b",a,b,lt,gt,eq);
		end
	end
endmodule

/*output
A=01 B=00 LT=x GT=1 EQ=x
# A=00 B=01 LT=1 GT=1 EQ=x
# A=10 B=01 LT=1 GT=1 EQ=x
# A=00 B=11 LT=1 GT=1 EQ=x
# A=11 B=01 LT=1 GT=1 EQ=x
# A=11 B=01 LT=1 GT=1 EQ=x
# A=01 B=01 LT=1 GT=1 EQ=1
# A=00 B=10 LT=1 GT=1 EQ=1
# A=00 B=01 LT=1 GT=1 EQ=1
# A=11 B=01 LT=1 GT=1 EQ=1
*/
