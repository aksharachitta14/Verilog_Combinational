//Decoder_2x4
//using Dataflow Model
/*module decoder_2x4(a,b,y0,y1,y2,y3);
	input a,b;
	output y0,y1,y2,y3;
	assign y0=~a&~b;
	assign y1=~a&b;
	assign y2=a&~b;
	assign y3=a&b;
endmodule*/

//using Behavioral Model
/*module decoder_2x4(a,b,y0,y1,y2,y3);
	input a,b;
	output reg y0,y1,y2,y3;
	always@(*)begin
      //default valuse
      y0=0;
      y1=1;
      y2=0;
      y3=0;
		case({a,b})
			2'b00:y0=1;
			2'b01:y1=1;
			2'b10:y2=1;
			2'b11:y3=1;
		endcase
	end
endmodule*/

//Structural Model
module decoder_2x4(a,b,y0,y1,y2,y3);
	input a,b;
	output y0,y1,y2,y3;
	wire wa,wb;
	not (wa,a);
	not (wb,b);
	and (y0,wa,wb);
	and (y1,wa,b);
	and (y2,a,wb);
	and (y3,a,b);
endmodule

//TestBench
module top;
	reg a,b;
	wire y0,y1,y2,y3;
	decoder_2x4 dut(a,b,y0,y1,y2,y3);
	initial begin
      repeat(5)begin
		{a,b}=$random;
		#1;
		$display("A=%b B=%b Y0=%b Y1=%b Y2=%b Y3=%b",a,b,y0,y1,y2,y3);
      end
	end
endmodule
/*output

# A=0 B=0 Y0=1 Y1=0 Y2=0 Y3=0
# A=0 B=1 Y0=0 Y1=1 Y2=0 Y3=0
# A=0 B=1 Y0=0 Y1=1 Y2=0 Y3=0
# A=1 B=1 Y0=0 Y1=0 Y2=0 Y3=1
# A=0 B=1 Y0=0 Y1=1 Y2=0 Y3=0

*/
