//Square pattern
module square;
	integer i,j;
	initial begin
		for(i=5;i>0;i=i-1)begin
			for(j=5;j>0;j=j-1)begin
				$write("*");
			end
			$display("");
		end
	end
endmodule

/*output

 *****
 *****
 *****
 *****
 *****

*/
