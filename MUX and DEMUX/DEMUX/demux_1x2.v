//Design Demux_1x2 using 
//Behavioural Model
/*module demux_1x2(i,s,y0,y1);
	input i,s;
	output reg y0,y1;
	always @(*)begin
		y0=i&~s;
		y1=i&s;
	end
endmodule*/

//Dataflow Model
/*module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	assign y0=i&~s;
	assign y1=i&s;
endmodule*/

//Structural Model
module demux_1x2(i,s,y0,y1);
	input i,s;
	output y0,y1;
	wire s_bar;
	not g1(s_bar,s);
	and g2(y0,i,s_bar);
	and g3(y1,i,s);
endmodule

//using case Statements
module demux_1x2(i,s,y0,y1);
	input i,s;
	output reg y0,y1;
	always @(*)begin
		case(s)
			1'b0:y0=i;
			1'b1:y1=i;
		endcase
	end
endmodule

//using if_else
/*module demux_1x2(i,s,y0,y1);
	input i,s;
	output reg y0,y1;
	always @(*)begin
      if(s==1'b0)y0=i;
		else y1=i;
	end
endmodule*/

//TestBench
module top;
	reg i,s;
	wire y0,y1;
	demux_1x2 dut(i,s,y0,y1);
	initial begin
		repeat(10)begin
			{i,s}=$random;
			#1;
			$display("I=%b S=%b Y0=%b Y1=%b",i,s,y0,y1);
		end
	end
endmodule

/*output
# I=0 S=0 Y0=0 Y1=0
# I=0 S=1 Y0=0 Y1=0
# I=0 S=1 Y0=0 Y1=0
# I=1 S=1 Y0=0 Y1=1
# I=0 S=1 Y0=0 Y1=0
# I=0 S=1 Y0=0 Y1=0
# I=0 S=1 Y0=0 Y1=0
# I=1 S=0 Y0=1 Y1=0
# I=0 S=1 Y0=0 Y1=0
# I=0 S=1 Y0=0 Y1=0*/
