//Same Number
module same_num;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			for(j=1;j<=i;j=j+1)begin
				$write("%0d",i);
			end
			$display("");
		end
	end
endmodule

/*
case1:
i=1
j=1 j<=1 j=1+1
output=1
case2:
i=2
j=1 j<=1 j<=2 j=2+1
output=22
case3:
i=3
j=1 j<=1 j<=2 j<=3 j=3+1
output=333

/*output

 1
 22
 333
 4444
 55555

*/
