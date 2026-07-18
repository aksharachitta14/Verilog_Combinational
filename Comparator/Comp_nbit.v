//nbit Comparator
module comp_nbit(a,b,lt,gt,eq);
	input [9:0]a,b;
	output reg lt,gt,eq;

	always@(*)begin
		gt=0;
		lt=0;
		eq=0;
		if(a>b)gt=1;
		else if(a<b)lt=1;
		else eq=1;
	end
endmodule 

//TestBench
module top;
	reg [9:0]a,b;
	wire lt,gt,eq;

	comp_nbit dut(a,b,lt,gt,eq);

	initial begin
		repeat(10)begin
			{a,b}=$random;
			#1;
			$display("A=%b %d B=%b %d LT=%b EQ=%b GT=%b",a,a,b,b,lt,eq,gt);
		end
	end
endmodule

/*output
# A=0101001101  333 B=0100100100  292 LT=0 EQ=0 GT=1
# A=1001010111  599 B=1010000001  641 LT=1 EQ=0 GT=0
# A=0100110101  309 B=1000001001  521 LT=1 EQ=0 GT=0
# A=0000010101   21 B=1001100011  611 LT=1 EQ=0 GT=0
# A=1001011110  606 B=1100001101  781 LT=1 EQ=0 GT=0
# A=1111100110  998 B=0110001101  397 LT=0 EQ=0 GT=1
# A=0010100001  161 B=0001100101  101 LT=0 EQ=0 GT=1
# A=0111010100  468 B=1000010010  530 LT=1 EQ=0 GT=0
# A=0011111000  248 B=1100000001  769 LT=1 EQ=0 GT=0
# A=0111110011  499 B=0100001101  269 LT=0 EQ=0 GT=1
*/
