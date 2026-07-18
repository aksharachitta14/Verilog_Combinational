module half_sub(a,b,diff,bor);
	input a,b;
	output diff,bor;
	assign diff = (a&~b)|(~a&b);
	assign bor = ~a&b;
endmodule


module full_sub(a,b,c,diff,bor);
	input a,b,c;
	output diff,bor;
	wire w1,w2,w3;
	 half_sub U1(.a(a),.b(b),.diff(w1),.bor(w2));
	 half_sub U2(.a(w1),.b(c),.diff(diff),.bor(w3));
	 or       (bor,w2,w3);
endmodule



module full_sub_3bit(a,b,c,diff,bor);
	input [2:0]a,b;
	input c;
	output [2:0]diff;
	output bor;
	wire n1,n2;
	 full_sub U1(.a(a[0]),.b(b[0]),.c(c),.diff(diff[0]),.bor(n1));
	 full_sub U2(.a(a[1]),.b(b[1]),.c(c1),.diff(diff[1]),.bor(n2));
	 full_sub U3(.a(a[2]),.b(b[2]),.c(c2),.diff(diff[2]),.bor(bor));
endmodule

//tb
module top;
	reg [2:0]a,b;
	reg c;
	wire [2:0]diff;
	wire bor;
	full_sub_3bit dut(a,b,c,diff,bor);
		initial begin
			repeat(10)begin
		{a,b,c}=$random;
		#1;
		$display("A=%b %d B=%b %d C=%b %d Diff=%b %d Bor=%b %d",a,a,b,b,c,c,diff,diff,bor,bor);
		end
		end
endmodule




/*output
*/
