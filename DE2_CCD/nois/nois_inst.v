	nois u0 (
		.clk_clk           (<connected-to-clk_clk>),           //    clk.clk
		.reset_reset_n     (<connected-to-reset_reset_n>),     //  reset.reset_n
		.rgb_startofpacket (<connected-to-rgb_startofpacket>), //    rgb.startofpacket
		.rgb_endofpacket   (<connected-to-rgb_endofpacket>),   //       .endofpacket
		.rgb_valid         (<connected-to-rgb_valid>),         //       .valid
		.rgb_ready         (<connected-to-rgb_ready>),         //       .ready
		.rgb_data          (<connected-to-rgb_data>),          //       .data
		.y_ready           (<connected-to-y_ready>),           //      y.ready
		.y_startofpacket   (<connected-to-y_startofpacket>),   //       .startofpacket
		.y_endofpacket     (<connected-to-y_endofpacket>),     //       .endofpacket
		.y_valid           (<connected-to-y_valid>),           //       .valid
		.y_data            (<connected-to-y_data>),            //       .data
		.clk_27_clk        (<connected-to-clk_27_clk>)         // clk_27.clk
	);

