module subtract(input int result_reg[0:99], input shortint bias[0:99],
					input logic clk, subtract,
					output shortint sum[0:99]);	
					
		shortint sum_reg[0:99];
		
		always_ff @ (posedge clk)
		begin
			case (subtract)
			1'b0: begin // latch the current values, whatever they are
				sum_reg[0] <= sum_reg[0];
				sum_reg[1] <= sum_reg[1];
				sum_reg[2] <= sum_reg[2];
				sum_reg[3] <= sum_reg[3];
				sum_reg[4] <= sum_reg[4];
				sum_reg[5] <= sum_reg[5];
				sum_reg[6] <= sum_reg[6];
				sum_reg[7] <= sum_reg[7];
				sum_reg[8] <= sum_reg[8];
				sum_reg[9] <= sum_reg[9];
				sum_reg[10] <= sum_reg[10];
				sum_reg[11] <= sum_reg[11];
				sum_reg[12] <= sum_reg[12];
				sum_reg[13] <= sum_reg[13];
				sum_reg[14] <= sum_reg[14];
				sum_reg[15] <= sum_reg[15];
				sum_reg[16] <= sum_reg[16];
				sum_reg[17] <= sum_reg[17];
				sum_reg[18] <= sum_reg[18];
				sum_reg[19] <= sum_reg[19];
				sum_reg[20] <= sum_reg[20];
				sum_reg[21] <= sum_reg[21];
				sum_reg[22] <= sum_reg[22];
				sum_reg[23] <= sum_reg[23];
				sum_reg[24] <= sum_reg[24];
				sum_reg[25] <= sum_reg[25];
				sum_reg[26] <= sum_reg[26];
				sum_reg[27] <= sum_reg[27];
				sum_reg[28] <= sum_reg[28];
				sum_reg[29] <= sum_reg[29];
				sum_reg[30] <= sum_reg[30];
				sum_reg[31] <= sum_reg[31];
				sum_reg[32] <= sum_reg[32];
				sum_reg[33] <= sum_reg[33];
				sum_reg[34] <= sum_reg[34];
				sum_reg[35] <= sum_reg[35];
				sum_reg[36] <= sum_reg[36];
				sum_reg[37] <= sum_reg[37];
				sum_reg[38] <= sum_reg[38];
				sum_reg[39] <= sum_reg[39];
				sum_reg[40] <= sum_reg[40];
				sum_reg[41] <= sum_reg[41];
				sum_reg[42] <= sum_reg[42];
				sum_reg[43] <= sum_reg[43];
				sum_reg[44] <= sum_reg[44];
				sum_reg[45] <= sum_reg[45];
				sum_reg[46] <= sum_reg[46];
				sum_reg[47] <= sum_reg[47];
				sum_reg[48] <= sum_reg[48];
				sum_reg[49] <= sum_reg[49];
				sum_reg[50] <= sum_reg[50];
				sum_reg[51] <= sum_reg[51];
				sum_reg[52] <= sum_reg[52];
				sum_reg[53] <= sum_reg[53];
				sum_reg[54] <= sum_reg[54];
				sum_reg[55] <= sum_reg[55];
				sum_reg[56] <= sum_reg[56];
				sum_reg[57] <= sum_reg[57];
				sum_reg[58] <= sum_reg[58];
				sum_reg[59] <= sum_reg[59];
				sum_reg[60] <= sum_reg[60];
				sum_reg[61] <= sum_reg[61];
				sum_reg[62] <= sum_reg[62];
				sum_reg[63] <= sum_reg[63];
				sum_reg[64] <= sum_reg[64];
				sum_reg[65] <= sum_reg[65];
				sum_reg[66] <= sum_reg[66];
				sum_reg[67] <= sum_reg[67];
				sum_reg[68] <= sum_reg[68];
				sum_reg[69] <= sum_reg[69];
				sum_reg[70] <= sum_reg[70];
				sum_reg[71] <= sum_reg[71];
				sum_reg[72] <= sum_reg[72];
				sum_reg[73] <= sum_reg[73];
				sum_reg[74] <= sum_reg[74];
				sum_reg[75] <= sum_reg[75];
				sum_reg[76] <= sum_reg[76];
				sum_reg[77] <= sum_reg[77];
				sum_reg[78] <= sum_reg[78];
				sum_reg[79] <= sum_reg[79];
				sum_reg[80] <= sum_reg[80];
				sum_reg[81] <= sum_reg[81];
				sum_reg[82] <= sum_reg[82];
				sum_reg[83] <= sum_reg[83];
				sum_reg[84] <= sum_reg[84];
				sum_reg[85] <= sum_reg[85];
				sum_reg[86] <= sum_reg[86];
				sum_reg[87] <= sum_reg[87];
				sum_reg[88] <= sum_reg[88];
				sum_reg[89] <= sum_reg[89];
				sum_reg[90] <= sum_reg[90];
				sum_reg[91] <= sum_reg[91];
				sum_reg[92] <= sum_reg[92];
				sum_reg[93] <= sum_reg[93];
				sum_reg[94] <= sum_reg[94];
				sum_reg[95] <= sum_reg[95];
				sum_reg[96] <= sum_reg[96];
				sum_reg[97] <= sum_reg[97];
				sum_reg[98] <= sum_reg[98];
				sum_reg[99] <= sum_reg[99];

			end
			1'b1: begin // accept new values
				sum_reg[0] <= result_reg[0] + bias[0];
				sum_reg[1] <= result_reg[1] + bias[1];
				sum_reg[2] <= result_reg[2] + bias[2];
				sum_reg[3] <= result_reg[3] + bias[3];
				sum_reg[4] <= result_reg[4] + bias[4];
				sum_reg[5] <= result_reg[5] + bias[5];
				sum_reg[6] <= result_reg[6] + bias[6];
				sum_reg[7] <= result_reg[7] + bias[7];
				sum_reg[8] <= result_reg[8] + bias[8];
				sum_reg[9] <= result_reg[9] + bias[9];
				sum_reg[10] <= result_reg[10] + bias[10];
				sum_reg[11] <= result_reg[11] + bias[11];
				sum_reg[12] <= result_reg[12] + bias[12];
				sum_reg[13] <= result_reg[13] + bias[13];
				sum_reg[14] <= result_reg[14] + bias[14];
				sum_reg[15] <= result_reg[15] + bias[15];
				sum_reg[16] <= result_reg[16] + bias[16];
				sum_reg[17] <= result_reg[17] + bias[17];
				sum_reg[18] <= result_reg[18] + bias[18];
				sum_reg[19] <= result_reg[19] + bias[19];
				sum_reg[20] <= result_reg[20] + bias[20];
				sum_reg[21] <= result_reg[21] + bias[21];
				sum_reg[22] <= result_reg[22] + bias[22];
				sum_reg[23] <= result_reg[23] + bias[23];
				sum_reg[24] <= result_reg[24] + bias[24];
				sum_reg[25] <= result_reg[25] + bias[25];
				sum_reg[26] <= result_reg[26] + bias[26];
				sum_reg[27] <= result_reg[27] + bias[27];
				sum_reg[28] <= result_reg[28] + bias[28];
				sum_reg[29] <= result_reg[29] + bias[29];
				sum_reg[30] <= result_reg[30] + bias[30];
				sum_reg[31] <= result_reg[31] + bias[31];
				sum_reg[32] <= result_reg[32] + bias[32];
				sum_reg[33] <= result_reg[33] + bias[33];
				sum_reg[34] <= result_reg[34] + bias[34];
				sum_reg[35] <= result_reg[35] + bias[35];
				sum_reg[36] <= result_reg[36] + bias[36];
				sum_reg[37] <= result_reg[37] + bias[37];
				sum_reg[38] <= result_reg[38] + bias[38];
				sum_reg[39] <= result_reg[39] + bias[39];
				sum_reg[40] <= result_reg[40] + bias[40];
				sum_reg[41] <= result_reg[41] + bias[41];
				sum_reg[42] <= result_reg[42] + bias[42];
				sum_reg[43] <= result_reg[43] + bias[43];
				sum_reg[44] <= result_reg[44] + bias[44];
				sum_reg[45] <= result_reg[45] + bias[45];
				sum_reg[46] <= result_reg[46] + bias[46];
				sum_reg[47] <= result_reg[47] + bias[47];
				sum_reg[48] <= result_reg[48] + bias[48];
				sum_reg[49] <= result_reg[49] + bias[49];
				sum_reg[50] <= result_reg[50] + bias[50];
				sum_reg[51] <= result_reg[51] + bias[51];
				sum_reg[52] <= result_reg[52] + bias[52];
				sum_reg[53] <= result_reg[53] + bias[53];
				sum_reg[54] <= result_reg[54] + bias[54];
				sum_reg[55] <= result_reg[55] + bias[55];
				sum_reg[56] <= result_reg[56] + bias[56];
				sum_reg[57] <= result_reg[57] + bias[57];
				sum_reg[58] <= result_reg[58] + bias[58];
				sum_reg[59] <= result_reg[59] + bias[59];
				sum_reg[60] <= result_reg[60] + bias[60];
				sum_reg[61] <= result_reg[61] + bias[61];
				sum_reg[62] <= result_reg[62] + bias[62];
				sum_reg[63] <= result_reg[63] + bias[63];
				sum_reg[64] <= result_reg[64] + bias[64];
				sum_reg[65] <= result_reg[65] + bias[65];
				sum_reg[66] <= result_reg[66] + bias[66];
				sum_reg[67] <= result_reg[67] + bias[67];
				sum_reg[68] <= result_reg[68] + bias[68];
				sum_reg[69] <= result_reg[69] + bias[69];
				sum_reg[70] <= result_reg[70] + bias[70];
				sum_reg[71] <= result_reg[71] + bias[71];
				sum_reg[72] <= result_reg[72] + bias[72];
				sum_reg[73] <= result_reg[73] + bias[73];
				sum_reg[74] <= result_reg[74] + bias[74];
				sum_reg[75] <= result_reg[75] + bias[75];
				sum_reg[76] <= result_reg[76] + bias[76];
				sum_reg[77] <= result_reg[77] + bias[77];
				sum_reg[78] <= result_reg[78] + bias[78];
				sum_reg[79] <= result_reg[79] + bias[79];
				sum_reg[80] <= result_reg[80] + bias[80];
				sum_reg[81] <= result_reg[81] + bias[81];
				sum_reg[82] <= result_reg[82] + bias[82];
				sum_reg[83] <= result_reg[83] + bias[83];
				sum_reg[84] <= result_reg[84] + bias[84];
				sum_reg[85] <= result_reg[85] + bias[85];
				sum_reg[86] <= result_reg[86] + bias[86];
				sum_reg[87] <= result_reg[87] + bias[87];
				sum_reg[88] <= result_reg[88] + bias[88];
				sum_reg[89] <= result_reg[89] + bias[89];
				sum_reg[90] <= result_reg[90] + bias[90];
				sum_reg[91] <= result_reg[91] + bias[91];
				sum_reg[92] <= result_reg[92] + bias[92];
				sum_reg[93] <= result_reg[93] + bias[93];
				sum_reg[94] <= result_reg[94] + bias[94];
				sum_reg[95] <= result_reg[95] + bias[95];
				sum_reg[96] <= result_reg[96] + bias[96];
				sum_reg[97] <= result_reg[97] + bias[97];
				sum_reg[98] <= result_reg[98] + bias[98];
				sum_reg[99] <= result_reg[99] + bias[99];
			end
			endcase	
		end
		
		// Activation function: basically give 1 if sum >= 0, 0 otherwise
		// We simply look at the MSB of the sum_reg output
		always_comb
		begin
			sum[0] = {15'b0, ~sum_reg[0][15]};
			sum[1] = {15'b0, ~sum_reg[1][15]};
			sum[2] = {15'b0, ~sum_reg[2][15]};
			sum[3] = {15'b0, ~sum_reg[3][15]};
			sum[4] = {15'b0, ~sum_reg[4][15]};
			sum[5] = {15'b0, ~sum_reg[5][15]};
			sum[6] = {15'b0, ~sum_reg[6][15]};
			sum[7] = {15'b0, ~sum_reg[7][15]};
			sum[8] = {15'b0, ~sum_reg[8][15]};
			sum[9] = {15'b0, ~sum_reg[9][15]};
			sum[10] = {15'b0, ~sum_reg[10][15]};
			sum[11] = {15'b0, ~sum_reg[11][15]};
			sum[12] = {15'b0, ~sum_reg[12][15]};
			sum[13] = {15'b0, ~sum_reg[13][15]};
			sum[14] = {15'b0, ~sum_reg[14][15]};
			sum[15] = {15'b0, ~sum_reg[15][15]};
			sum[16] = {15'b0, ~sum_reg[16][15]};
			sum[17] = {15'b0, ~sum_reg[17][15]};
			sum[18] = {15'b0, ~sum_reg[18][15]};
			sum[19] = {15'b0, ~sum_reg[19][15]};
			sum[20] = {15'b0, ~sum_reg[20][15]};
			sum[21] = {15'b0, ~sum_reg[21][15]};
			sum[22] = {15'b0, ~sum_reg[22][15]};
			sum[23] = {15'b0, ~sum_reg[23][15]};
			sum[24] = {15'b0, ~sum_reg[24][15]};
			sum[25] = {15'b0, ~sum_reg[25][15]};
			sum[26] = {15'b0, ~sum_reg[26][15]};
			sum[27] = {15'b0, ~sum_reg[27][15]};
			sum[28] = {15'b0, ~sum_reg[28][15]};
			sum[29] = {15'b0, ~sum_reg[29][15]};
			sum[30] = {15'b0, ~sum_reg[30][15]};
			sum[31] = {15'b0, ~sum_reg[31][15]};
			sum[32] = {15'b0, ~sum_reg[32][15]};
			sum[33] = {15'b0, ~sum_reg[33][15]};
			sum[34] = {15'b0, ~sum_reg[34][15]};
			sum[35] = {15'b0, ~sum_reg[35][15]};
			sum[36] = {15'b0, ~sum_reg[36][15]};
			sum[37] = {15'b0, ~sum_reg[37][15]};
			sum[38] = {15'b0, ~sum_reg[38][15]};
			sum[39] = {15'b0, ~sum_reg[39][15]};
			sum[40] = {15'b0, ~sum_reg[40][15]};
			sum[41] = {15'b0, ~sum_reg[41][15]};
			sum[42] = {15'b0, ~sum_reg[42][15]};
			sum[43] = {15'b0, ~sum_reg[43][15]};
			sum[44] = {15'b0, ~sum_reg[44][15]};
			sum[45] = {15'b0, ~sum_reg[45][15]};
			sum[46] = {15'b0, ~sum_reg[46][15]};
			sum[47] = {15'b0, ~sum_reg[47][15]};
			sum[48] = {15'b0, ~sum_reg[48][15]};
			sum[49] = {15'b0, ~sum_reg[49][15]};
			sum[50] = {15'b0, ~sum_reg[50][15]};
			sum[51] = {15'b0, ~sum_reg[51][15]};
			sum[52] = {15'b0, ~sum_reg[52][15]};
			sum[53] = {15'b0, ~sum_reg[53][15]};
			sum[54] = {15'b0, ~sum_reg[54][15]};
			sum[55] = {15'b0, ~sum_reg[55][15]};
			sum[56] = {15'b0, ~sum_reg[56][15]};
			sum[57] = {15'b0, ~sum_reg[57][15]};
			sum[58] = {15'b0, ~sum_reg[58][15]};
			sum[59] = {15'b0, ~sum_reg[59][15]};
			sum[60] = {15'b0, ~sum_reg[60][15]};
			sum[61] = {15'b0, ~sum_reg[61][15]};
			sum[62] = {15'b0, ~sum_reg[62][15]};
			sum[63] = {15'b0, ~sum_reg[63][15]};
			sum[64] = {15'b0, ~sum_reg[64][15]};
			sum[65] = {15'b0, ~sum_reg[65][15]};
			sum[66] = {15'b0, ~sum_reg[66][15]};
			sum[67] = {15'b0, ~sum_reg[67][15]};
			sum[68] = {15'b0, ~sum_reg[68][15]};
			sum[69] = {15'b0, ~sum_reg[69][15]};
			sum[70] = {15'b0, ~sum_reg[70][15]};
			sum[71] = {15'b0, ~sum_reg[71][15]};
			sum[72] = {15'b0, ~sum_reg[72][15]};
			sum[73] = {15'b0, ~sum_reg[73][15]};
			sum[74] = {15'b0, ~sum_reg[74][15]};
			sum[75] = {15'b0, ~sum_reg[75][15]};
			sum[76] = {15'b0, ~sum_reg[76][15]};
			sum[77] = {15'b0, ~sum_reg[77][15]};
			sum[78] = {15'b0, ~sum_reg[78][15]};
			sum[79] = {15'b0, ~sum_reg[79][15]};
			sum[80] = {15'b0, ~sum_reg[80][15]};
			sum[81] = {15'b0, ~sum_reg[81][15]};
			sum[82] = {15'b0, ~sum_reg[82][15]};
			sum[83] = {15'b0, ~sum_reg[83][15]};
			sum[84] = {15'b0, ~sum_reg[84][15]};
			sum[85] = {15'b0, ~sum_reg[85][15]};
			sum[86] = {15'b0, ~sum_reg[86][15]};
			sum[87] = {15'b0, ~sum_reg[87][15]};
			sum[88] = {15'b0, ~sum_reg[88][15]};
			sum[89] = {15'b0, ~sum_reg[89][15]};
			sum[90] = {15'b0, ~sum_reg[90][15]};
			sum[91] = {15'b0, ~sum_reg[91][15]};
			sum[92] = {15'b0, ~sum_reg[92][15]};
			sum[93] = {15'b0, ~sum_reg[93][15]};
			sum[94] = {15'b0, ~sum_reg[94][15]};
			sum[95] = {15'b0, ~sum_reg[95][15]};
			sum[96] = {15'b0, ~sum_reg[96][15]};
			sum[97] = {15'b0, ~sum_reg[97][15]};
			sum[98] = {15'b0, ~sum_reg[98][15]};
			sum[99] = {15'b0, ~sum_reg[99][15]};
		end
				
endmodule 

module subtract2(input int result_reg[0:9], input shortint bias[0:9],
					input logic clk, subtract,
					output shortint sum[0:9]);	
					
		always_ff @ (posedge clk)
		begin
			case (subtract)
			1'b0: begin
				sum[0] <= 0;
				sum[1] <= 0;
				sum[2] <= 0;
				sum[3] <= 0;
				sum[4] <= 0;
				sum[5] <= 0;
				sum[6] <= 0;
				sum[7] <= 0;
				sum[8] <= 0;
				sum[9] <= 0;
			end
			
			1'b1: begin
				sum[0] <= result_reg[0] + bias[0];
				sum[1] <= result_reg[1] + bias[1];
				sum[2] <= result_reg[2] + bias[2];
				sum[3] <= result_reg[3] + bias[3];
				sum[4] <= result_reg[4] + bias[4];
				sum[5] <= result_reg[5] + bias[5];
				sum[6] <= result_reg[6] + bias[6];
				sum[7] <= result_reg[7] + bias[7];
				sum[8] <= result_reg[8] + bias[8];
				sum[9] <= result_reg[9] + bias[9];
			end
		
			endcase
		end
				
				
endmodule 