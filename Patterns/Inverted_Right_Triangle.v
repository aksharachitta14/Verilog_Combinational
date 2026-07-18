//Inverted Right Triangle
module inv_right_triangle;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			//print spaces
			for(j=1;j<=i-1;j=j+1)begin
				$write(" ");
			end
			//print stars
			for(j=1;j<=6-i;j=j+1)begin
				$write("*");
			end
			$display("");
		end
	end
endmodule

/*
case1:
i=1
spaces=i-1=0
stars=6-i=6-1=5
output:*****
case2:
i=2
spaces=2-1=1
stars=6-2=4
output:****
*/

/*output
 *****
  ****
   ***
    **
     *
*/
