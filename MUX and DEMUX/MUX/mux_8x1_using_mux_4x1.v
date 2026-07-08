//Design 8x1_MUX using 4x1_mux
//4x1_mux
module mux_4x1(i,s,y);
	input [3:0]i;
	input [1:0]s;
	output reg y;
	always @(*)begin
      y=(~s[1]&~s[0]&i[0])|(~s[1]&s[0]&i[1])|(s[1]&~s[0]&i[2])|(s[1]&s[0]&i[3]);
	end
endmodule

//8x1_mux
module mux_8x1(i,s,y);
	input [7:0]i;
	input [2:0]s;
	output y;
	wire w1,w2;
	mux_4x1 u1(.i(i[7:4]),.s(s[1:0]),.y(w1));
	mux_4x1 u2(.i(i[3:0]),.s(s[1:0]),.y(w2));
  	mux_4x1 u3(.i({1'b0,1'b0,w2,w1}),.s({1'b0,s[2]}),.y(y));

	//mux_4x1 u1(.i(i0[0]),.i(i1[1]),.i(i2[2]),.i3(i[3]),.s(s[1:0]),.y(w1));
    //mux_4x1 u2(.i0(i[4]),.i1(i[5]),.i2(i[6]),.i3(i[7]),.s(s[1:0]),.y(w2));
    //mux_4x1 u3(.i0(w1),.i1(w2),.i2(1'b0),.i3(1'b0),.s({1'b0,s[2]}),.y(y));

endmodule


//TestBench
module top;
	reg [7:0]i;
	reg [2:0]s;
	wire y;
	mux_8x1 dut(i,s,y);
	initial begin
		repeat(10)begin
			{i,s}=$random;
			#1;
			$display("I=%b S=%b Y=%b",i,s,y);
		end
	end
endmodule

/*output
# I=10100100 S=100 Y=0
# I=11010000 S=001 Y=0
# I=11000001 S=001 Y=0
# I=11001100 S=011 Y=1
# I=01100001 S=101 Y=0
# I=00110001 S=101 Y=0
# I=10001100 S=101 Y=0
# I=01000010 S=010 Y=1
# I=01100000 S=001 Y=1
# I=10100001 S=101 Y=0*/
