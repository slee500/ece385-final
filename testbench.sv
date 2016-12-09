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
logic rd_req;


always begin : CLOCK_GENERATION
	 #1 clk = ~clk;
end


sample_clip u(.d_icol_cont(d_icol_con),
				  .d_irow_cont(d_irow_cont),
				  .d_srow_cont(d_srow_cont),
				  .d_scol_cont(d_scol_cont),
				  .rd_req(rd_req),
				  .reset_n(reset_n),
				  .clk(clk)
				  );

initial begin : CLOCK_INITALIZATION
	clk = 0;
end

initial begin : TEST_VECTORS

reset_n = 1;

#2 reset_n = 0;
#2 reset_n = 1;
end

endmodule
