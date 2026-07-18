//Decoder 3x8
module decoder_3x8(a,y);
	input [2:0]a;
	output reg [7:0]y;
	always@(*)begin
		case(a)
			3'b000:y=8'b00000001;
			3'b001:y=8'b00000010;
			3'b010:y=8'b00000100;
			3'b011:y=8'b00001000;
			3'b100:y=8'b00010000;
			3'b101:y=8'b00100000;
			3'b110:y=8'b01000000;
			3'b111:y=8'b10000000;
		endcase
	end
endmodule

//TestBench
module top;
	reg [2:0]a;
	wire [7:0]y;
	decoder_3x8 dut(a,y);
	initial begin
		repeat(10)begin
			a=$random;
			#1;
			$display("A=%b Y=%b",a,y);
		end
	end
endmodule

/*output

# A=100 Y=00010000
# A=001 Y=00000010
# A=001 Y=00000010
# A=011 Y=00001000
# A=101 Y=00100000
# A=101 Y=00100000
# A=101 Y=00100000
# A=010 Y=00000100
# A=001 Y=00000010
# A=101 Y=00100000

*/
