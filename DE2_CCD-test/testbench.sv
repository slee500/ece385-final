module testbench();

timeunit 10ns;

timeprecision 1ns;

logic clk;
logic reset_n;
logic ipixel;
//logic opixel;
logic [9:0] d_icol_cont;
logic [9:0] d_irow_cont;
logic [4:0] d_srow_cont;
logic [4:0] d_scol_cont;



always begin : CLOCK_GENERATION
	 #1 clk = ~clk;
end


sample_clip u(.*);

initial begin : CLOCK_INITALIZATION
	clk = 0;
end

initial begin : TEST_VECTORS

reset_n = 1;

#2 reset_n = 0;
#2 reset_n = 1;
end

endmodule
