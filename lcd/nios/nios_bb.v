
module nios (
	clk_clk,
	reset_reset_n,
	lcd_bitbang_external_connection_export,
	numbers_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[10:0]	lcd_bitbang_external_connection_export;
	input	[15:0]	numbers_external_connection_export;
endmodule
