
module nios (
	clk_clk,
	lcd_bitbang_external_connection_export,
	numbers_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[10:0]	lcd_bitbang_external_connection_export;
	input	[15:0]	numbers_external_connection_export;
	input		reset_reset_n;
endmodule
