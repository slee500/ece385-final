
module nois (
	clk_clk,
	reset_reset_n,
	rgb_startofpacket,
	rgb_endofpacket,
	rgb_valid,
	rgb_ready,
	rgb_data,
	y_ready,
	y_startofpacket,
	y_endofpacket,
	y_valid,
	y_data,
	clk_27_clk);	

	input		clk_clk;
	input		reset_reset_n;
	input		rgb_startofpacket;
	input		rgb_endofpacket;
	input		rgb_valid;
	output		rgb_ready;
	input	[23:0]	rgb_data;
	input		y_ready;
	output		y_startofpacket;
	output		y_endofpacket;
	output		y_valid;
	output	[7:0]	y_data;
	output		clk_27_clk;
endmodule
