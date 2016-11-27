module subtract(input shortint result_reg[0:99], input shortint bias[0:99],
					input logic clk, subtract,
					output shortint sum[0:99]);	
					
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
				sum[10] <= 0;
				sum[11] <= 0;
				sum[12] <= 0;
				sum[13] <= 0;
				sum[14] <= 0;
				sum[15] <= 0;
				sum[16] <= 0;
				sum[17] <= 0;
				sum[18] <= 0;
				sum[19] <= 0;
				sum[20] <= 0;
				sum[21] <= 0;
				sum[22] <= 0;
				sum[23] <= 0;
				sum[24] <= 0;
				sum[25] <= 0;
				sum[26] <= 0;
				sum[27] <= 0;
				sum[28] <= 0;
				sum[29] <= 0;
				sum[30] <= 0;
				sum[31] <= 0;
				sum[32] <= 0;
				sum[33] <= 0;
				sum[34] <= 0;
				sum[35] <= 0;
				sum[36] <= 0;
				sum[37] <= 0;
				sum[38] <= 0;
				sum[39] <= 0;
				sum[40] <= 0;
				sum[41] <= 0;
				sum[42] <= 0;
				sum[43] <= 0;
				sum[44] <= 0;
				sum[45] <= 0;
				sum[46] <= 0;
				sum[47] <= 0;
				sum[48] <= 0;
				sum[49] <= 0;
				sum[50] <= 0;
				sum[51] <= 0;
				sum[52] <= 0;
				sum[53] <= 0;
				sum[54] <= 0;
				sum[55] <= 0;
				sum[56] <= 0;
				sum[57] <= 0;
				sum[58] <= 0;
				sum[59] <= 0;
				sum[60] <= 0;
				sum[61] <= 0;
				sum[62] <= 0;
				sum[63] <= 0;
				sum[64] <= 0;
				sum[65] <= 0;
				sum[66] <= 0;
				sum[67] <= 0;
				sum[68] <= 0;
				sum[69] <= 0;
				sum[70] <= 0;
				sum[71] <= 0;
				sum[72] <= 0;
				sum[73] <= 0;
				sum[74] <= 0;
				sum[75] <= 0;
				sum[76] <= 0;
				sum[77] <= 0;
				sum[78] <= 0;
				sum[79] <= 0;
				sum[80] <= 0;
				sum[81] <= 0;
				sum[82] <= 0;
				sum[83] <= 0;
				sum[84] <= 0;
				sum[85] <= 0;
				sum[86] <= 0;
				sum[87] <= 0;
				sum[88] <= 0;
				sum[89] <= 0;
				sum[90] <= 0;
				sum[91] <= 0;
				sum[92] <= 0;
				sum[93] <= 0;
				sum[94] <= 0;
				sum[95] <= 0;
				sum[96] <= 0;
				sum[97] <= 0;
				sum[98] <= 0;
				sum[99] <= 0;
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
				sum[10] <= result_reg[10] + bias[10];
				sum[11] <= result_reg[11] + bias[11];
				sum[12] <= result_reg[12] + bias[12];
				sum[13] <= result_reg[13] + bias[13];
				sum[14] <= result_reg[14] + bias[14];
				sum[15] <= result_reg[15] + bias[15];
				sum[16] <= result_reg[16] + bias[16];
				sum[17] <= result_reg[17] + bias[17];
				sum[18] <= result_reg[18] + bias[18];
				sum[19] <= result_reg[19] + bias[19];
				sum[20] <= result_reg[20] + bias[20];
				sum[21] <= result_reg[21] + bias[21];
				sum[22] <= result_reg[22] + bias[22];
				sum[23] <= result_reg[23] + bias[23];
				sum[24] <= result_reg[24] + bias[24];
				sum[25] <= result_reg[25] + bias[25];
				sum[26] <= result_reg[26] + bias[26];
				sum[27] <= result_reg[27] + bias[27];
				sum[28] <= result_reg[28] + bias[28];
				sum[29] <= result_reg[29] + bias[29];
				sum[30] <= result_reg[30] + bias[30];
				sum[31] <= result_reg[31] + bias[31];
				sum[32] <= result_reg[32] + bias[32];
				sum[33] <= result_reg[33] + bias[33];
				sum[34] <= result_reg[34] + bias[34];
				sum[35] <= result_reg[35] + bias[35];
				sum[36] <= result_reg[36] + bias[36];
				sum[37] <= result_reg[37] + bias[37];
				sum[38] <= result_reg[38] + bias[38];
				sum[39] <= result_reg[39] + bias[39];
				sum[40] <= result_reg[40] + bias[40];
				sum[41] <= result_reg[41] + bias[41];
				sum[42] <= result_reg[42] + bias[42];
				sum[43] <= result_reg[43] + bias[43];
				sum[44] <= result_reg[44] + bias[44];
				sum[45] <= result_reg[45] + bias[45];
				sum[46] <= result_reg[46] + bias[46];
				sum[47] <= result_reg[47] + bias[47];
				sum[48] <= result_reg[48] + bias[48];
				sum[49] <= result_reg[49] + bias[49];
				sum[50] <= result_reg[50] + bias[50];
				sum[51] <= result_reg[51] + bias[51];
				sum[52] <= result_reg[52] + bias[52];
				sum[53] <= result_reg[53] + bias[53];
				sum[54] <= result_reg[54] + bias[54];
				sum[55] <= result_reg[55] + bias[55];
				sum[56] <= result_reg[56] + bias[56];
				sum[57] <= result_reg[57] + bias[57];
				sum[58] <= result_reg[58] + bias[58];
				sum[59] <= result_reg[59] + bias[59];
				sum[60] <= result_reg[60] + bias[60];
				sum[61] <= result_reg[61] + bias[61];
				sum[62] <= result_reg[62] + bias[62];
				sum[63] <= result_reg[63] + bias[63];
				sum[64] <= result_reg[64] + bias[64];
				sum[65] <= result_reg[65] + bias[65];
				sum[66] <= result_reg[66] + bias[66];
				sum[67] <= result_reg[67] + bias[67];
				sum[68] <= result_reg[68] + bias[68];
				sum[69] <= result_reg[69] + bias[69];
				sum[70] <= result_reg[70] + bias[70];
				sum[71] <= result_reg[71] + bias[71];
				sum[72] <= result_reg[72] + bias[72];
				sum[73] <= result_reg[73] + bias[73];
				sum[74] <= result_reg[74] + bias[74];
				sum[75] <= result_reg[75] + bias[75];
				sum[76] <= result_reg[76] + bias[76];
				sum[77] <= result_reg[77] + bias[77];
				sum[78] <= result_reg[78] + bias[78];
				sum[79] <= result_reg[79] + bias[79];
				sum[80] <= result_reg[80] + bias[80];
				sum[81] <= result_reg[81] + bias[81];
				sum[82] <= result_reg[82] + bias[82];
				sum[83] <= result_reg[83] + bias[83];
				sum[84] <= result_reg[84] + bias[84];
				sum[85] <= result_reg[85] + bias[85];
				sum[86] <= result_reg[86] + bias[86];
				sum[87] <= result_reg[87] + bias[87];
				sum[88] <= result_reg[88] + bias[88];
				sum[89] <= result_reg[89] + bias[89];
				sum[90] <= result_reg[90] + bias[90];
				sum[91] <= result_reg[91] + bias[91];
				sum[92] <= result_reg[92] + bias[92];
				sum[93] <= result_reg[93] + bias[93];
				sum[94] <= result_reg[94] + bias[94];
				sum[95] <= result_reg[95] + bias[95];
				sum[96] <= result_reg[96] + bias[96];
				sum[97] <= result_reg[97] + bias[97];
				sum[98] <= result_reg[98] + bias[98];
				sum[99] <= result_reg[99] + bias[99];
			end
		
			endcase
		end
				
				
endmodule 

module subtract2(input shortint result_reg[0:9], input shortint bias[0:9],
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