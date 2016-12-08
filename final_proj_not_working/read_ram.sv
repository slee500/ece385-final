//module ram_784x1(input clock, 
//					  input data,
//					  input [9:0] rdaddress,
//					  input [9:0] wraddress,
//					  input wren,
//					  output q);
//					  
//					  
//	logic pixel[0:783];
//	
//	always_ff @ (posedge clock) begin
//		if (wren)
//			pixel[wraddress] <= data;
//		q <= pixel[rdaddress];
//	end

module read_ram(input data);



initial begin

	$display("rdata");
	$display("h", data);
	
end

endmodule