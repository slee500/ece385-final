module release_pixl (input clk, reset, pixl_ready, 
							//output logic pixl
							output logic [9:0] bw_rdaddr);
		enum logic {PREPARE, INCRE_ADDR} state, next_state;					
		logic cnt_en;
		
		always_ff @ (posedge clk or posedge reset)
		begin
			if (reset) begin
				state <= PREPARE;
				bw_rdaddr <= 10'h0;
			end
			else begin
				state <= next_state;
				if (cnt_en)
					bw_rdaddr <= bw_rdaddr + 1;
			end
		end
		
		
		always_comb
		begin
			cnt_en = 1'b0;
			next_state = state;
			case(state)
				PREPARE:
					if (pixl_ready) begin
						next_state = INCRE_ADDR;
						cnt_en = 1'b1;
					end
				INCRE_ADDR:
					if (bw_rdaddr < 784)
						cnt_en = 1'b1;
			endcase
		end

						
endmodule
				