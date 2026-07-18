module mux_8x1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
	input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
	output reg y;
	always@(*)begin
	y=(~s0&~s1&~s2&i0)|(~s0&~s1&s2&i1)|(~s0&s1&~s2&i2)|(~s0&s1&s2&i3)|(s0&~s1&~s2&i4)|(s0&~s1&s2&i5)|(s0&s1&~s2&i6)|(s0&s1&s2&i6);
	end
endmodule

//tb
module top;
	reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
	wire y;
	integer seed;

	mux_8x1 dut(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
	initial begin
		seed = 5678;
		repeat(15)begin
		{i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2}=$random;   //(seed);
		#1;
		$display("i0=%b,i1=%b,i2=%b,i3=%b,i4=%b,i5=%b,i6=%b,i7=%b,s0=%b,s1=%b,s2=%b,y=%b",i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
		end
	end
endmodule


module mux_8x1(i,s,y);
	input [15:0]i;
	input [2:0]s;
	output reg [1:0]y;
	always@ (*)begin
		case(s)
		3'b000:y=i[1:0];
		3'b001:y=i[3:2];
		3'b010:y=i[5:4];
		3'b011:y=i[7:6];
		3'b100:y=i[9:8];
		3'b101:y=i[11:10];
		3'b110:y=i[13:12];
		3'b111:y=i[15:14];
		endcase	
	end
endmodule

//tb
module top;
	reg [15:0]i;
	reg [2:0]s;
	wire [1:0]y;
	 mux_8x1 dut(i,s,y);
	 initial begin
	 	repeat(20)begin
		{i,s}=$random;
		#1;
		$display("i=%b s=%b y=%b",i,s,y);
		end
	 end
endmodule

