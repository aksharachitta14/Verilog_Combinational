//Design a Full_Adder using Behavioural,Dataflow,Structural models

//Behavioural model
/*module full_adder(a,b,c,sum,carry);
	input a,b,c;
	output reg sum,carry;
	always @(*)begin
		sum = a^b^c;
		carry = (a&b)|(b&c)|(c&a);
	end
endmodule*/

//Dataflow model
/*module full_adder(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
		assign sum = a^b^c;
		assign carry = (a&b)|(b&c)|(c&a);
endmodule*/

//Structural models
module full_adder(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	wire w1,w2,w3;
	xor(sum,a,b,c);
	and(w1,a,b);
	and(w2,b,c);
	and(w3,c,a);
	or(carry,w1,w2,w3);
endmodule

//TestBench
module top;
	reg a,b,c;
	wire sum,carry;
	full_adder dut(a,b,c,sum,carry);
	initial begin
		repeat(8)begin
			{a,b,c}=$random;
			$display("A=%b B=%b C=%b Sum=%b Carry=%b",a,b,c,sum,carry);
		end
	end
endmodule
