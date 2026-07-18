//1_bit Comparator
//using Dataflow Model
/*module comp_1bit(a,b,lt,gt,eq);
	input a,b;
	output lt,gt,eq;
	assign lt=~a&b;
	assign gt=a&~b;
	assign eq=a&b;
endmodule*/


//using Behavioral Model
/*module comp_1bit(a,b,lt,gt,eq);
	input a,b;
	output reg lt,gt,eq;
	always @(*)begin
		lt=~a&b;
		gt=a&~b;
		eq=a&b;
	end
endmodule
*/
//Structural Model
module comp_1bit(a,b,lt,gt,eq);
	input a,b;
	output lt,gt,eq;
	and g1(lt,~a,b);
	and g2(gt,a,~b);
	and g3(eq,a,b);
endmodule


//TestBench
module top;
	reg a,b;
	wire lt,gt,eq;
	comp_1bit dut(a,b,lt,gt,eq);
	initial begin
		repeat(5)begin
			{a,b}=$random;
			#1;
			$display("A=%b B=%b LT=%b GT=%b EQ=%b",a,b,lt,gt,eq);
		end
	end
endmodule

/*output

# A=0 B=0 LT=0 GT=0 EQ=0
# A=0 B=1 LT=1 GT=0 EQ=0
# A=0 B=1 LT=1 GT=0 EQ=0
# A=1 B=1 LT=0 GT=0 EQ=1
# A=0 B=1 LT=1 GT=0 EQ=0

*/
