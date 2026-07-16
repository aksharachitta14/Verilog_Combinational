//Design NAND_gate using 2x1_MUX

// 2x1_mux
module mux_2x1(i0,i1,s,y);
	input i0,i1,s;
	output y;
	assign y = (~s&i0)|(s&i1);
endmodule



//nand gate using mux
module nand_gate(a,b,y);
	input a,b;
	output y;
	mux_2x1 u1(.i0,(1),.i1(~b),.s(a),.y(y));
endmodule


//TestBench
module top;
	reg a,b;
	wire y;
	nand_gate dut(a,b,y);
	initial begin
		repeat(5)begin
	    {a,b}=$random;
    	#1;
	    $display("a=%b b=%b y=%b",a,b,y);
		end
	end
endmodule


/*output# a=0 b=0 y=1
# a=0 b=1 y=1
# a=0 b=1 y=1
# a=1 b=1 y=0
# a=0 b=1 y=1
*/
