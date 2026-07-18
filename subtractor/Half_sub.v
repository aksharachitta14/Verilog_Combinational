//Behavioural Model
/*module half_sub(a,b,difference,borrow);
	input a,b;
	output reg difference,borrow;
	always @(a or b)begin
		difference=a^b;
		borrow=(~a)&b;
	end
endmodule*/

//Dataflow Model
/*module half_sub(a,b,difference,borrow);
	input a,b;
	output difference,borrow;
	assign difference=a^b;
	assign borrow=(~a)&b;
endmodule*/

//Structural Model
module half_sub(a,b,difference,borrow);
	input a,b;
	output difference,borrow;
	xor(difference,a,b);
	and(borrow,(~a),b);
endmodule

//TestBench
module top;
	reg a,b;
	wire difference,borrow;
	half_sub dut(a,b,difference,borrow);
	initial begin
		repeat(4)begin
		{a,b}=$random;
		#1;
          $display("A=%b B=%b Difference=%b Borrow=%b",a,b,difference,borrow);
		end
	end
endmodule

/*output
# A=0 B=0 Difference=0 Borrow=0
# A=0 B=1 Difference=1 Borrow=1
# A=0 B=1 Difference=1 Borrow=1
# A=1 B=1 Difference=0 Borrow=0*/
