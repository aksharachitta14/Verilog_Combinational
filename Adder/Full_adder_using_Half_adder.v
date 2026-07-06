//Design Full_Adder using Half_adder
module half_adder(a,b,sum,carry);
	input a,b;
	output reg sum,carry;
	always @(a or b)begin
		sum = a^b;
		carry = a&b;
	end
endmodule

module full_half(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	wire w1,w2,w3;
	half_adder u1(.a(a),.b(b),.sum(w1),.carry(w2));
	half_adder u2(.a(w1),.b(c),.sum(sum),.carry(w3));
	or g1(carry,w2,w3);
endmodule


//TestBench
module top;
	reg a,b,c;
	wire sum,carry;
	full_half dut(a,b,c,sum,carry);
	initial begin
		repeat(10)begin
			{a,b,c}=$random;
			#1;
			$display("A=%b B=%b C=%b Sum=%b Carry=%b",a,b,c,sum,carry);
		end
	end
endmodule

/*output
# A=1 B=0 C=0 Sum=1 Carry=0
# A=0 B=0 C=1 Sum=1 Carry=0
# A=0 B=0 C=1 Sum=1 Carry=0
# A=0 B=1 C=1 Sum=0 Carry=1
# A=1 B=0 C=1 Sum=0 Carry=1
# A=1 B=0 C=1 Sum=0 Carry=1
# A=1 B=0 C=1 Sum=0 Carry=1
# A=0 B=1 C=0 Sum=1 Carry=0
# A=0 B=0 C=1 Sum=1 Carry=0
# A=1 B=0 C=1 Sum=0 Carry=1*/

