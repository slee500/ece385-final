module rgb2gray(input logic [9:0] pixl_R, pixl_G, pixl_B,
					 output logic [9:0] pixl_gray);
					 
	
	
	logic [11:0] temp_gray;
	
	assign temp_gray = pixl_R + pixl_G + pixl_B + pixl_G;
	assign pixl_gray = temp_gray >> 2;
	
endmodule
