//Inverted Pyramid
module inv_pyramid;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			for(j=1;j<=i-1;j=j+1)begin
				$write(" ");
			end
			for(j=1;j<=11-2*i;j=j+1)begin//2*N+1=2*5+1=11 
				$write("*");
			end
			$display("");//next line 
		end
	end
endmodule

/*
If N = 5, we use 11 because 11 = 2*N + 1 = 2*5 + 1, which generates the required star sequence 9, 7, 5, 3, 1
case1
i=1
spaces=i-1=0
stars=11-2*i=11-2*1=9
output=*********
case2
i=2
spaces=2-1=1
stars=11-2*2=7
output=*******
*/

/*output
*********
 *******
  *****
   ***
    *
*/
