module testbench();

timeunit 10ns;
timeprecision 1ns;

shortint add[0:99]; // We add row by row, repeating this operation 784 times  
 logic pixel, clk, reset, load ,complete;
	 shortint result[0:99];

always begin: CLOCK_GENERATION
	#1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION
	clk = 0;
end



initial begin: TEST
#2
reset = 1;
add[0] = 1;
add[1] = 1;
add[2] = 1;
add[3] = 1;
add[4] = 1;
add[5] = 1;
add[6] = 1;
add[7] = 1;
add[8] = 1;
add[9] = 1;
add[10] = 1;
add[11] = 1;
add[12] = 1;
add[13] = 1;
add[14] = 1;
add[15] = 1;
add[16] = 1;
add[17] = 1;
add[18] = 1;
add[19] = 1;
add[20] = 1;
add[21] = 1;
add[22] = 1;
add[23] = 1;
add[24] = 1;
add[25] = 1;
add[26] = 1;
add[27] = 1;
add[28] = 1;
add[29] = 1;
add[30] = 1;
add[31] = 1;
add[32] = 1;
add[33] = 1;
add[34] = 1;
add[35] = 1;
add[36] = 1;
add[37] = 1;
add[38] = 1;
add[39] = 1;
add[40] = 1;
add[41] = 1;
add[42] = 1;
add[43] = 1;
add[44] = 1;
add[45] = 1;
add[46] = 1;
add[47] = 1;
add[48] = 1;
add[49] = 1;
add[50] = 1;
add[51] = 1;
add[52] = 1;
add[53] = 1;
add[54] = 1;
add[55] = 1;
add[56] = 1;
add[57] = 1;
add[58] = 1;
add[59] = 1;
add[60] = 1;
add[61] = 1;
add[62] = 1;
add[63] = 1;
add[64] = 1;
add[65] = 1;
add[66] = 1;
add[67] = 1;
add[68] = 1;
add[69] = 1;
add[70] = 1;
add[71] = 1;
add[72] = 1;
add[73] = 1;
add[74] = 1;
add[75] = 1;
add[76] = 1;
add[77] = 1;
add[78] = 1;
add[79] = 1;
add[80] = 1;
add[81] = 1;
add[82] = 1;
add[83] = 1;
add[84] = 1;
add[85] = 1;
add[86] = 1;
add[87] = 1;
add[88] = 1;
add[89] = 1;
add[90] = 1;
add[91] = 1;
add[92] = 1;
add[93] = 1;
add[94] = 1;
add[95] = 1;
add[96] = 1;
add[97] = 1;
add[98] = 1;
add[99] = 1;

#8
reset = 0;
load = 1;
pixel = 1;

#2
load = 0;


end

endmodule
