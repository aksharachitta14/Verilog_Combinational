//Design NOT_gate using 2x1_MUX

// 2x1_MUX
module mux_2x1(i0,i1,s,y);
	input i0,i1,s;
	output y;
	assign y = (~s&i0)|(s&i1);
endmodule



//not gate using MUX
module not_gate(a,y);
	input a,;
	output y;
	mux_2x1 u1(.i0(1),.i1(0),.s(a),.y(y));
endmodule


//TestBench
module top;
	reg a,b;
	wire y;
	not_gate dut(a,b,y);
	initial begin
		repeat(5)begin
	    a=$random;
    	#1;
	    $display("a=%b y=%b",a,y);
		end
	end
endmodule

/*output
a=0 y=1
a=0 y=1
a=1 y=0
a=1 y=0
a=1 y=0*/
