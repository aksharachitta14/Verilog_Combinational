//Increasing Numbers
module inc_num;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			for(j=1;j<=i;j=j+1)begin
				$write("%0d",j);
			end
			$display("");
		end
	end
endmodule

/*
case1:
i=1
j=1  j<=1  j=1+1
case2:
i=2
j=1,j<=1,j<=2 j=2+1
case3:
i=3
j=1,j<=1,j<=2,j<=3,j=3+1
*/

/*output

 1
 12
 123
 1234
 12345

*/
