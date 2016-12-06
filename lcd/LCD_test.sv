module LCD_test(input logic clk, reset, load, pixel,
					output logic [9:0] pixel_addr,
					output logic [7:0] LCD_DATA, // Data bus
					output logic LCD_D_Cn, // data(H) or command(L)
					output logic LCD_WEn, // read(H) or write(L)
					output logic LCD_CSn // enable(L)
					);
					
	logic [15:0] numbers;
	assign numbers	=  {complete, load, 10'h0, digit[4:0]};
	
	nios nios0 (.clk_clk(clk),         // clk.clk
		.reset_reset_n(reset),				// reset.reset_n
		.numbers_external_connection_export(numbers), //     numbers_external_connection.export
		.lcd_bitbang_external_connection_export({LCD_CSn, LCD_D_Cn, LCD_WEn, LCD_DATA}) // lcd_bitbang_external_connection.export
	);
	
	// Matrix stuff
	shortint result[0:9];
	shortint digit;
	logic complete;
	
	multiply_add multadd(.*);
	
	// Have a bunch of comparators here to figure out our result
	max_digit max_digit0(.*);
	
	
	


endmodule 
