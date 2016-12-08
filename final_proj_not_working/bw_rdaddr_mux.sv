module bw_rdaddr_mux(input [9:0] lcd_address,
						 input [9:0] sram_address,
						 input complete,
						 output logic [9:0] bw_rdaddr);
						 
		always_comb
		begin
			case (complete)
			
			1'b0 :
				bw_rdaddr = lcd_address;
			1'b1 :
				bw_rdaddr = sram_address;
			endcase
		end
endmodule

				