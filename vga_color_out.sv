module vga_color_out (input clk,
						//input reset_n,
						input logic [3:0] key,
						input logic [9:0] temp_R,
						input logic [9:0] temp_G,
						input logic [9:0] temp_B,
						output logic [7:0] VGA_R,
						output logic [7:0] VGA_G,
						output logic [7:0] VGA_B,
						output logic [1:0] key_ctr);
						
	logic [11:0] temp_gray;
	logic [9:0] gray;
	logic [7:0] binary;
	logic bw;
	logic ctr_enable;


//	assign temp_gray = temp_R + temp_G + temp_B + temp_G;
//	assign gray = temp_gray >> 2;
//	assign binary = (gray[9:2] > 8'h80)? 8'hff : 8'h00;
	rgb2gray u1(.pixl_R(temp_R),
					.pixl_G(temp_G),
					.pixl_B(temp_B),
					.pixl_gray(gray) );
					
	gray2bw u2(.pixl_gray(gray),
				  .pixl_bw(bw)     );	
				  
	assign binary = {8{bw}};
	
	//assign binary = 8'hff;

	enum logic [1:0] {WAIT, PRESS, RELEASE} state, next_state; 
	always_ff @ (posedge clk or negedge key[0])
	begin 	
			if (~key[0])
				state <= WAIT;
			else
				state <= next_state;
	end
	
	always_comb
	begin
			ctr_enable = 1'b0;
			next_state = state;
			unique case(state)
				
				WAIT:
					if (~key[3])
						next_state = PRESS;
				PRESS:
					if (key[3]) 
						next_state = RELEASE;
				RELEASE: begin
					next_state = WAIT;
					ctr_enable = 1'b1;
				end
			endcase
	end
	
	
	always_ff @ (posedge clk or negedge key[0])
	begin
			if (~key[0])
				key_ctr <= 2'b11;
			else
			begin
				if (ctr_enable)
					key_ctr <= key_ctr + 1;
			end
	end			

	
	always_comb
	begin
			VGA_R = temp_R[9:2];
			VGA_G = temp_G[9:2];
			VGA_B = temp_B[9:2];
			case (key_ctr)
			
				2'b01 :
				begin	
					VGA_R = gray[9:2];
					VGA_G = gray[9:2];
					VGA_B = gray[9:2];
				end
				
				2'b10:
				begin
					VGA_R = binary;
					VGA_G = binary;
					VGA_B = binary;	
				end
				
				default ;
				
			endcase
		end
			
endmodule





