module processed_image(input logic clk, reset_n, pixel,
								output logic [783:0] pixels);
								
		always_ff @ (posedge clk)
		begin
			if (~reset_n == 1'b1) 
				pixels <= 0;
			else // Left shift register
				pixels <= {pixels[782:0], pixel};
		end

endmodule 