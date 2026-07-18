//Encoder 8x2 
//using Behavioral Model
module encoder_8x3(a,y);
	input [7:0]a;
	output reg[2:0]y;
	always@(*)begin
		case(a)
			8'b00000001:y=3'b000;
			8'b00000010:y=3'b001;
			8'b00000100:y=3'b010;
			8'b00001000:y=3'b011;
			8'b00010000:y=3'b100;
			8'b00100000:y=3'b101;
			8'b01000000:y=3'b110;
			8'b10000000:y=3'b111;
			default:y=3'bxxx;
		endcase
	end
endmodule


//using if else
module encoder_8x3(a,y);
	input [7:0]a;
	output reg [2:0]y;
	always @(*)begin
		if(a==8'b00000001)
			y=3'b000;
		else if(a==8'b00000010)
			y=3'b001;
		else if(a==8'b00000100)
			y=3'b010;
		else if(a==8'b00001000)
			y=3'b011;
		else if(a==8'b00010000)
			y=3'b100;
		else if(a==8'b00100000)
			y=3'b101;
		else if(a==8'b01000000)
			y=3'b110;
		else if(a==8'b10000000)
			y=3'b111;
		else 
			y=3'bxxx;
	end
endmodule


//using Dataflow Model
module encoder_8x3(a,y);
	input [7:0]a;
	output [2:0]y;
	assign y=(a==8'b00000001)?3'b000:
			 (a==8'b00000010)?3'b001:
			 (a==8'b00000100)?3'b010:
			 (a==8'b00001000)?3'b011:
			 (a==8'b00010000)?3'b100:
			 (a==8'b00100000)?3'b101:
			 (a==8'b01000000)?3'b110:
			 (a==8'b10000000)?3'b111:
			 				3'bxxx;
endmodule

//TestBench
module top;
	reg [7:0]a;
	wire [2:0]y;
	encoder_8x3 dut(a,y);
	initial begin
		repeat(10)begin
			a=8'b00000001;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b00000010;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b00000100;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b00001000;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b00010000;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b00100000;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b01000000;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b10000000;
		#1;
		$display("A=%b Y=%b %d",a,y,y);

		a=8'b01100010;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		a=8'b11111111;
		#1;
		$display("A=%b Y=%b %d",a,y,y);
		end
	end
endmodule

/*output
# A=00000001 Y=000 0
# A=00000010 Y=001 1
# A=00000100 Y=010 2
# A=00001000 Y=011 3
# A=00010000 Y=100 4
# A=00100000 Y=101 5
# A=01000000 Y=110 6
# A=10000000 Y=111 7
# A=01100010 Y=xxx x
# A=11111111 Y=xxx x
*/
