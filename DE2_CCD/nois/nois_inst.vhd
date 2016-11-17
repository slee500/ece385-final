	component nois is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			reset_reset_n : in  std_logic := 'X'; -- reset_n
			clk_27_clk    : out std_logic         -- clk
		);
	end component nois;

	u0 : component nois
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --    clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --  reset.reset_n
			clk_27_clk    => CONNECTED_TO_clk_27_clk     -- clk_27.clk
		);

