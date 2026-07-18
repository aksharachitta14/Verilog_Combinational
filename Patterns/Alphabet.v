//Alphabets
module alphabets;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			for(j=1;j<=i;j=j+1)begin
				$write("%c",64+j);
			end
			$display();
		end
	end
endmodule

//64 + j converts the values 1, 2, 3... into the ASCII codes for A, B, C...

/*
case1:
i=1
j=1 j<=1 j=1+1
output=64+1 65=A
case2:
i=2
j=1 j<=1 j<=2 j=2+1
output=64+2 66=B
*/

/*output

 A 
 AB 
 ABC 
 ABCD 
 ABCDE 

*/
