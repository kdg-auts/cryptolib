library IEEE;
use IEEE.std_logic_1164.all;

entity hw_simple_des_fsm_tb is
end entity;

architecture hw_simple_des_fsm_tb_arch of hw_simple_des_fsm_tb is
	signal gclk : STD_LOGIC := '0';
	signal grst : STD_LOGIC := '0';
	signal input_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal cipher_mode : STD_LOGIC := '0';
	signal cipher_start : STD_LOGIC := '0';
	signal cipher_key : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal load_new_key : STD_LOGIC := '0';
	signal output_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal ciph_finish : STD_LOGIC := '0';
	signal key_ready : STD_LOGIC := '0';
	constant GCLK_PERIOD: time := 10 ns;
	type teststate_t is (reset, key_expansion, cipher, ok, error);
	signal teststate : teststate_t := reset; 
begin 

    UUT: entity work.hw_simple_des_fsm(hw_simple_des_fsm)
    port map (
		IDB => input_msg,
	   	MODE => cipher_mode,
		START => cipher_start,
		KEY => cipher_key,
        LK => load_new_key,
		CLK => gclk,
		RST => grst,
		ODB => output_msg,
		DRDY =>	ciph_finish,
		KRDY =>	key_ready
    );
    
    gclk_gen: process
	begin
		gclk <= '1';
		wait for GCLK_PERIOD/2;
		gclk <= '0';
		wait for GCLK_PERIOD/2;	
	end process;

	stim_gen: process
	begin
		-- reset actions
		grst <= '1';
		wait for GCLK_PERIOD*2;
		grst <= '0';
		wait for GCLK_PERIOD*2;
		
		-- initial key schedule/expansion
		teststate <= key_expansion;
		cipher_key <= "1110001110";	-- x"38E"
		load_new_key <= '1';
		wait for GCLK_PERIOD;
		load_new_key <= '0';
		wait until key_ready = '1';
		wait for GCLK_PERIOD*5;
		
		-- test case 1: data = 10101010 (AA) mode = enc|dec expect = 11001010 (CA)
		teststate <= cipher;
		input_msg <= "10101010"; -- x"AA"
		cipher_mode <= '0'; -- encryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "11001010" then -- if not x"CA"
			teststate <= error;
			report "test case 1: encryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;
		
		wait for GCLK_PERIOD*5;
		
		teststate <= cipher;
		input_msg <= "11001010"; -- x"CA"
		cipher_mode <= '1'; -- decryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "10101010" then -- if not x"AA"
			teststate <= error;
			report "test case 1: decryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;

		wait for GCLK_PERIOD*5;
		
		-- test case 2: data = 01010101 (55) mode = enc|dec expect = 01110000 (70)
		teststate <= cipher;
		input_msg <= "01010101"; -- x"55"
		cipher_mode <= '0'; -- encryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "01110000" then -- if not x"70"
			teststate <= error;
			report "test case 2: encryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;
		
		wait for GCLK_PERIOD*5;
		
		teststate <= cipher;
		input_msg <= "01110000"; -- x"70"
		cipher_mode <= '1'; -- decryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "01010101" then -- if not x"55"
			teststate <= error;
			report "test case 2: decryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;

		wait for GCLK_PERIOD*5;
		
		-- key re-schedule/expansion - change ckey during operation
		teststate <= key_expansion;
		cipher_key <= "1111111111";	-- x"3FF"
		load_new_key <= '1';
		wait for GCLK_PERIOD;
		load_new_key <= '0';
		wait until key_ready = '1';
		wait for GCLK_PERIOD*5;
		
		-- test case 3: data = 10101010 (AA) mode = enc|dec expect = 00000100 (04)
		teststate <= cipher;
		input_msg <= "10101010"; -- x"AA"
		cipher_mode <= '0'; -- encryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "00000100" then -- if not x"04"
			teststate <= error;
			report "test case 3: encryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;
		
		wait for GCLK_PERIOD*5;
		
		teststate <= cipher;
		input_msg <= "00000100"; -- x"04"
		cipher_mode <= '1'; -- decryption
		cipher_start <= '1';
		wait for GCLK_PERIOD;
		cipher_start <= '0';
		wait for GCLK_PERIOD;
		wait until ciph_finish = '1';
		wait for GCLK_PERIOD/2;
		if output_msg /= "10101010" then -- if not x"AA"
			teststate <= error;
			report "test case 3: decryption error!" severity ERROR;
		else 
			teststate <= ok; 
		end if;
		wait for GCLK_PERIOD/2;
		
		-- end test process
		wait;
	end process;

end architecture;