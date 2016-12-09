module testbench_lcd();

timeunit 10ns;
timeprecision 1ns;

// Declare connections and module here
logic clk, reset, photo_taken_ready;
logic [3:0] number;
logic pixel, load;

logic rd_bw;
logic [9:0] pixel_addr;
logic complete, waiting;
logic [1:0] stages_complete;

assign photo_taken_ready = load;
assign rd_bw = pixel;


LCD LCD0(.clk(clk), .reset(reset), .load(photo_taken_ready), 
			.number(number), // Output number
		
			.pixel(rd_bw), .pixel_addr(pixel_addr), 
			.complete(complete), .stages_complete(stages_complete), .waiting(waiting)
			);


always begin : CLOCK_GENERATION
	 #1 clk = ~clk;
end


initial begin : CLOCK_INITALIZATION
	clk = 0;
end

initial begin : TEST_VECTORS
#2 reset = 1;
#2 reset = 0;

#2 load = 1;
 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;

#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 1;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;

#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;
#2 pixel = 0;


end

endmodule