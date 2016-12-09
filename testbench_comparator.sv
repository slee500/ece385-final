module testbench_comparator();

timeunit 10ns;
timeprecision 1ns;

// Declare connections and module here
logic clk, complete;
shortint result[0:9], digit;


max_digit max0(.*);


always begin : CLOCK_GENERATION
	 #1 clk = ~clk;
end


initial begin : CLOCK_INITALIZATION
	clk = 0;
end

initial begin : TEST_VECTORS

result[0] = -42;
result[1] = 4;
result[2] = -16;
result[3] = -6;
result[4] = -21;
result[5] = -28;
result[6] = -14;
result[7] = -4;
result[8] = -20;
result[9] = -20;
complete = 0;

#2
complete = 1;

end

endmodule
