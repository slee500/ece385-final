module gray2bw (input logic [9:0] pixl_gray,
					 output logic pixl_bw);

	assign pixl_bw = (pixl_gray[9:2] > 8'h80)? 1'b1 : 1'b0;		 
					 
endmodule