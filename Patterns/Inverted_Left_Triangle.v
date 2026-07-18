//Inverted Left Triangle Pattern
//Inverted Left Triangle Pattern
module inv_left_triangle;
	integer i,j;
	initial begin
      for(i=5;i>0;i=i-1)begin
      	for(j=1;j<=i;j=j+1)begin
			$write("*");
		end
			$display("");
		end
	end
endmodule

/*output

 *****
 ****
 ***
 **
 *

*/
