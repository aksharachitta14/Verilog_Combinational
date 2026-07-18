//Priority Encoder 4x2
//using if else
/*module pri_enc_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		if(a[3])
			y=2'b11;
		else if(a[2])
			y=2'b10;
		else if(a[1])
			y=2'b01;
		else if(a[0])
			y=2'b00;
      else y=2'b00;
	end
endmodule*/

//using casex
/*module pri_enc_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		casex(a)
			4'bxxx1:y=2'b00;//A0 highest prority
			4'bxx10:y=2'b01;//A1
			4'bx100:y=2'b10;//A2
			4'b1000:y=2'b11;//A3
			default:y=2'b00;
		endcase
    end
endmodule*/

//using casex
module pri_enc_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		casex(a)
			4'b1xxx:y=2'b00;//A3 highest prority
			4'b01xx:y=2'b01;//A2
			4'b001x:y=2'b10;//A1
			4'b0001:y=2'b11;//A0
			default:y=2'b00;
		endcase
	end
endmodule


//using casez
/*module pri_enc_4x2(a,y);
	input [3:0]a;
	output reg [1:0]y;
	always@(*)begin
		casez(a)
			4'b???1:y=2'b00;//A0 highest prority
			4'b??10:y=2'b01;//A1
			4'b?100:y=2'b10;//A2
			4'b1000:y=2'b11;//A3
			default:y=2'b00;//no input active
		endcase
	end
endmodule*/

//TestBench
module top;
	reg [3:0]a;
  wire [1:0]y;
	pri_enc_4x2 dut(a,y);
	initial begin
       repeat(5)begin
			a=$random;
			#1;
			$display("A=%b Y=%b",a,y);
		end
    end
endmodule


/*output
# A=0100 Y=01
# A=0001 Y=11
# A=1001 Y=00
# A=0011 Y=10
# A=1101 Y=00
*/
