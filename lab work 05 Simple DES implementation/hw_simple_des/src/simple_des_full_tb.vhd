library IEEE;
use IEEE.std_logic_1164.all;

entity simple_des_full_tb is
end entity;

architecture simple_des_full_tb_arch of simple_des_full_tb is
    signal input_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal cipher_key : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal cipher_mode : STD_LOGIC := '0';
	signal output_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal enc_res : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal dec_res : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin 

    UUT: entity work.simple_des_full(simple_des_full)
    port map (
		input_msg => input_msg,
		cipher_key => cipher_key,
        cipher_mode => cipher_mode,
		output_msg => output_msg
    );
    
    stim_gen: process
	begin
		-- test 1 - part 1: encrypt with zero key
		input_msg <= "10101010";
		cipher_key <= "0000000000";
		cipher_mode <= '0'; -- encrypt
		wait for 10 ns;
		
		-- test 1 - part 2: decrypt with zero key
		input_msg <= "00010001";
		cipher_key <= "0000000000";
		cipher_mode <= '1'; -- decrypt
		wait for 10 ns;
		assert output_msg = "10101010" report "Test 1: Enc and Dec Open Texts do not match!" severity ERROR;
		
		-- test 2 - part 1: encrypt with non-zero key
		input_msg <= "10101010";
		cipher_key <= "1110001110";
		cipher_mode <= '0'; -- encrypt
		wait for 10 ns;
		
		-- test 2 - part 2: decrypt with non-zero key
		input_msg <= "11001010";
		cipher_key <= "1110001110";
		cipher_mode <= '1'; -- decrypt
		wait for 10 ns;
		assert output_msg = "10101010" report "Test 2: Enc and Dec Open Texts do not match!" severity ERROR;
		
		-- test 3 - part 1: encrypt with all-ones key
		input_msg <= "10101010";
		cipher_key <= "1111111111";
		cipher_mode <= '0'; -- encrypt
		wait for 10 ns;
		
		-- test 3 - part 2: decrypt with all-ones key
		input_msg <= "00000100";
		cipher_key <= "1111111111";
		cipher_mode <= '1'; -- decrypt
		wait for 10 ns;
		assert output_msg = "10101010" report "Test 2: Enc and Dec Open Texts do not match!" severity ERROR;
		
	end process;

end architecture;