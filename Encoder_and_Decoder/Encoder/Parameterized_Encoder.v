//Parameterized Encode
module par_enc #(parameter N=8)(
	input [N-1:0]a;
	output reg[$clog2(N)-1:0]y);
	integer i;
	always @(*)begin
		y=0;
		for(i=0;i<N;i=i+1)//used to check every input bit
			if(a[i])//it chacks whether the current input bit is 1
				y=i;
	end
endmodule

//TestBench
module top;
	parameter N=8;
	reg [N-1:0]a;
	wire [$clog2(N)-1:0]y;
	par_enc #(N) dut(.a(a),.y(y));
	initial begin
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
# A=01100010 Y=110 6
# A=11111111 Y=111 7
*/
