	component nios is
		port (
			clk_clk                                : in  std_logic                     := 'X';             -- clk
			reset_reset_n                          : in  std_logic                     := 'X';             -- reset_n
			lcd_bitbang_external_connection_export : out std_logic_vector(10 downto 0);                    -- export
			numbers_external_connection_export     : in  std_logic_vector(15 downto 0) := (others => 'X')  -- export
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			reset_reset_n                          => CONNECTED_TO_reset_reset_n,                          --                           reset.reset_n
			lcd_bitbang_external_connection_export => CONNECTED_TO_lcd_bitbang_external_connection_export, -- lcd_bitbang_external_connection.export
			numbers_external_connection_export     => CONNECTED_TO_numbers_external_connection_export      --     numbers_external_connection.export
		);

