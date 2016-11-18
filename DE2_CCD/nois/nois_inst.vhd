	component nois is
		port (
			clk_clk           : in  std_logic                     := 'X';             -- clk
			reset_reset_n     : in  std_logic                     := 'X';             -- reset_n
			rgb_startofpacket : in  std_logic                     := 'X';             -- startofpacket
			rgb_endofpacket   : in  std_logic                     := 'X';             -- endofpacket
			rgb_valid         : in  std_logic                     := 'X';             -- valid
			rgb_ready         : out std_logic;                                        -- ready
			rgb_data          : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			y_ready           : in  std_logic                     := 'X';             -- ready
			y_startofpacket   : out std_logic;                                        -- startofpacket
			y_endofpacket     : out std_logic;                                        -- endofpacket
			y_valid           : out std_logic;                                        -- valid
			y_data            : out std_logic_vector(7 downto 0);                     -- data
			clk_27_clk        : out std_logic                                         -- clk
		);
	end component nois;

	u0 : component nois
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --    clk.clk
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --  reset.reset_n
			rgb_startofpacket => CONNECTED_TO_rgb_startofpacket, --    rgb.startofpacket
			rgb_endofpacket   => CONNECTED_TO_rgb_endofpacket,   --       .endofpacket
			rgb_valid         => CONNECTED_TO_rgb_valid,         --       .valid
			rgb_ready         => CONNECTED_TO_rgb_ready,         --       .ready
			rgb_data          => CONNECTED_TO_rgb_data,          --       .data
			y_ready           => CONNECTED_TO_y_ready,           --      y.ready
			y_startofpacket   => CONNECTED_TO_y_startofpacket,   --       .startofpacket
			y_endofpacket     => CONNECTED_TO_y_endofpacket,     --       .endofpacket
			y_valid           => CONNECTED_TO_y_valid,           --       .valid
			y_data            => CONNECTED_TO_y_data,            --       .data
			clk_27_clk        => CONNECTED_TO_clk_27_clk         -- clk_27.clk
		);

