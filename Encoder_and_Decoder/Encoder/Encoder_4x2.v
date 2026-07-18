//Encoder 4x2 
//using Behavioral Model
module encoder_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		case(a)
			4'b0001:y=2'b00;
			4'b0010:y=2'b01;
			4'b0100:y=2'b10;
			4'b1000:y=2'b11;
			default:y=2'bxx;
		endcase
	end
endmodule


//using if_else 
module encoder_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		if(a==4'b0001) 
			y=2'b00;
		else if(a==4'b0010)
			y=2'b01;
		else if(a==4'b0100)
			y=2'b10;
		else if(a==4'b1000)
			y=2'b11;
		else
			y=2'bxx;
	end
endmodule
//using Dataflow Model
/*
module encoder_4x2(a,y);
	input [3:0]a;
	output [1:0]y;
	assign y = (a==4'b0001)?2'b00:
			   (a==4'b0010)?2'b01:
			   (a==4'b0100)?2'b10:
			   (a==4'b1000)?2'b11:
			   				2'bxx;
endmodule
*/

//Structural Model
module encoder_4x2(a,y);
	input [3:0]a;
	output [1:0]y;
	or g1(y[1],a[2],a[3]);
	or g2(y[0],a[1],a[3]);
endmodule




//TestBench
module top;
	reg [3:0]a;
	wire [1:0]y;
	encoder_4x2 dut(a,y);
	initial begin
		repeat(5)begin
		a=$randome;
		#1;
		$display("A=%b %d Y=%b %d",a,a,y,y);
		end
	end
endmodule

/*output

# A=0100  4 Y=10 2
# A=0001  1 Y=00 0
# A=1001  9 Y=xx x
# A=0011  3 Y=xx x
# A=1101 13 Y=xx x

*/
