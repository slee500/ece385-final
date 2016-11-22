// Top-level model

// Performs multiplication according to a state machine

module toplevel(input clk, reset, load, 
					input logic pixel, 
					output logic complete,
					output shortint result[0:9]);

	
	enum logic [1:0] {WAIT, COMPUTE, READY} state, next_state;
	
	mult_add multadd(.*);
	

	
endmodule