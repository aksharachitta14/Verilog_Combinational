//pattern_4
:qa

module pattern_4;
	integer i,j;
	initial begin
		for(i=1;i<=5;i=i+1)begin
			for(j=1;j<=5;j=j+1)begin
				$write("*");
			end
			$display("");
		end
	end
endmodule
