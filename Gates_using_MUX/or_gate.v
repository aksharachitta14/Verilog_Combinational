//Design OR_gate using 2x1_MUX

//2x1_MUX
module mux_2x1(i0,i1,s,y);
	input i0,i1,s;
	output y;
	assign y = (~s&i0)|(s&i1);
endmodule



//or gate using mux
module or_gate(a,b,y);
	input a,b;
	output y;
	mux_2x1 u1(.i0(b),.i1(1),.s(a),.y(y));
endmodule


//TestBench
module top;
	reg a,b;
	wire y;
	or_gate dut(a,b,y);
	initial begin
		repeat(5)begin
	    {a,b}=$random;
    	#1;
	    $display("a=%b b=%b y=%b",a,b,y);
		end
	end
endmodule


/*output
# a=0 b=0 y=0
# a=0 b=1 y=1
# a=0 b=1 y=1
# a=1 b=1 y=1
# a=0 b=1 y=1
*/
