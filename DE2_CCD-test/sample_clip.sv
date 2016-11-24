module sample_clip (input clk, 
						  input reset_n,
						  input logic [9:0] pixl_R, pixl_G, pixl_B,
						  output logic pixl_bw,
						  output logic rd_req,
						  output logic [9:0] pixl_cont,
						  output logic [9:0] pixl_gray,
						  output wren,
						  //output logic opixel,
						  //for debug
						  output logic [9:0] d_icol_cont,
						  output logic [9:0] d_irow_cont,
						  output logic [4:0] d_srow_cont,
						  output logic [4:0] d_scol_cont
						  );
						  
						  
	parameter iCOL_TOTAL = 640;
	parameter iROW_TOTAL = 448;
	parameter sCOL_TOTAL = 28;
	parameter sROW_TOTAL = 28;
	
	logic  [9:0] icol_cont;
	logic  [8:0] irow_cont;
	logic  [4:0] srow_cont;
	logic  [4:0] scol_cont;
	logic  [3:0] counter;
	logic  clk_divide_16;
	//logic [9:0] pixl_gray;
	
	assign clk_divide_16 = ~counter[3];
	assign sample_area = (icol_cont < 544 && icol_cont >= 96)? 1 : 0;
	assign wren = (counter == 4'h0) & sample_area;
	assign pixl_cont = (srow_cont - 1) * 28 + scol_cont - 1;
	
	//image processing
	rgb2gray u1(.*);
	gray2bw u2(.*);
	
	//debug
	assign  d_icol_cont =  icol_cont;
	assign  d_irow_cont =  irow_cont;
	assign  d_srow_cont =  srow_cont;	
	assign  d_scol_cont =  scol_cont;	
	
	
	//sampling and clipping
	always_ff @ (posedge clk or negedge reset_n)
	begin 
			if (~reset_n)
				rd_req <= 0;
			else
				rd_req <= 1;
	end
	
	
	//input image count column
	always_ff @ (posedge clk or negedge reset_n)
	begin
			if (~reset_n)
				icol_cont <= 9'h0;
			else
			begin
				if (icol_cont < iCOL_TOTAL)
					icol_cont <= icol_cont + 1;
				else
					icol_cont <= 1;
			
			end
	end

	//input image row count
	always_ff @ (posedge clk or negedge reset_n)
	begin
			if (~reset_n)
				irow_cont <= 10'h0;
			else
			begin
				if (irow_cont < iROW_TOTAL)
				begin
					if (icol_cont == 0 || icol_cont == iCOL_TOTAL)
						irow_cont <= irow_cont + 1;
				end
				else if(icol_cont == iCOL_TOTAL)
					irow_cont <= 1;
			end
	end
	
	//create 4-bit counter for image resize
	always_ff @ (posedge clk or negedge reset_n)
	begin
			if (~reset_n)
				counter <= 4'h0;
			else if (rd_req)
				counter <= counter + 1;		
	end
						

	//sampling image column count
	always_ff @ (posedge clk_divide_16 or negedge reset_n)
	begin
			if (~reset_n)
				scol_cont <= 5'h0;
			else 
			begin
				if (sample_area)
				begin
					if (scol_cont < sCOL_TOTAL)
						scol_cont <= scol_cont + 1;
					else
						scol_cont <= 1;
				end
			end
	end

	//sampling image row count
	always_ff @ (posedge clk_divide_16 or negedge reset_n)
	begin
			if (~reset_n)
				srow_cont <= 5'h0;
			else
			begin
				if (sample_area)
				begin
					if (srow_cont < sROW_TOTAL)
					begin
						if (scol_cont == 0 || scol_cont == sCOL_TOTAL)
							srow_cont <= srow_cont + 1;
					end
					else if (scol_cont == sCOL_TOTAL)
						srow_cont <= 1;
				end
			end
	end
	




					
endmodule
