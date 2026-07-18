//Right_Triangle
module right_triangle;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			//print spaces
			for(j=1;j<=5-i;j=j+1)begin
				$write(" ");
			end
			//print stars
			for(j=1;j<=i;j=j+1)begin
				$write("*");
			end
			$display("");
		end
	end
endmodule

/*
case1:
i=1
spaces=5-i=5-1=4
stars=i=1
output:    *
case2:
i=2
spaces=5-2=3
stars=2
output:   **
*/

/*output
     *
    **
   ***
  ****
 *****
*/
