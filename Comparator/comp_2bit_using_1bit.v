//2bit Comparator using 1bit Comparator
//1bit Comparator
module comp_1bit(a,b,lt,gt,eq);
	input a,b;
	output lt,gt,eq;
	assign lt=~a&b;
	assign gt=a&~b;
  assign eq=~(a^b);
endmodule


//2bit using 1bit Comparator
module comp_2bit(a,b,lt,gt,eq);
	input [1:0]a,b;
	output lt,gt,eq;
	wire lt1,gt1,eq1,lt0,gt0,eq0;
	wire w1,w2;
	comp_1bit u1(.a(a[1]),.b(b[1]),.lt(lt1),.gt(gt1),.eq(eq1));
	comp_1bit u2(.a(a[0]),.b(b[0]),.lt(lt0),.gt(gt0),.eq(eq0));
	and g1(w1,eq1,gt0);
	or  g2(gt,w1,gt1);
	and g3(eq,eq1,eq0);
	and  g4(w2,eq1,lt0);
	or g5(lt,lt1,w2);
endmodule

//TestBench
module top;
	reg [1:0]a,b;
	wire lt,gt,eq;
    comp_2bit dut(a,b,lt,gt,eq);
	initial begin
		repeat(10)begin
			{a,b}=$random;
			#1;
          $display("A=%b B=%b LT=%b GT=%b EQ=%b",a,b,lt,gt,eq);
		end
	end
endmodule

/*output
A=01 B=00 LT=0 GT=1 EQ=0
# A=00 B=01 LT=1 GT=0 EQ=0
# A=10 B=01 LT=0 GT=1 EQ=0
# A=00 B=11 LT=1 GT=0 EQ=0
# A=11 B=01 LT=0 GT=1 EQ=0
# A=11 B=01 LT=0 GT=1 EQ=0
# A=01 B=01 LT=0 GT=0 EQ=1
# A=00 B=10 LT=1 GT=0 EQ=0
# A=00 B=01 LT=1 GT=0 EQ=0
# A=11 B=01 LT=0 GT=1 EQ=0
*/
