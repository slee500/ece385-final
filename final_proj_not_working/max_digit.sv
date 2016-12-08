module max_digit(input logic clk, complete,
						input shortint result[0:9], 
						output shortint digit);
			
		logic v1, v2, v3, v4, v5, v6, v7, v8, v9;
		
		// Combinational logic to get the right indexes
		logic [3:0] v1_a, v2_b, v3_a, v4_b, v5_b, v6_a, v7_b, v8_a, v9_a;
		assign v1_a = {3'b0, v1} + 4'd0;
		assign v2_b = {3'b0, v2} + 4'd2;
		assign v3_a = {3'b0, v3} + 4'd4;
		assign v4_b = {3'b0, v4} + 4'd6;
		assign v5_b = {3'b0, v5} + 4'd8;
		
		// var = (condition) ? True : False
		assign v6_a = (v6) ? v2_b : v1_a;
		assign v7_b = (v7) ? v4_b : v3_a;
		assign v8_a = (v8) ? v7_b : v6_a;
		assign v9_a = (v9) ? v5_b : v8_a;
		
		always_ff @ (posedge clk)
		begin
			case (complete)
				1'b0: digit <= 16'hffff;
				1'b1: digit <= v9_a;
			endcase
		end
			
		
		// Comparator returns alb =  1 if dataa < datab 
		// First layer comparators
		comparator compare_0 (.dataa(result[0]), .datab(result[1]), .alb(v1));
		comparator compare_1 (.dataa(result[2]), .datab(result[3]), .alb(v2));
		comparator compare_2 (.dataa(result[4]), .datab(result[5]), .alb(v3));
		comparator compare_3 (.dataa(result[6]), .datab(result[7]), .alb(v4));
		comparator compare_4 (.dataa(result[8]), .datab(result[9]), .alb(v5));
		
		// Second layer comparators
		comparator compare_5 (.dataa(result[v1_a]), .datab(result[v2_b]), .alb(v6));
		comparator compare_6 (.dataa(result[v3_a]), .datab(result[v4_b]), .alb(v7));
		
		// Third layer comparator
		comparator compare_7 (.dataa(result[v6_a]), .datab(result[v7_b]), .alb(v8));
		
		// Fourth layer comparator
		comparator compare_8 (.dataa(result[v8_a]), .datab(result[v5_b]), .alb(v9));
		
		
//			case (v6)
//				1'd0: v6_a = v1_a;
//				1'd1:	v6_a = v2_b;
//			endcase
//			
//			case (v7)
//				1'd0: v7_b = v3_a;
//				1'd1: v7_b = v4_b;
//			endcase
//			
//			case (v8)
//				1'd0: v8_a = v6_a;
//				1'd1: v8_a = v7_b;
//			endcase
//			
//			case (v9)
//				1'd0: digit = v8_a;
//				1'd1: digit = v5_b;
//			endcase
		
endmodule 