/* This is our LCD module driver 
The LCD module is a display controller called HD44780.

Pin Assignments for LCD Module
LCD_DATA[7] 	PIN_M5		LCD Data[7] 
LCD_DATA[6] 	PIN_M3 		LCD Data[6] 
LCD_DATA[5] 	PIN_K2 		LCD Data[5] 
LCD_DATA[4] 	PIN_K1 		LCD Data[4] 
LCD_DATA[3] 	PIN_K7 		LCD Data[3]  
LCD_DATA[2] 	PIN_L2 		LCD Data[2] 
LCD_DATA[1] 	PIN_L1 		LCD Data[1] 
LCD_DATA[0] 	PIN_L3 		LCD Data[0] 

LCD_EN 			PIN_L4 		LCD Enable 3.3V
LCD_RW 			PIN_M1 		LCD Read/Write Select, 0 = Write, 1 = Read 
LCD_RS 			PIN_M2 		LCD Command/Data Select, 0 = Command, 1 = Data
LCD_ON 			PIN_L5 		LCD Power ON/OFF 3.3V

--> NOTE: NO BACKLIGHT ON DE2-115 LCD <--
LCD_BLON 		PIN_L6 		LCD Back Light ON/OFF 

Resources:
1. http://www.protostack.com/blog/2010/03/character-lcd-displays-part-1/
2. http://irtfweb.ifa.hawaii.edu/~tcs3/tcs3/vendor_info/Technologic_systems/embeddedx86/HD44780_LCD/lcd0.shtml.htm
3. http://www.pyroelectro.com/tutorials/fpga_lcd_interface/theory.html
4. http://fpga4fun.com/TextLCDmodule.html
5. http://faculty.utpa.edu/kuangw/courses/ELEE4303/ch8_part3.pdf
6. https://www.sparkfun.com/datasheets/LCD/HD44780.pdf
*/

// Essentially takes in some data and writes a sequence to the LCD display
module LCD(input clk, reset_n,
			input logic [7:0] userData,
			output logic [7:0] LCD_DATA,
			output logic LCD_EN, LCD_RS, LCD_RW, LCD_ON, done);
			
			assign LCD_ON = 1'b1;
			assign LCD_RW = 1'b0; // Always writing to LCD
			
			enum logic [4:0] { PWR_UP, PWR_UP_DELAY, OFF_PWR_UP_DELAY, WRITE_DATA, DATA_SETUP_DELAY, EN_PULSE_HIGH, 
			EN_HIGH_TIME, EN_PULSE_LOW, PROC_COMP_DELAY, LOAD_NEXT_DATA, END }
			state, next_state;
			
		logic [7:0] to_LCD;
			
		logic [3:0]	instr_count; // instruction counter
			
		logic [20:0] pwr_up_delay_ctr; // delay for 45ms
		logic [1:0] data_setup_delay_ctr; // delay for 80ns
		logic [3:0] en_high_time_ctr; // delay for 240ns
		logic [16:0] proc_comp_delay_ctr; // instruction-specfic delay, ranges between 40us to 4ms
						
		 instruction instr0(.*, .count(instr_count), .instr(to_LCD), .RS(LCD_RS));
			
			always_ff @ (posedge clk)
			begin
				if (reset_n == 1'b0) state <= PWR_UP; 
				else state <= next_state;				
			end
			
			always_ff @ (posedge clk)
			begin 
			// Increment a counter based on the state
				case (state)				
					PWR_UP_DELAY: pwr_up_delay_ctr <= pwr_up_delay_ctr + 1;
					DATA_SETUP_DELAY: data_setup_delay_ctr <= data_setup_delay_ctr + 1;
					EN_HIGH_TIME: en_high_time_ctr <= en_high_time_ctr + 1;
					PROC_COMP_DELAY: proc_comp_delay_ctr <= proc_comp_delay_ctr + 1;
					LOAD_NEXT_DATA: instr_count <= instr_count + 1;
					
					
					PWR_UP: begin
						instr_count <= 0;
						pwr_up_delay_ctr <= 0;
						data_setup_delay_ctr <= 0;
						en_high_time_ctr <= 0;
						proc_comp_delay_ctr <= 0;
					end
	
					EN_PULSE_LOW: en_high_time_ctr <= 0;
										
					default: begin
						pwr_up_delay_ctr <= pwr_up_delay_ctr;
						data_setup_delay_ctr <= data_setup_delay_ctr;
						en_high_time_ctr <= en_high_time_ctr;
						proc_comp_delay_ctr <= proc_comp_delay_ctr;
						instr_count <= instr_count;
					end
					
				endcase
			end
			
			always_comb
			begin
				case (done)
				1'b0: LCD_DATA = to_LCD;
				1'b1: LCD_DATA = 8'hXX;
				endcase
			end
			
			
			// Combinational Block for State Transitions
			always_comb 
			begin
				next_state = state;
				case (state)
					PWR_UP: next_state = PWR_UP_DELAY;
					PWR_UP_DELAY: 
					begin
					//if (pwr_up_delay_ctr > 2000000)
						next_state = OFF_PWR_UP_DELAY;
					end
					OFF_PWR_UP_DELAY: next_state = WRITE_DATA;
					
					WRITE_DATA: next_state = DATA_SETUP_DELAY;
					DATA_SETUP_DELAY: begin
					if (data_setup_delay_ctr == 3)
						next_state = EN_PULSE_HIGH;
					end
					
					EN_PULSE_HIGH: next_state = EN_HIGH_TIME;
					EN_HIGH_TIME: begin
					if (en_high_time_ctr > 8)
						next_state = EN_PULSE_LOW;
					end
					
					EN_PULSE_LOW: next_state = PROC_COMP_DELAY;
					
					PROC_COMP_DELAY: begin
					//if (proc_comp_delay_ctr == 131072)
						next_state = LOAD_NEXT_DATA;
					end
					
					LOAD_NEXT_DATA: begin
					if (instr_count < 15) next_state = WRITE_DATA;
					else next_state = END;
					end
					
					END: next_state = END;
				endcase
			end
			
			// Combinational Block for Output Bits/Flags
			always_comb 
			begin
				LCD_EN = 1'b0;
				done = 1'b0;
				
				case (state)					
					EN_PULSE_HIGH: LCD_EN = 1'b1;
					EN_HIGH_TIME: LCD_EN = 1'b1;
					
					END: done = 1'b1;
						
					default : ;
					
				endcase	
			end

endmodule 


// We put all our instructions here
module instruction(input clk, input logic[3:0] count, output logic[7:0] instr, output logic RS);
	always_comb
	begin
	case (count)
		4'h0: begin
		instr = 8'h38; // Function Set
		RS = 1'b0;
		end
		4'h1: begin
		instr = 8'h38; // Function Set
		RS = 1'b0;
		end
		4'h2: begin
		instr = 8'h38; // Function Set
		RS = 1'b0;
		end
		4'h3: begin
		instr = 8'h38; // Function Set
		RS = 1'b0;
		end
		
		4'h4: begin
		instr = 8'h01; // Clear display
		RS = 1'b0;
		end
		
		4'h5: begin
		instr = 8'h0f; // Display ON, Cursor ON, Blinking ON
		RS = 1'b0;
		end
		
		4'h6: begin
		instr = 8'h06; // Entry Mode Set, Auto-Increment, No Shift
		RS = 1'b0;
		end
		
		4'h7: begin
		instr = 8'h68; // ASCII 'h'
		RS = 1'b1;
		end
		
		4'h8: begin
		instr = 8'h65; // ASCII 'e'
		RS = 1'b1;
		end
		
		4'h9: begin
		instr = 8'h6c; // ASCII 'l'
		RS = 1'b1;
		end
		
		4'ha: begin
		instr = 8'h6c; // ASCII 'l'
		RS = 1'b1;
		end
		
		4'hb: begin
		instr = 8'h6f; // ASCII 'o'
		RS = 1'b1;
		end
		
		4'hc: begin
		instr = 8'h20; // ASCII ' '
		RS = 1'b1;
		end
		
		4'hd: begin
		instr = 8'h61; // ASCII 'a'
		RS = 1'b1;
		end
		
		4'he: begin
		instr = 8'h6c; // ASCII 'l'
		RS = 1'b1;
		end
		
		4'hf: begin
		instr = 8'h6c; // ASCII 'l'
		RS = 1'b1;
		end
		
		default: ;
	
	endcase
end
	endmodule
	

