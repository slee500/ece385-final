module sram_wraddress (input clk, ctr_en, reset_n, 
							 output logic [15:0] wraddress);

	always_ff @ (posedge clk or negedge reset_n)
	begin
			if (~reset_n)
				wraddress <= 16'h00;
			else
			begin
				if (ctr_en)
				begin 
					if (wraddress < 640*448)
						wraddress <= wraddress + 1;
					else
						wraddress <= 16'h00;
				end
			end
	end
endmodule