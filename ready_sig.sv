module ready_sig (input clk, 
						input key_2,
						input reset_n,
						//output logic ctr_en_out,
						output logic ready);
						
		//assign ctr_en_out = ctr_en;
						
		logic [19:0] delay_cnt;				
		logic ctr_en;
		enum logic [1:0] {WAITING, PHOTO, READY, HIBERNATE} state, next_state;
		
		
		always_ff @ (posedge clk or negedge reset_n)
		begin
				if (~reset_n)
					state <= WAITING;
				else
					state <= next_state;
		end
		
		always_ff @ (posedge clk or negedge reset_n)
		begin
				if (~reset_n)
					delay_cnt <= 20'h0;
					
				else
				begin
					if (ctr_en)
						delay_cnt <= delay_cnt + 1;
				end
		end
		
		
		
		always_comb
		begin
				next_state = state;
				ready = 1'b0;
				ctr_en = 1'b0;
				case (state)
				
					WAITING: 
						if (~key_2) begin
							next_state = PHOTO;
						end
					
					PHOTO: begin
						ctr_en = 1'b1;
						if (delay_cnt == 20'h50000) next_state = READY;
					end
				
					READY: begin
						ready = 1'b1;
						next_state = HIBERNATE;
					end
					default ;
				endcase
				
		end
		
		
endmodule				