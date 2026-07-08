//Design 2x1_MUX using 
//Behavioral Model
/*module mux_4x1(i,s,y);
	input [3:0]i;
	input [1:0]s;
	output reg y;
	always @(*)begin
		y=(~s[1]&~s[0]&i[0])|
		  (~s[1]&s[0]&i[1])|
		  (s[1]&~s[0]&i[2])|
		  (s[1]&s[0]&i[3]);
	end
endmodule*/


//Dataflow Model
module mux_4x1(i,s,y);
	input [3:0]i;
	input [1:0]s;
	output y;
  assign y=(~s[1]&~s[0]&i[0])|(~s[1]&s[0]&i[1])|(s[1]&~s[0]&i[2])|(s[1]&s[0]&i[3]);
	//assign y=s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0]);
endmodule


//Structural Model
/*module mux_4x1(i,s,y);
	input [3:0]i;
	input [1:0]s;
	output y;
	wire s0_bar,s1_bar;
	wire w1,w2,w3,w4;

	not g1(s0_bar,s[0]);
	not g2(s1_bar,s[1]);

	and g3(w1,i[0],s1_bar,s0_bar);
	and g4(w2,i[1],s1_bar,s[0]);
	and g5(w3,i[2],s[1],s0_bar);
	and g6(w4,i[3],s[1],s[0]);
	or g7(y,w1,w2,w3,w4);

endmodule*/


//using if-else condition
/*module mux_4x1(i,s,y);
	input [3:0]i;
    input [1:0]s;
	output reg y;
	always @(*)begin
		if(s==2'b00)y=i[0];
		else if(s==2'b01)y=i[1];
		else if(s==2'b10)y=i[2];
		else y=i[3];
	end
endmodule*/

//using case statements
/*module mux_4x1(i,s,y);
	input [3:0]i;
	input [1:0]s;
	output reg y;
	always @(*)begin
		case(s)
			2'b00:y=i[0];
			2'b01:y=i[1];
			2'b10:y=i[2];
			2'b11:y=i[3];
            default:y=1'b0;
		endcase
	end
endmodule*/


//TestBench
module top;
	reg [3:0]i;
	reg [1:0]s;
	wire y;
	integer seed;
	mux_4x1 dut(i,s,y);
	initial begin
		seed=1234;
      repeat(4)begin
			{i,s}=$random(seed);
			#1;
			$display("I=%b S=%b Y=%b",i,s,y);
		end
	end
endmodule
