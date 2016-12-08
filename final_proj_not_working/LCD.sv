module LCD(input logic clk, reset, load, pixel, 
					output logic [15:0] number,
					output logic [9:0] pixel_addr,
					output logic complete,
					output logic [1:0] stages_complete,
					output logic waiting,
					output logic [9:0] zero_counter
					
					
					
					
//					output logic [7:0] LCD_DATA // Data bus
//					output logic LCD_D_Cn, // data(H) or command(L)
//					output logic LCD_WEn, // read(H) or write(L)
//					output logic LCD_CSn // enable(L)
					);
					
	//assign numbers	=  {complete, load, 10'h0, digit[3:0]};
	

	// Matrix stuff
	shortint result[0:9];
	shortint digit;
	//logic complete;
assign number = digit;
	
	multiply_add multadd(.*);
	
	// Have a bunch of comparators here to figure out our result
	max_digit max_digit0(.*);
	
	
	


endmodule 
