// Note: One pixel is loaded per clock cycle

module multiply_add (input logic pixel, clk, reset, load,					
					output logic complete,
					output shortint result[0:9]);
					
		logic [1:0] pixels; // Holds the first pixel just as we might miss computing first pixel due to state transition
		enum logic [1:0] {WAIT, STAGE1, STAGE2, READY} state, next_state;
		
		logic stage1_complete, stage2_complete, stage1_load, stage2_load;
		shortint result1_reg[0:99], result2_reg[0:9];
		
		logic [9:0] counter1;
		logic [6:0] counter2;
		shortint counter1_out[0:99], counter2_out[0:9];
		shortint counter1_bias[0:99], counter2_bias[0:9];
		
		matrix matrix0(.*);
		mult_add_stage1 mult_add1(.add(counter1_out), .bias(counter1_bias),
											.counter(counter1), .complete(stage1_complete),
											.result(result1_reg), .load(stage1_load), .*);
		
		mult_add_stage2 mult_add2(.add(counter2_out), .bias(counter2_bias), 
											.counter(counter2), .complete(stage2_complete),
											.result(result2_reg), .pixel(result1_reg), .load(stage2_load), .*);
		
		
		always_ff @ (posedge clk)
		begin
			if (reset == 1'b1) state <= WAIT;
			else state <= next_state;
		end
		
		// Circular shift for the pixel bits in STAGE1
		always_ff @ (posedge clk)
		begin
			case (state)
				STAGE1: begin
					pixels[1] <= pixel;
					pixels[0] <= pixels[1];
				end
				
				default : begin
					pixels <= pixels;
				end
			endcase
		end
		
		// We want to latch the output of the result
		always_ff @ (posedge clk)
		begin
			case (state)
				READY: begin
					result[0] <= result[0];
					result[1] <= result[1];
					result[2] <= result[2];
					result[3] <= result[3];
					result[4] <= result[4];
					result[5] <= result[5];
					result[6] <= result[6];
					result[7] <= result[7];
					result[8] <= result[8];
					result[9] <= result[9];
				end
				STAGE2: begin
					result[0] <= result2_reg[0];
					result[1] <= result2_reg[1];
					result[2] <= result2_reg[2];
					result[3] <= result2_reg[3];
					result[4] <= result2_reg[4];
					result[5] <= result2_reg[5];
					result[6] <= result2_reg[6];
					result[7] <= result2_reg[7];
					result[8] <= result2_reg[8];
					result[9] <= result2_reg[9];
				end
				default: begin
					result[0] <= 0;
					result[1] <= 0;
					result[2] <= 0;
					result[3] <= 0;
					result[4] <= 0;
					result[5] <= 0;
					result[6] <= 0;
					result[7] <= 0;
					result[8] <= 0;
					result[9] <= 0;
				end
			
			endcase		
		end
		
		
		// next_state control logic
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
					if (load == 1'b1) next_state = WAIT;
				end
			endcase
		
		end
		
		// Output bits/flags
		always_comb
		begin
			stage1_load = 1'b0;
			stage2_load = 1'b0;
			complete = 1'b0;
			
			case(state)
				WAIT: ;
				STAGE1: stage1_load = 1'b1;
				STAGE2: stage2_load = 1'b1;
				
				READY: begin
					complete = 1'b1;
					
				end
			endcase
		end
				
endmodule 

module mult_add_stage1(input shortint add[0:99], // We add row by row (a total of 784 rows)
					input shortint bias[0:99], // Biasing weights
					input logic pixel, // Binary value - either 0 or 1
					input logic clk, reset, load,
					
					output logic [9:0] counter, // Max 784
					output logic complete,
					output shortint result[0:99]);
		
		shortint add_reg[0:99];
		int result_reg[0:99];
		enum logic [1:0] {WAIT, COMPUTE, COMPUTE_2, READY} state, next_state;
		logic [1:0] delay; // Internal delay for multiply-add IP (needs 3 cycles to show result)
		logic [1:0] delay_r; // Delay to hold the result at the output
		logic subtract; // Used in the COMPUTE_2 stage so we only subtract once
	
		// Bits renamed for use with the mult_acc names (internal reset, clk, pixel)
		logic aclr3; // Internal reset signal
		logic clock0; // Clock
		logic [15:0] datab; // Pixel

		// State transition logic
		always_ff @ (posedge clk)
		begin
			if (reset == 1'b1) state <= WAIT;
			else state <= next_state;
		end
		
		// Counter control logic
		always_ff @ (posedge clk) 
		begin
			case (state)
				COMPUTE: begin
					counter <= counter + 1'b1;
					delay <= 0;
					delay_r <= 0;
				end
				COMPUTE_2: begin
					counter <= 0;
					delay <= delay + 1'b1;
				end
				READY: begin
					delay_r <= delay_r + 1'b1;
				end
				default: counter <= 0;
			endcase
		end
		
		// Next state logic
		always_comb
		begin
			next_state = state;
			case (state)
				WAIT: begin
					if (load == 1'b1) next_state = COMPUTE;
				end
				
				COMPUTE: begin
					if (counter == 784) next_state = COMPUTE_2;
				end
				
				COMPUTE_2: begin
					// Need to check timing simulation for exact value of delay to look out for
					if (delay == 2) next_state = READY;
				end
				
				READY: begin
					if (delay_r == 2'b11) next_state = WAIT;
				end
			endcase
		end
			
			
		// Output bits/flags logic
		always_comb
		begin
			
			subtract = 1'b0;
			complete = 1'b0;
			aclr3 = 1'b0;
			datab = 16'b0;
			
			case (state)
				WAIT: begin
					aclr3 = 1'b1;
				end
				
				COMPUTE: begin
					datab[0] = pixel;
				end
				
				COMPUTE_2: begin
					// Need to check timing simulation for exact value of delay to look out for
					if (delay == 2) subtract = 1'b1;
				end
				
				READY: begin
					complete = 1'b1;
				end
			endcase	
		end
		
		subtract subtract0(.sum(result), .*);
		
		assign clock0 = clk;
		//assign datab = pixel; --> MUX this value depending on the current state
		
		
		mult_acc mult_acc0(.*, .dataa(add[0]), .result(result_reg[0]));
		mult_acc mult_acc1(.*, .dataa(add[1]), .result(result_reg[1]));
		mult_acc mult_acc2(.*, .dataa(add[2]), .result(result_reg[2]));
		mult_acc mult_acc3(.*, .dataa(add[3]), .result(result_reg[3]));
		mult_acc mult_acc4(.*, .dataa(add[4]), .result(result_reg[4]));
		mult_acc mult_acc5(.*, .dataa(add[5]), .result(result_reg[5]));
		mult_acc mult_acc6(.*, .dataa(add[6]), .result(result_reg[6]));
		mult_acc mult_acc7(.*, .dataa(add[7]), .result(result_reg[7]));
		mult_acc mult_acc8(.*, .dataa(add[8]), .result(result_reg[8]));
		mult_acc mult_acc9(.*, .dataa(add[9]), .result(result_reg[9]));
		mult_acc mult_acc10(.*, .dataa(add[10]), .result(result_reg[10]));
		mult_acc mult_acc11(.*, .dataa(add[11]), .result(result_reg[11]));
		mult_acc mult_acc12(.*, .dataa(add[12]), .result(result_reg[12]));
		mult_acc mult_acc13(.*, .dataa(add[13]), .result(result_reg[13]));
		mult_acc mult_acc14(.*, .dataa(add[14]), .result(result_reg[14]));
		mult_acc mult_acc15(.*, .dataa(add[15]), .result(result_reg[15]));
		mult_acc mult_acc16(.*, .dataa(add[16]), .result(result_reg[16]));
		mult_acc mult_acc17(.*, .dataa(add[17]), .result(result_reg[17]));
		mult_acc mult_acc18(.*, .dataa(add[18]), .result(result_reg[18]));
		mult_acc mult_acc19(.*, .dataa(add[19]), .result(result_reg[19]));
		mult_acc mult_acc20(.*, .dataa(add[20]), .result(result_reg[20]));
		mult_acc mult_acc21(.*, .dataa(add[21]), .result(result_reg[21]));
		mult_acc mult_acc22(.*, .dataa(add[22]), .result(result_reg[22]));
		mult_acc mult_acc23(.*, .dataa(add[23]), .result(result_reg[23]));
		mult_acc mult_acc24(.*, .dataa(add[24]), .result(result_reg[24]));
		mult_acc mult_acc25(.*, .dataa(add[25]), .result(result_reg[25]));
		mult_acc mult_acc26(.*, .dataa(add[26]), .result(result_reg[26]));
		mult_acc mult_acc27(.*, .dataa(add[27]), .result(result_reg[27]));
		mult_acc mult_acc28(.*, .dataa(add[28]), .result(result_reg[28]));
		mult_acc mult_acc29(.*, .dataa(add[29]), .result(result_reg[29]));
		mult_acc mult_acc30(.*, .dataa(add[30]), .result(result_reg[30]));
		mult_acc mult_acc31(.*, .dataa(add[31]), .result(result_reg[31]));
		mult_acc mult_acc32(.*, .dataa(add[32]), .result(result_reg[32]));
		mult_acc mult_acc33(.*, .dataa(add[33]), .result(result_reg[33]));
		mult_acc mult_acc34(.*, .dataa(add[34]), .result(result_reg[34]));
		mult_acc mult_acc35(.*, .dataa(add[35]), .result(result_reg[35]));
		mult_acc mult_acc36(.*, .dataa(add[36]), .result(result_reg[36]));
		mult_acc mult_acc37(.*, .dataa(add[37]), .result(result_reg[37]));
		mult_acc mult_acc38(.*, .dataa(add[38]), .result(result_reg[38]));
		mult_acc mult_acc39(.*, .dataa(add[39]), .result(result_reg[39]));
		mult_acc mult_acc40(.*, .dataa(add[40]), .result(result_reg[40]));
		mult_acc mult_acc41(.*, .dataa(add[41]), .result(result_reg[41]));
		mult_acc mult_acc42(.*, .dataa(add[42]), .result(result_reg[42]));
		mult_acc mult_acc43(.*, .dataa(add[43]), .result(result_reg[43]));
		mult_acc mult_acc44(.*, .dataa(add[44]), .result(result_reg[44]));
		mult_acc mult_acc45(.*, .dataa(add[45]), .result(result_reg[45]));
		mult_acc mult_acc46(.*, .dataa(add[46]), .result(result_reg[46]));
		mult_acc mult_acc47(.*, .dataa(add[47]), .result(result_reg[47]));
		mult_acc mult_acc48(.*, .dataa(add[48]), .result(result_reg[48]));
		mult_acc mult_acc49(.*, .dataa(add[49]), .result(result_reg[49]));
		mult_acc mult_acc50(.*, .dataa(add[50]), .result(result_reg[50]));
		mult_acc mult_acc51(.*, .dataa(add[51]), .result(result_reg[51]));
		mult_acc mult_acc52(.*, .dataa(add[52]), .result(result_reg[52]));
		mult_acc mult_acc53(.*, .dataa(add[53]), .result(result_reg[53]));
		mult_acc mult_acc54(.*, .dataa(add[54]), .result(result_reg[54]));
		mult_acc mult_acc55(.*, .dataa(add[55]), .result(result_reg[55]));
		mult_acc mult_acc56(.*, .dataa(add[56]), .result(result_reg[56]));
		mult_acc mult_acc57(.*, .dataa(add[57]), .result(result_reg[57]));
		mult_acc mult_acc58(.*, .dataa(add[58]), .result(result_reg[58]));
		mult_acc mult_acc59(.*, .dataa(add[59]), .result(result_reg[59]));
		mult_acc mult_acc60(.*, .dataa(add[60]), .result(result_reg[60]));
		mult_acc mult_acc61(.*, .dataa(add[61]), .result(result_reg[61]));
		mult_acc mult_acc62(.*, .dataa(add[62]), .result(result_reg[62]));
		mult_acc mult_acc63(.*, .dataa(add[63]), .result(result_reg[63]));
		mult_acc mult_acc64(.*, .dataa(add[64]), .result(result_reg[64]));
		mult_acc mult_acc65(.*, .dataa(add[65]), .result(result_reg[65]));
		mult_acc mult_acc66(.*, .dataa(add[66]), .result(result_reg[66]));
		mult_acc mult_acc67(.*, .dataa(add[67]), .result(result_reg[67]));
		mult_acc mult_acc68(.*, .dataa(add[68]), .result(result_reg[68]));
		mult_acc mult_acc69(.*, .dataa(add[69]), .result(result_reg[69]));
		mult_acc mult_acc70(.*, .dataa(add[70]), .result(result_reg[70]));
		mult_acc mult_acc71(.*, .dataa(add[71]), .result(result_reg[71]));
		mult_acc mult_acc72(.*, .dataa(add[72]), .result(result_reg[72]));
		mult_acc mult_acc73(.*, .dataa(add[73]), .result(result_reg[73]));
		mult_acc mult_acc74(.*, .dataa(add[74]), .result(result_reg[74]));
		mult_acc mult_acc75(.*, .dataa(add[75]), .result(result_reg[75]));
		mult_acc mult_acc76(.*, .dataa(add[76]), .result(result_reg[76]));
		mult_acc mult_acc77(.*, .dataa(add[77]), .result(result_reg[77]));
		mult_acc mult_acc78(.*, .dataa(add[78]), .result(result_reg[78]));
		mult_acc mult_acc79(.*, .dataa(add[79]), .result(result_reg[79]));
		mult_acc mult_acc80(.*, .dataa(add[80]), .result(result_reg[80]));
		mult_acc mult_acc81(.*, .dataa(add[81]), .result(result_reg[81]));
		mult_acc mult_acc82(.*, .dataa(add[82]), .result(result_reg[82]));
		mult_acc mult_acc83(.*, .dataa(add[83]), .result(result_reg[83]));
		mult_acc mult_acc84(.*, .dataa(add[84]), .result(result_reg[84]));
		mult_acc mult_acc85(.*, .dataa(add[85]), .result(result_reg[85]));
		mult_acc mult_acc86(.*, .dataa(add[86]), .result(result_reg[86]));
		mult_acc mult_acc87(.*, .dataa(add[87]), .result(result_reg[87]));
		mult_acc mult_acc88(.*, .dataa(add[88]), .result(result_reg[88]));
		mult_acc mult_acc89(.*, .dataa(add[89]), .result(result_reg[89]));
		mult_acc mult_acc90(.*, .dataa(add[90]), .result(result_reg[90]));
		mult_acc mult_acc91(.*, .dataa(add[91]), .result(result_reg[91]));
		mult_acc mult_acc92(.*, .dataa(add[92]), .result(result_reg[92]));
		mult_acc mult_acc93(.*, .dataa(add[93]), .result(result_reg[93]));
		mult_acc mult_acc94(.*, .dataa(add[94]), .result(result_reg[94]));
		mult_acc mult_acc95(.*, .dataa(add[95]), .result(result_reg[95]));
		mult_acc mult_acc96(.*, .dataa(add[96]), .result(result_reg[96]));
		mult_acc mult_acc97(.*, .dataa(add[97]), .result(result_reg[97]));
		mult_acc mult_acc98(.*, .dataa(add[98]), .result(result_reg[98]));
		mult_acc mult_acc99(.*, .dataa(add[99]), .result(result_reg[99]));

endmodule
		
module mult_add_stage2(input shortint add[0:9], // We add row by row (a total of 100 rows)
					input shortint bias[0:9], // Biasing weights
					input shortint pixel[0:99], // Taken from the 100-by-1 array result of part 1
					input logic clk, reset, load,
					
					output logic [6:0] counter, // Max 100
					output logic complete,
					output shortint result[0:9]);
		
		shortint add_reg[0:99];
		int result_reg[0:9];
		enum logic [1:0] {WAIT, COMPUTE, COMPUTE_2, READY} state, next_state;
		logic [1:0] delay; // Internal delay for multiply-add IP (needs 3 cycles to show result)
		logic subtract; // Used in the COMPUTE_2 stage so we only subtract once
		
		// Bits renamed for use with the mult_acc names (internal reset, clk, pixel)
		logic aclr3; // Internal reset signal
		logic clock0; // Clock
		logic [15:0] datab; // Pixel

		// State transition logic
		always_ff @ (posedge clk)
		begin
			if (reset == 1'b1) state <= WAIT;
			else state <= next_state;
		end
		
		// Counter control logic
		always_ff @ (posedge clk) 
		begin
			case (state)
				COMPUTE: begin
					counter <= counter + 1'b1;
					delay <= 0;
				end
				COMPUTE_2: begin
					counter <= 0;
					delay <= delay + 1'b1;
				end
				default: counter <= 0;
			endcase
		end
		
		// Next state logic
		always_comb
		begin
			next_state = state;
			case (state)
				WAIT: begin
					if (load == 1'b1) next_state = COMPUTE;
				end
				
				COMPUTE: begin
					if (counter == 100) next_state = COMPUTE_2;
				end
				
				COMPUTE_2: begin
					// Need to check timing simulation for exact value of delay to look out for
					if (delay == 2) next_state = READY;
				end
				
				READY: begin
					if (load == 1'b1) next_state = WAIT;
				end
			endcase
		end
			
			
		// Output bits/flags logic
		always_comb
		begin
			subtract = 1'b0;
			complete = 1'b0;
			aclr3 = 1'b0;
			datab = 16'b0;
			
			case (state)
				WAIT: begin
					aclr3 = 1'b1;
				end
				
				COMPUTE: begin
					datab = pixel[counter];
				end
				
				COMPUTE_2: begin
					// Need to check timing simulation for exact value of delay to look out for
					if (delay == 2) subtract = 1'b1;
				end
				
				READY: begin
					complete = 1'b1;
				end
			endcase	
		end
		
		subtract2 subtract02(.sum(result), .*);
		
		assign clock0 = clk;
		//assign datab = pixel; --> MUX this value depending on the current state
		
		
		mult_acc mult_acc0(.*, .dataa(add[0]), .result(result_reg[0]));
		mult_acc mult_acc1(.*, .dataa(add[1]), .result(result_reg[1]));
		mult_acc mult_acc2(.*, .dataa(add[2]), .result(result_reg[2]));
		mult_acc mult_acc3(.*, .dataa(add[3]), .result(result_reg[3]));
		mult_acc mult_acc4(.*, .dataa(add[4]), .result(result_reg[4]));
		mult_acc mult_acc5(.*, .dataa(add[5]), .result(result_reg[5]));
		mult_acc mult_acc6(.*, .dataa(add[6]), .result(result_reg[6]));
		mult_acc mult_acc7(.*, .dataa(add[7]), .result(result_reg[7]));
		mult_acc mult_acc8(.*, .dataa(add[8]), .result(result_reg[8]));
		mult_acc mult_acc9(.*, .dataa(add[9]), .result(result_reg[9]));

endmodule
		
		