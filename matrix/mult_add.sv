// Self-written Multiply-Accumulate Module because I couldn't get ALTMULT_ACCUM to work as I wanted

// Note: One pixel is loaded per clock cycle

module mult_add(input logic pixel, clk, reset, load,					
					output logic complete,
					output shortint result[0:9]);

		enum logic [1:0] {WAIT, STAGE1, STAGE2, READY} state, next_state;
		logic [1:0] pixels; // Holds the first pixel just as we might miss computing first pixel due to state transition
		
		logic stage1_complete, stage2_complete, stage1_load, stage2_load;
		shortint result1_reg[0:99], result2_reg[0:9];
		
		logic [9:0] counter1;
		logic [6:0] counter2;
		logic [4:0]  counter1_out[0:99], counter2_out[0:9];
		logic [3:0]  counter1_bias[0:99], counter2_bias[0:9];
		
		// TODO: add[0:99] for p1 and add[0:9] for p2 will come from matrix that we instantiate later
		mult_add_p1 part1(.add(counter1_out), .complete(stage1_complete), .result(result1_reg), .bias(counter1_bias),
								.load(stage1_load), .counter(counter1), .pixel(pixels[0]), .*);
		mult_add_p2 part2(.add(counter2_out), .complete(stage2_complete), .result(result2_reg), .bias(counter2_bias),
								.load(stage2_load), .counter(counter2), .pixel(result1_reg), .*);
		matrix matrix0(.*);
		
		always_ff @ (posedge clk)
		begin
			if (reset == 1'b1) state <= WAIT;
			else state <= next_state;
		end
		
		always_ff @ (posedge clk) // Circular shift
		begin
			pixels[1] <= pixel;
			pixels[0] <= pixels[1];
		end
		
		// Combinational logic for output bits/flags
		always_comb
		begin
			result[0] = 16'bZ;
			result[1] = 16'bZ;
			result[2] = 16'bZ;
			result[3] = 16'bZ;
			result[4] = 16'bZ;
			result[5] = 16'bZ;
			result[6] = 16'bZ;
			result[7] = 16'bZ;
			result[8] = 16'bZ;
			result[9] = 16'bZ;
			
			complete = 1'b0;
			stage1_load = 1'b0;
			stage2_load = 1'b0;
			
			case (state)
				READY: begin
					complete = 1'b1;
					result = result2_reg;
				end
				
				STAGE1: begin
					stage1_load = 1'b1;
				end
				
				STAGE2: begin
					stage2_load = 1'b1;
				end
				
				default: ;
			endcase
		end
		
		always_comb
		begin
			next_state = state;
			case (state)
				WAIT: begin
					if (load == 1'b1) next_state = STAGE1;
				end
				
				STAGE1: begin 
					if (stage1_complete == 1'b1) next_state = STAGE2;
				end
				
				STAGE2: begin
					if (stage2_complete == 1'b1) next_state = READY;
				end
				
				READY: begin
					if (load == 1'b1) next_state = STAGE1;
				end
				
			endcase
		end
		
			
					
endmodule


// For stage 1 multiplication
// Essentially, we compute one row of 100 multiplications per clock cycle

module mult_add_p1(input shortint add[0:99], // We add row by row (a total of 784 rows)
					input shortint bias[0:99], // Biasing weights
					input logic pixel, // Binary value - either 0 or 1
					input logic clk, reset, load,
					
					output logic complete,
					output logic [9:0] counter, // Max 784
					output shortint result[0:99]);
					
	logic pixel_reg;
	shortint add_reg[0:99], result_reg[0:99];
	
	enum logic [1:0] {WAIT, COMPUTE, COMPUTE_2, READY} state, next_state;
	
	always_ff @ (posedge clk)
	begin
		if (reset == 1'b1) state <= WAIT;
		else state <= next_state;
	end
	
	// Clocked state for counter increment and arithmetric operations
	always_ff @ (posedge clk)
	begin
		case (state)
			WAIT: begin
				counter <= 0;
				result_reg[0] <= 0;
				result_reg[1] <= 0;
				result_reg[2] <= 0;
				result_reg[3] <= 0;
				result_reg[4] <= 0;
				result_reg[5] <= 0;
				result_reg[6] <= 0;
				result_reg[7] <= 0;
				result_reg[8] <= 0;
				result_reg[9] <= 0;
				result_reg[10] <= 0;
				result_reg[11] <= 0;
				result_reg[12] <= 0;
				result_reg[13] <= 0;
				result_reg[14] <= 0;
				result_reg[15] <= 0;
				result_reg[16] <= 0;
				result_reg[17] <= 0;
				result_reg[18] <= 0;
				result_reg[19] <= 0;
				result_reg[20] <= 0;
				result_reg[21] <= 0;
				result_reg[22] <= 0;
				result_reg[23] <= 0;
				result_reg[24] <= 0;
				result_reg[25] <= 0;
				result_reg[26] <= 0;
				result_reg[27] <= 0;
				result_reg[28] <= 0;
				result_reg[29] <= 0;
				result_reg[30] <= 0;
				result_reg[31] <= 0;
				result_reg[32] <= 0;
				result_reg[33] <= 0;
				result_reg[34] <= 0;
				result_reg[35] <= 0;
				result_reg[36] <= 0;
				result_reg[37] <= 0;
				result_reg[38] <= 0;
				result_reg[39] <= 0;
				result_reg[40] <= 0;
				result_reg[41] <= 0;
				result_reg[42] <= 0;
				result_reg[43] <= 0;
				result_reg[44] <= 0;
				result_reg[45] <= 0;
				result_reg[46] <= 0;
				result_reg[47] <= 0;
				result_reg[48] <= 0;
				result_reg[49] <= 0;
				result_reg[50] <= 0;
				result_reg[51] <= 0;
				result_reg[52] <= 0;
				result_reg[53] <= 0;
				result_reg[54] <= 0;
				result_reg[55] <= 0;
				result_reg[56] <= 0;
				result_reg[57] <= 0;
				result_reg[58] <= 0;
				result_reg[59] <= 0;
				result_reg[60] <= 0;
				result_reg[61] <= 0;
				result_reg[62] <= 0;
				result_reg[63] <= 0;
				result_reg[64] <= 0;
				result_reg[65] <= 0;
				result_reg[66] <= 0;
				result_reg[67] <= 0;
				result_reg[68] <= 0;
				result_reg[69] <= 0;
				result_reg[70] <= 0;
				result_reg[71] <= 0;
				result_reg[72] <= 0;
				result_reg[73] <= 0;
				result_reg[74] <= 0;
				result_reg[75] <= 0;
				result_reg[76] <= 0;
				result_reg[77] <= 0;
				result_reg[78] <= 0;
				result_reg[79] <= 0;
				result_reg[80] <= 0;
				result_reg[81] <= 0;
				result_reg[82] <= 0;
				result_reg[83] <= 0;
				result_reg[84] <= 0;
				result_reg[85] <= 0;
				result_reg[86] <= 0;
				result_reg[87] <= 0;
				result_reg[88] <= 0;
				result_reg[89] <= 0;
				result_reg[90] <= 0;
				result_reg[91] <= 0;
				result_reg[92] <= 0;
				result_reg[93] <= 0;
				result_reg[94] <= 0;
				result_reg[95] <= 0;
				result_reg[96] <= 0;
				result_reg[97] <= 0;
				result_reg[98] <= 0;
				result_reg[99] <= 0;
			end
			
			
			COMPUTE: begin
				counter <= counter + 1;
				result_reg[0] <= result_reg[0] + pixel * add[0];
				result_reg[1] <= result_reg[1] + pixel * add[1];
				result_reg[2] <= result_reg[2] + pixel * add[2];
				result_reg[3] <= result_reg[3] + pixel * add[3];
				result_reg[4] <= result_reg[4] + pixel * add[4];
				result_reg[5] <= result_reg[5] + pixel * add[5];
				result_reg[6] <= result_reg[6] + pixel * add[6];
				result_reg[7] <= result_reg[7] + pixel * add[7];
				result_reg[8] <= result_reg[8] + pixel * add[8];
				result_reg[9] <= result_reg[9] + pixel * add[9];
				result_reg[10] <= result_reg[10] + pixel * add[10];
				result_reg[11] <= result_reg[11] + pixel * add[11];
				result_reg[12] <= result_reg[12] + pixel * add[12];
				result_reg[13] <= result_reg[13] + pixel * add[13];
				result_reg[14] <= result_reg[14] + pixel * add[14];
				result_reg[15] <= result_reg[15] + pixel * add[15];
				result_reg[16] <= result_reg[16] + pixel * add[16];
				result_reg[17] <= result_reg[17] + pixel * add[17];
				result_reg[18] <= result_reg[18] + pixel * add[18];
				result_reg[19] <= result_reg[19] + pixel * add[19];
				result_reg[20] <= result_reg[20] + pixel * add[20];
				result_reg[21] <= result_reg[21] + pixel * add[21];
				result_reg[22] <= result_reg[22] + pixel * add[22];
				result_reg[23] <= result_reg[23] + pixel * add[23];
				result_reg[24] <= result_reg[24] + pixel * add[24];
				result_reg[25] <= result_reg[25] + pixel * add[25];
				result_reg[26] <= result_reg[26] + pixel * add[26];
				result_reg[27] <= result_reg[27] + pixel * add[27];
				result_reg[28] <= result_reg[28] + pixel * add[28];
				result_reg[29] <= result_reg[29] + pixel * add[29];
				result_reg[30] <= result_reg[30] + pixel * add[30];
				result_reg[31] <= result_reg[31] + pixel * add[31];
				result_reg[32] <= result_reg[32] + pixel * add[32];
				result_reg[33] <= result_reg[33] + pixel * add[33];
				result_reg[34] <= result_reg[34] + pixel * add[34];
				result_reg[35] <= result_reg[35] + pixel * add[35];
				result_reg[36] <= result_reg[36] + pixel * add[36];
				result_reg[37] <= result_reg[37] + pixel * add[37];
				result_reg[38] <= result_reg[38] + pixel * add[38];
				result_reg[39] <= result_reg[39] + pixel * add[39];
				result_reg[40] <= result_reg[40] + pixel * add[40];
				result_reg[41] <= result_reg[41] + pixel * add[41];
				result_reg[42] <= result_reg[42] + pixel * add[42];
				result_reg[43] <= result_reg[43] + pixel * add[43];
				result_reg[44] <= result_reg[44] + pixel * add[44];
				result_reg[45] <= result_reg[45] + pixel * add[45];
				result_reg[46] <= result_reg[46] + pixel * add[46];
				result_reg[47] <= result_reg[47] + pixel * add[47];
				result_reg[48] <= result_reg[48] + pixel * add[48];
				result_reg[49] <= result_reg[49] + pixel * add[49];
				result_reg[50] <= result_reg[50] + pixel * add[50];
				result_reg[51] <= result_reg[51] + pixel * add[51];
				result_reg[52] <= result_reg[52] + pixel * add[52];
				result_reg[53] <= result_reg[53] + pixel * add[53];
				result_reg[54] <= result_reg[54] + pixel * add[54];
				result_reg[55] <= result_reg[55] + pixel * add[55];
				result_reg[56] <= result_reg[56] + pixel * add[56];
				result_reg[57] <= result_reg[57] + pixel * add[57];
				result_reg[58] <= result_reg[58] + pixel * add[58];
				result_reg[59] <= result_reg[59] + pixel * add[59];
				result_reg[60] <= result_reg[60] + pixel * add[60];
				result_reg[61] <= result_reg[61] + pixel * add[61];
				result_reg[62] <= result_reg[62] + pixel * add[62];
				result_reg[63] <= result_reg[63] + pixel * add[63];
				result_reg[64] <= result_reg[64] + pixel * add[64];
				result_reg[65] <= result_reg[65] + pixel * add[65];
				result_reg[66] <= result_reg[66] + pixel * add[66];
				result_reg[67] <= result_reg[67] + pixel * add[67];
				result_reg[68] <= result_reg[68] + pixel * add[68];
				result_reg[69] <= result_reg[69] + pixel * add[69];
				result_reg[70] <= result_reg[70] + pixel * add[70];
				result_reg[71] <= result_reg[71] + pixel * add[71];
				result_reg[72] <= result_reg[72] + pixel * add[72];
				result_reg[73] <= result_reg[73] + pixel * add[73];
				result_reg[74] <= result_reg[74] + pixel * add[74];
				result_reg[75] <= result_reg[75] + pixel * add[75];
				result_reg[76] <= result_reg[76] + pixel * add[76];
				result_reg[77] <= result_reg[77] + pixel * add[77];
				result_reg[78] <= result_reg[78] + pixel * add[78];
				result_reg[79] <= result_reg[79] + pixel * add[79];
				result_reg[80] <= result_reg[80] + pixel * add[80];
				result_reg[81] <= result_reg[81] + pixel * add[81];
				result_reg[82] <= result_reg[82] + pixel * add[82];
				result_reg[83] <= result_reg[83] + pixel * add[83];
				result_reg[84] <= result_reg[84] + pixel * add[84];
				result_reg[85] <= result_reg[85] + pixel * add[85];
				result_reg[86] <= result_reg[86] + pixel * add[86];
				result_reg[87] <= result_reg[87] + pixel * add[87];
				result_reg[88] <= result_reg[88] + pixel * add[88];
				result_reg[89] <= result_reg[89] + pixel * add[89];
				result_reg[90] <= result_reg[90] + pixel * add[90];
				result_reg[91] <= result_reg[91] + pixel * add[91];
				result_reg[92] <= result_reg[92] + pixel * add[92];
				result_reg[93] <= result_reg[93] + pixel * add[93];
				result_reg[94] <= result_reg[94] + pixel * add[94];
				result_reg[95] <= result_reg[95] + pixel * add[95];
				result_reg[96] <= result_reg[96] + pixel * add[96];
				result_reg[97] <= result_reg[97] + pixel * add[97];
				result_reg[98] <= result_reg[98] + pixel * add[98];
				result_reg[99] <= result_reg[99] + pixel * add[99];				
				end				
				
			COMPUTE_2: begin
				result_reg[0] <= result_reg[0] + bias[0];
				result_reg[1] <= result_reg[1] + bias[1];
				result_reg[2] <= result_reg[2] + bias[2];
				result_reg[3] <= result_reg[3] + bias[3];
				result_reg[4] <= result_reg[4] + bias[4];
				result_reg[5] <= result_reg[5] + bias[5];
				result_reg[6] <= result_reg[6] + bias[6];
				result_reg[7] <= result_reg[7] + bias[7];
				result_reg[8] <= result_reg[8] + bias[8];
				result_reg[9] <= result_reg[9] + bias[9];
				result_reg[10] <= result_reg[10] + bias[10];
				result_reg[11] <= result_reg[11] + bias[11];
				result_reg[12] <= result_reg[12] + bias[12];
				result_reg[13] <= result_reg[13] + bias[13];
				result_reg[14] <= result_reg[14] + bias[14];
				result_reg[15] <= result_reg[15] + bias[15];
				result_reg[16] <= result_reg[16] + bias[16];
				result_reg[17] <= result_reg[17] + bias[17];
				result_reg[18] <= result_reg[18] + bias[18];
				result_reg[19] <= result_reg[19] + bias[19];
				result_reg[20] <= result_reg[20] + bias[20];
				result_reg[21] <= result_reg[21] + bias[21];
				result_reg[22] <= result_reg[22] + bias[22];
				result_reg[23] <= result_reg[23] + bias[23];
				result_reg[24] <= result_reg[24] + bias[24];
				result_reg[25] <= result_reg[25] + bias[25];
				result_reg[26] <= result_reg[26] + bias[26];
				result_reg[27] <= result_reg[27] + bias[27];
				result_reg[28] <= result_reg[28] + bias[28];
				result_reg[29] <= result_reg[29] + bias[29];
				result_reg[30] <= result_reg[30] + bias[30];
				result_reg[31] <= result_reg[31] + bias[31];
				result_reg[32] <= result_reg[32] + bias[32];
				result_reg[33] <= result_reg[33] + bias[33];
				result_reg[34] <= result_reg[34] + bias[34];
				result_reg[35] <= result_reg[35] + bias[35];
				result_reg[36] <= result_reg[36] + bias[36];
				result_reg[37] <= result_reg[37] + bias[37];
				result_reg[38] <= result_reg[38] + bias[38];
				result_reg[39] <= result_reg[39] + bias[39];
				result_reg[40] <= result_reg[40] + bias[40];
				result_reg[41] <= result_reg[41] + bias[41];
				result_reg[42] <= result_reg[42] + bias[42];
				result_reg[43] <= result_reg[43] + bias[43];
				result_reg[44] <= result_reg[44] + bias[44];
				result_reg[45] <= result_reg[45] + bias[45];
				result_reg[46] <= result_reg[46] + bias[46];
				result_reg[47] <= result_reg[47] + bias[47];
				result_reg[48] <= result_reg[48] + bias[48];
				result_reg[49] <= result_reg[49] + bias[49];
				result_reg[50] <= result_reg[50] + bias[50];
				result_reg[51] <= result_reg[51] + bias[51];
				result_reg[52] <= result_reg[52] + bias[52];
				result_reg[53] <= result_reg[53] + bias[53];
				result_reg[54] <= result_reg[54] + bias[54];
				result_reg[55] <= result_reg[55] + bias[55];
				result_reg[56] <= result_reg[56] + bias[56];
				result_reg[57] <= result_reg[57] + bias[57];
				result_reg[58] <= result_reg[58] + bias[58];
				result_reg[59] <= result_reg[59] + bias[59];
				result_reg[60] <= result_reg[60] + bias[60];
				result_reg[61] <= result_reg[61] + bias[61];
				result_reg[62] <= result_reg[62] + bias[62];
				result_reg[63] <= result_reg[63] + bias[63];
				result_reg[64] <= result_reg[64] + bias[64];
				result_reg[65] <= result_reg[65] + bias[65];
				result_reg[66] <= result_reg[66] + bias[66];
				result_reg[67] <= result_reg[67] + bias[67];
				result_reg[68] <= result_reg[68] + bias[68];
				result_reg[69] <= result_reg[69] + bias[69];
				result_reg[70] <= result_reg[70] + bias[70];
				result_reg[71] <= result_reg[71] + bias[71];
				result_reg[72] <= result_reg[72] + bias[72];
				result_reg[73] <= result_reg[73] + bias[73];
				result_reg[74] <= result_reg[74] + bias[74];
				result_reg[75] <= result_reg[75] + bias[75];
				result_reg[76] <= result_reg[76] + bias[76];
				result_reg[77] <= result_reg[77] + bias[77];
				result_reg[78] <= result_reg[78] + bias[78];
				result_reg[79] <= result_reg[79] + bias[79];
				result_reg[80] <= result_reg[80] + bias[80];
				result_reg[81] <= result_reg[81] + bias[81];
				result_reg[82] <= result_reg[82] + bias[82];
				result_reg[83] <= result_reg[83] + bias[83];
				result_reg[84] <= result_reg[84] + bias[84];
				result_reg[85] <= result_reg[85] + bias[85];
				result_reg[86] <= result_reg[86] + bias[86];
				result_reg[87] <= result_reg[87] + bias[87];
				result_reg[88] <= result_reg[88] + bias[88];
				result_reg[89] <= result_reg[89] + bias[89];
				result_reg[90] <= result_reg[90] + bias[90];
				result_reg[91] <= result_reg[91] + bias[91];
				result_reg[92] <= result_reg[92] + bias[92];
				result_reg[93] <= result_reg[93] + bias[93];
				result_reg[94] <= result_reg[94] + bias[94];
				result_reg[95] <= result_reg[95] + bias[95];
				result_reg[96] <= result_reg[96] + bias[96];
				result_reg[97] <= result_reg[97] + bias[97];
				result_reg[98] <= result_reg[98] + bias[98];
				result_reg[99] <= result_reg[99] + bias[99];
			end
			default : ;
		endcase
	end
	
	// Combinational logic for state transition
	always_comb
	begin
		next_state = state;
		case (state)
			WAIT: begin
				if (load == 1'b1) next_state = COMPUTE;
			end
			
			COMPUTE: begin
				if (counter == 784) next_state = COMPUTE_2;
				//else next_state = LOAD;
			end
			
			COMPUTE_2: next_state = READY;
			
			READY: begin
				if (load == 1'b1) next_state = WAIT;
			end
			
		endcase
	end
	
	// Combinational logic for output bits/flags
	always_comb
	begin
		result = result_reg;
		complete = 1'b0;
		case (state)
			READY: begin
				complete = 1'b1;
			end
			
			default: ;
		endcase
	end
	
endmodule 

// For the stage 2 multiply operation
// Essentially, we compute one row of 10 multiplications per clock cycle
module mult_add_p2(input shortint add[0:9], // We add row by row (a total of 100 rows)
					input shortint pixel[0:99], // Binary value - either 0 or 1
					input logic clk, reset, load,
					input shortint bias[0:9],
					
					output logic complete,
					output logic [6:0] counter, // Max 100
					output shortint result[0:9]);
					
	logic pixel_reg;
	shortint add_reg[0:9], result_reg[0:9];
	
	enum logic [1:0] {WAIT, COMPUTE, COMPUTE_2, READY} state, next_state;
	
	always_ff @ (posedge clk)
	begin
		if (reset == 1'b1) state <= WAIT;
		else state <= next_state;
	end
	
	// Clocked state for counter increment
	always_ff @ (posedge clk)
	begin
		case (state)
			WAIT: begin
				counter <= 0;
				result_reg[0] <= 0;
				result_reg[1] <= 0;
				result_reg[2] <= 0;
				result_reg[3] <= 0;
				result_reg[4] <= 0;
				result_reg[5] <= 0;
				result_reg[6] <= 0;
				result_reg[7] <= 0;
				result_reg[8] <= 0;
				result_reg[9] <= 0;
			end
			
			COMPUTE: begin
				counter <= counter + 1;
				result_reg[0] <= result_reg[0] + pixel[counter] * add[0];
				result_reg[1] <= result_reg[1] + pixel[counter] * add[1];
				result_reg[2] <= result_reg[2] + pixel[counter] * add[2];
				result_reg[3] <= result_reg[3] + pixel[counter] * add[3];
				result_reg[4] <= result_reg[4] + pixel[counter] * add[4];
				result_reg[5] <= result_reg[5] + pixel[counter] * add[5];
				result_reg[6] <= result_reg[6] + pixel[counter] * add[6];
				result_reg[7] <= result_reg[7] + pixel[counter] * add[7];
				result_reg[8] <= result_reg[8] + pixel[counter] * add[8];
				result_reg[9] <= result_reg[9] + pixel[counter] * add[9];		
				end

			COMPUTE_2: begin
				result_reg[0] <= result_reg[0] + bias[0];
				result_reg[1] <= result_reg[1] + bias[1];
				result_reg[2] <= result_reg[2] + bias[2];
				result_reg[3] <= result_reg[3] + bias[3];
				result_reg[4] <= result_reg[4] + bias[4];
				result_reg[5] <= result_reg[5] + bias[5];
				result_reg[6] <= result_reg[6] + bias[6];
				result_reg[7] <= result_reg[7] + bias[7];
				result_reg[8] <= result_reg[8] + bias[8];
				result_reg[9] <= result_reg[9] + bias[9];
			end
				
			default : ;
		endcase
	end
	
	// Combinational logic for state transition
	always_comb
	begin
		next_state = state;
		case (state)
			WAIT: begin
				if (load == 1'b1) next_state = COMPUTE;
			end
			
			COMPUTE: begin
				if (counter == 100) next_state = COMPUTE_2;
				//else next_state = LOAD;
			end
			
			COMPUTE_2: begin 
				next_state = READY;
			end
			
			READY: begin
				if (load == 1'b1) next_state = WAIT;
			end
			
		endcase
	end
	
	// Combinational logic for output bits/flags
	always_comb
	begin
		result = result_reg;
		complete = 1'b0;
		case (state)
			READY: begin
				complete = 1'b1;
			end
			
			default: ;
		endcase
	end
					
endmodule 
					