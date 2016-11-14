/*---------------------------------------------------------------------------
  --      io_module.sv                                                     --
  --      Christine Chen                                                   --
  --      10/23/2013                                                       --
  --                                                                       --
  --      Modified by:                                                     --
  --      Sean Lee                                                         --
  --						                                                      --
  --		 For use with ECE 385 Final Project                               --
  --		 Fall 2016								                                 --						
  ---------------------------------------------------------------------------*/

// Stores 32-bit data transmitted from Nios II into 32-bit registers for each input digit
// Code adapted from ECE 385 Lab 9, has not been modified yet  


module io_module (		input			 		clk,
						input			 		reset_n,
						output logic [1:0]  	to_sw_sig,
						output logic [7:0]  	to_sw_port,
						input [1:0]  			to_hw_sig,
						input [7:0]  			to_hw_port,
						output logic [127:0] 	msg_en,
						output logic [127:0] 	key,
						input [127:0] 			msg_de,
						output logic				io_ready,
						input	logic 		aes_ready,
						output logic internal_reset
						);
						
		 
		enum logic [6:0] {	RESET, WAIT,
							READ_MSG_0, READ_MSG_1, READ_MSG_2, READ_MSG_3, READ_MSG_4, READ_MSG_5, READ_MSG_6, READ_MSG_7,
							READ_MSG_8, READ_MSG_9, READ_MSG_10, READ_MSG_11, READ_MSG_12, READ_MSG_13, READ_MSG_14, READ_MSG_15,
							ACK_MSG_0, ACK_MSG_1, ACK_MSG_2, ACK_MSG_3, ACK_MSG_4, ACK_MSG_5, ACK_MSG_6, ACK_MSG_7,
							ACK_MSG_8, ACK_MSG_9, ACK_MSG_10, ACK_MSG_11, ACK_MSG_12, ACK_MSG_13, ACK_MSG_14, ACK_MSG_15,
							READ_KEY_0, READ_KEY_1, READ_KEY_2, READ_KEY_3, READ_KEY_4, READ_KEY_5, READ_KEY_6, READ_KEY_7,
							READ_KEY_8, READ_KEY_9, READ_KEY_10, READ_KEY_11, READ_KEY_12, READ_KEY_13, READ_KEY_14, READ_KEY_15,
							ACK_KEY_0, ACK_KEY_1, ACK_KEY_2, ACK_KEY_3, ACK_KEY_4, ACK_KEY_5, ACK_KEY_6, ACK_KEY_7,
							ACK_KEY_8, ACK_KEY_9, ACK_KEY_10, ACK_KEY_11, ACK_KEY_12, ACK_KEY_13, ACK_KEY_14, ACK_KEY_15,
							SEND_TO_AES, GET_FROM_AES,
							SEND_BACK_0, SEND_BACK_1, SEND_BACK_2, SEND_BACK_3, SEND_BACK_4, SEND_BACK_5, SEND_BACK_6, SEND_BACK_7,
							SEND_BACK_8, SEND_BACK_9, SEND_BACK_10, SEND_BACK_11, SEND_BACK_12, SEND_BACK_13, SEND_BACK_14, SEND_BACK_15,
							GOT_ACK_0, GOT_ACK_1, GOT_ACK_2, GOT_ACK_3, GOT_ACK_4, GOT_ACK_5, GOT_ACK_6, GOT_ACK_7,
							GOT_ACK_8, GOT_ACK_9, GOT_ACK_10, GOT_ACK_11, GOT_ACK_12, GOT_ACK_13, GOT_ACK_14, GOT_ACK_15}
							state, next_state;

		always @ (posedge clk, negedge reset_n) begin
			if (reset_n == 1'b0) begin
				state <= RESET;
				msg_en <= 127'd0;
				key <= 127'd0;
			end else begin
				state <= next_state;
				case (state)
				/***************************** READ_MSG data transfers ***********************************/
					READ_MSG_0: begin
					 msg_en[127:120] <= to_hw_port[7:0];
					 end
					READ_MSG_1: begin
					 msg_en[119:112] <= to_hw_port[7:0];
					 end
					READ_MSG_2: begin
					 msg_en[111:104] <= to_hw_port[7:0];
					 end
					READ_MSG_3: begin
					 msg_en[103:96] <= to_hw_port[7:0];
					 end
					READ_MSG_4: begin
					 msg_en[95:88] <= to_hw_port[7:0];
					 end
					READ_MSG_5: begin
					 msg_en[87:80] <= to_hw_port[7:0];
					 end
					READ_MSG_6: begin
					 msg_en[79:72] <= to_hw_port[7:0];
					 end
					READ_MSG_7: begin
					 msg_en[71:64] <= to_hw_port[7:0];
					 end
					READ_MSG_8: begin
					 msg_en[63:56] <= to_hw_port[7:0];
					 end
					READ_MSG_9: begin
					 msg_en[55:48] <= to_hw_port[7:0];
					 end
					READ_MSG_10: begin
					 msg_en[47:40] <= to_hw_port[7:0];
					 end
					READ_MSG_11: begin
					 msg_en[39:32] <= to_hw_port[7:0];
					 end
					READ_MSG_12: begin
					 msg_en[31:24] <= to_hw_port[7:0];
					 end
					READ_MSG_13: begin
					 msg_en[23:16] <= to_hw_port[7:0];
					 end
					READ_MSG_14: begin
					 msg_en[15:8] <= to_hw_port[7:0];
					 end
					READ_MSG_15: begin
					 msg_en[7:0] <= to_hw_port[7:0];
					 end
					 
					 /***************************** READ_KEY data transfers ***********************************/
					 READ_KEY_0: begin
					 key[127:120] <= to_hw_port[7:0];
					 end
					READ_KEY_1: begin
					 key[119:112] <= to_hw_port[7:0];
					 end
					READ_KEY_2: begin
					 key[111:104] <= to_hw_port[7:0];
					 end
					READ_KEY_3: begin
					 key[103:96] <= to_hw_port[7:0];
					 end
					READ_KEY_4: begin
					 key[95:88] <= to_hw_port[7:0];
					 end
					READ_KEY_5: begin
					 key[87:80] <= to_hw_port[7:0];
					 end
					READ_KEY_6: begin
					 key[79:72] <= to_hw_port[7:0];
					 end
					READ_KEY_7: begin
					 key[71:64] <= to_hw_port[7:0];
					 end
					READ_KEY_8: begin
					 key[63:56] <= to_hw_port[7:0];
					 end
					READ_KEY_9: begin
					 key[55:48] <= to_hw_port[7:0];
					 end
					READ_KEY_10: begin
					 key[47:40] <= to_hw_port[7:0];
					 end
					READ_KEY_11: begin
					 key[39:32] <= to_hw_port[7:0];
					 end
					READ_KEY_12: begin
					 key[31:24] <= to_hw_port[7:0];
					 end
					READ_KEY_13: begin
					 key[23:16] <= to_hw_port[7:0];
					 end
					READ_KEY_14: begin
					 key[15:8] <= to_hw_port[7:0];
					 end
					READ_KEY_15: begin
					 key[7:0] <= to_hw_port[7:0];
					 end
 
 
					/***************************** SEND_TO_AES data transfers ***********************************/
					SEND_BACK_0: begin 
							  to_sw_port[7:0] <= msg_de[127:120]; 
					end 

					SEND_BACK_1: begin 
							  to_sw_port[7:0] <= msg_de[119:112]; 
					end 

					SEND_BACK_2: begin 
							  to_sw_port[7:0] <= msg_de[111:104]; 
					end 

					SEND_BACK_3: begin 
							  to_sw_port[7:0] <= msg_de[103:96]; 
					end 

					SEND_BACK_4: begin 
							  to_sw_port[7:0] <= msg_de[95:88]; 
					end 

					SEND_BACK_5: begin 
							  to_sw_port[7:0] <= msg_de[87:80]; 
					end 

					SEND_BACK_6: begin 
							  to_sw_port[7:0] <= msg_de[79:72]; 
					end 

					SEND_BACK_7: begin 
							  to_sw_port[7:0] <= msg_de[71:64]; 
					end 

					SEND_BACK_8: begin 
							  to_sw_port[7:0] <= msg_de[63:56]; 
					end 

					SEND_BACK_9: begin 
							  to_sw_port[7:0] <= msg_de[55:48]; 
					end 

					SEND_BACK_10: begin 
							  to_sw_port[7:0] <= msg_de[47:40]; 
					end 

					SEND_BACK_11: begin 
							  to_sw_port[7:0] <= msg_de[39:32]; 
					end 

					SEND_BACK_12: begin 
							  to_sw_port[7:0] <= msg_de[31:24]; 
					end 

					SEND_BACK_13: begin 
							  to_sw_port[7:0] <= msg_de[23:16]; 
					end 

					SEND_BACK_14: begin 
							  to_sw_port[7:0] <= msg_de[15:8]; 
					end 

					SEND_BACK_15: begin 
							  to_sw_port[7:0] <= msg_de[7:0]; 
					end 
					
					
				endcase
			end
		end
		
		always_comb begin
			next_state = state;
			unique case (state)
				RESET: begin
					next_state = WAIT;
				end
				
				WAIT: begin
					if (to_hw_sig == 2'd1)
						next_state = READ_MSG_0;
					else if (to_hw_sig == 2'd2)
						next_state = READ_KEY_0;
					else if (to_hw_sig == 2'd3)
						next_state = SEND_TO_AES;
					else if (to_hw_sig == 2'd0)
						next_state = WAIT;
				end
				
				/******************** READ_MSG state transitions ****************************/
				       READ_MSG_0: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_0;
        end

        ACK_MSG_0: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_1;
        end

        READ_MSG_1: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_1;
        end

        ACK_MSG_1: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_2;
        end


        READ_MSG_2: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_2;
        end

        ACK_MSG_2: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_3;
        end


        READ_MSG_3: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_3;
        end

        ACK_MSG_3: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_4;
        end


        READ_MSG_4: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_4;
        end

        ACK_MSG_4: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_5;
        end


        READ_MSG_5: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_5;
        end

        ACK_MSG_5: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_6;
        end


        READ_MSG_6: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_6;
        end

        ACK_MSG_6: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_7;
        end


        READ_MSG_7: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_7;
        end

        ACK_MSG_7: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_8;
        end


        READ_MSG_8: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_8;
        end

        ACK_MSG_8: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_9;
        end


        READ_MSG_9: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_9;
        end

        ACK_MSG_9: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_10;
        end


        READ_MSG_10: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_10;
        end

        ACK_MSG_10: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_11;
        end


        READ_MSG_11: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_11;
        end

        ACK_MSG_11: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_12;
        end


        READ_MSG_12: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_12;
        end

        ACK_MSG_12: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_13;
        end


        READ_MSG_13: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_13;
        end

        ACK_MSG_13: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_14;
        end


        READ_MSG_14: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_14;
        end

        ACK_MSG_14: begin
        if (to_hw_sig == 2'd1)
                next_state = READ_MSG_15;
        end


        READ_MSG_15: begin
        if (to_hw_sig == 2'd2)
                next_state = ACK_MSG_15;
        end

        ACK_MSG_15: begin
        if (to_hw_sig == 2'd0)
                next_state = WAIT;
        end
				
				
				/******************** READ_KEY state transitions ****************************/
			READ_KEY_0: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_0;
        end
        ACK_KEY_0: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_1;
        end

        READ_KEY_1: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_1;
        end
        ACK_KEY_1: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_2;
        end

        READ_KEY_2: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_2;
        end
        ACK_KEY_2: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_3;
        end

        READ_KEY_3: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_3;
        end
        ACK_KEY_3: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_4;
        end

        READ_KEY_4: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_4;
        end
        ACK_KEY_4: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_5;
        end

        READ_KEY_5: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_5;
        end
        ACK_KEY_5: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_6;
        end

        READ_KEY_6: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_6;
        end
        ACK_KEY_6: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_7;
        end

        READ_KEY_7: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_7;
        end
        ACK_KEY_7: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_8;
        end

        READ_KEY_8: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_8;
        end
        ACK_KEY_8: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_9;
        end

        READ_KEY_9: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_9;
        end
        ACK_KEY_9: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_10;
        end

        READ_KEY_10: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_10;
        end
        ACK_KEY_10: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_11;
        end

        READ_KEY_11: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_11;
        end
        ACK_KEY_11: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_12;
        end

        READ_KEY_12: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_12;
        end
        ACK_KEY_12: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_13;
        end

        READ_KEY_13: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_13;
        end
        ACK_KEY_13: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_14;
        end

        READ_KEY_14: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_14;
        end
        ACK_KEY_14: begin
        if (to_hw_sig == 2'd2)
                next_state = READ_KEY_15;
        end

        READ_KEY_15: begin
        if (to_hw_sig == 2'd1)
                next_state = ACK_KEY_15;
        end
        ACK_KEY_15: begin
        if (to_hw_sig == 2'd3)
                next_state = WAIT;
        end
		  
		  /**************************** SEND_TO_AES state transitions **********************************/
		  
		  SEND_TO_AES: begin
		  if (aes_ready == 1'd1)
				next_state = GET_FROM_AES;
			end
			
			GET_FROM_AES: begin
			if (to_hw_sig == 2'd1)
				next_state = SEND_BACK_0;
			end
				
			         SEND_BACK_0: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_0;
         end 
         GOT_ACK_0: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_1;
         end 


         SEND_BACK_1: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_1;
         end 
         GOT_ACK_1: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_2;
         end 


         SEND_BACK_2: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_2;
         end 
         GOT_ACK_2: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_3;
         end 


         SEND_BACK_3: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_3;
         end 
         GOT_ACK_3: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_4;
         end 


         SEND_BACK_4: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_4;
         end 
         GOT_ACK_4: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_5;
         end 


         SEND_BACK_5: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_5;
         end 
         GOT_ACK_5: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_6;
         end 


         SEND_BACK_6: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_6;
         end 
         GOT_ACK_6: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_7;
         end 


         SEND_BACK_7: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_7;
         end 
         GOT_ACK_7: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_8;
         end 


         SEND_BACK_8: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_8;
         end 
         GOT_ACK_8: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_9;
         end 


         SEND_BACK_9: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_9;
         end 
         GOT_ACK_9: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_10;
         end 


         SEND_BACK_10: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_10;
         end 
         GOT_ACK_10: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_11;
         end 


         SEND_BACK_11: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_11;
         end 
         GOT_ACK_11: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_12;
         end 


         SEND_BACK_12: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_12;
         end 
         GOT_ACK_12: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_13;
         end 


         SEND_BACK_13: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_13;
         end 
         GOT_ACK_13: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_14;
         end 


         SEND_BACK_14: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_14;
         end 
         GOT_ACK_14: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = SEND_BACK_15;
         end 


         SEND_BACK_15: begin 
         if (to_hw_sig == 2'd2) 
                 next_state = GOT_ACK_15;
         end 
         GOT_ACK_15: begin 
         if (to_hw_sig == 2'd1) 
                 next_state = WAIT;
         end 
		  
			endcase
		end
		
		always_comb begin
			//to_sw_port = 8'd0;
			to_sw_sig = 2'd0;
			io_ready = 1'b0;
			internal_reset = 1'b0;
			unique case (state)
				RESET: begin
					to_sw_sig = 2'd3;
				end
			
				WAIT: begin
					to_sw_sig = 2'd0;
					internal_reset = 1'b1;
				end
				
				/************************************* READ_MSG output flags *****************************/
				
				READ_MSG_0: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_0: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_1: begin
        to_sw_sig = 2'd1;
        end

				ACK_MSG_1: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_2: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_2: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_3: begin
			to_sw_sig = 2'd1;
        end

			ACK_MSG_3: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_4: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_4: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_5: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_5: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_6: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_6: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_7: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_7: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_8: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_8: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_9: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_9: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_10: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_10: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_11: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_11: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_12: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_12: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_13: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_13: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_14: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_14: begin
        to_sw_sig = 2'd0;
        end

			READ_MSG_15: begin
        to_sw_sig = 2'd1;
        end

			ACK_MSG_15: begin
        to_sw_sig = 2'd0;
        end
		  
			/************************** READ_KEY output flags ******************************/		

		READ_KEY_0: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_0: begin
			to_sw_sig = 2'd0;
			end
		

			READ_KEY_1: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_1: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_2: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_2: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_3: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_3: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_4: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_4: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_5: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_5: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_6: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_6: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_7: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_7: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_8: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_8: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_9: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_9: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_10: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_10: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_11: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_11: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_12: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_12: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_13: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_13: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_14: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_14: begin
			to_sw_sig = 2'd0;
			end

			READ_KEY_15: begin
			 to_sw_sig = 2'd1;
			end
			ACK_KEY_15: begin
			to_sw_sig = 2'd0;
			end
				
				/************************** SEND_TO_AES output flags ******************************/	
				
				SEND_TO_AES: begin
					to_sw_sig = 2'd0;
					io_ready = 1'b1;
				end
				
				GET_FROM_AES: begin
					to_sw_sig = 2'd2;
				end
				
			SEND_BACK_0: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_0: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_1: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_1: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_2: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_2: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_3: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_3: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_4: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_4: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_5: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_5: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_6: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_6: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_7: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_7: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_8: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_8: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_9: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_9: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_10: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_10: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_11: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_11: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_12: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_12: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_13: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_13: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_14: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_14: begin 
                 to_sw_sig = 2'd0; 
         end 

         SEND_BACK_15: begin 
                 to_sw_sig = 2'd1; 
         end 
         GOT_ACK_15: begin 
                 to_sw_sig = 2'd0; 
         end 
			endcase
		end
	
endmodule