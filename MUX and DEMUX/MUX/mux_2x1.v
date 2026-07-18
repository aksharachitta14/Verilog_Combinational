//Design 2x1_MUX using 
//Behavioral Model
/*module mux_2x1(i0,i1,sel,y);
	input i0,i1,sel;
	output reg y;
	always @(*)begin
		y=(~sel&i0)|(sel&i1);
	end
endmodule*/

//Dataflow Model
/*module mux_2x1(i0,i1,sel,y);
	input i0,i1,sel;
	output y;
	assign y=(~sel&i0)|(sel&i1);
endmodule*/

//Structural Model
/*module mux_2x1(i0,i1,sel,y);
	input i0,i1,sel;
	output y;
	wire w1,w2,w3;
	not g1(w1,sel);
	and g2(w2,i0,w1);
	and g3(w3,i1,sel);
	or g4(y,w2,w3);
endmodule*/

//using if-else condition
/*module mux_2x1(i0,i1,sel,y);
	input i0,i1,sel;
	output reg y;
	always @(*)begin
		if(sel==1'b0)y=i0;
		else y=i1;
	end
endmodule*/

//using case Statements
module mux_2x1(i0,i1,sel,y);
	input i0,i1,sel;
	output reg y;
	always @(*)begin
		case({sel})
			1'b0:y=i0;
			1'b1:y=i1;
		endcase
	end
endmodule
//TestBench
module top;
	reg i0,i1,sel;
	wire y;
  mux_2x1 dut(i0,i1,sel,y);
	initial begin
		repeat(5)begin
			{i0,i1,sel}=$random;
          	#1;
			$display("I0=%b I1=%b SEL=%b Y=%b",i0,i1,sel,y);
		end
	end
endmodule

/*output
I0=1 I1=0 SEL=0 Y=1
# I0=0 I1=0 SEL=1 Y=0
# I0=0 I1=0 SEL=1 Y=0
# I0=0 I1=1 SEL=1 Y=1
# I0=1 I1=0 SEL=1 Y=0*/
