library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity expand_tb is
end expand_tb;

architecture expand_tb_arch of expand_tb is
	-- Component declaration of the tested unit
	component expand
	port(
		EI : in STD_LOGIC_VECTOR(31 downto 0);
		EO : out STD_LOGIC_VECTOR(47 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal EI : STD_LOGIC_VECTOR(31 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal EO : STD_LOGIC_VECTOR(47 downto 0);	
	signal current_expected : STD_LOGIC_VECTOR(47 downto 0); 
	
	type v_state_t is (ok, error);
	signal status : v_state_t := ok;
	
	type DATA_IN_ARR is array (0 to 31) of std_logic_vector(31 downto 0); 	 
	type DATA_OUT_ARR is array (0 to 31) of std_logic_vector(47 downto 0); 
	constant INPUT_DATA : DATA_IN_ARR := (
										(31 => '1', others => '0'), (30 => '1', others => '0'), (29 => '1', others => '0'), (28 => '1', others => '0'),
										(27 => '1', others => '0'), (26 => '1', others => '0'), (25 => '1', others => '0'), (24 => '1', others => '0'),
										(23 => '1', others => '0'), (22 => '1', others => '0'), (21 => '1', others => '0'), (20 => '1', others => '0'),
										(19 => '1', others => '0'), (18 => '1', others => '0'), (17 => '1', others => '0'), (16 => '1', others => '0'),
										(15 => '1', others => '0'), (14 => '1', others => '0'), (13 => '1', others => '0'), (12 => '1', others => '0'),
										(11 => '1', others => '0'), (10 => '1', others => '0'), (09 => '1', others => '0'), (08 => '1', others => '0'),
										(07 => '1', others => '0'), (06 => '1', others => '0'), (05 => '1', others => '0'), (04 => '1', others => '0'),
										(03 => '1', others => '0'), (02 => '1', others => '0'), (01 => '1', others => '0'), (00 => '1', others => '0'));	
	constant OUTPUT_DATA : DATA_OUT_ARR :=(
--										x"400000000001", x"200000000000", x"100000000000", x"0A0000000000",
--										x"050000000000", x"008000000000", x"004000000000", x"002800000000", 
--										x"001400000000", x"000200000000", x"000100000000", x"0000A0000000",
--										x"000050000000", x"000008000000", x"000004000000", x"000002800000",
--										x"000001400000", x"000000200000", x"000000100000", x"0000000A0000",
--										x"000000050000", x"000000008000", x"000000004000", x"000000002800", 
--										x"000000001400", x"000000000200", x"000000000100", x"0000000000A0",
--										x"000000000050", x"000000000008", x"000000000004", x"800000000002"
										(46 => '1', 00 => '1', others => '0'), (45 => '1', others => '0'), (44 => '1', others => '0'), (43 => '1', 41 => '1', others => '0'), -- 31=1, 30=1, 29=1, 28=1
										(42 => '1', 40 => '1', others => '0'), (39 => '1', others => '0'), (38 => '1', others => '0'), (37 => '1', 35 => '1', others => '0'), -- 27=1, 26=1, 25=1, 24=1
										(36 => '1', 34 => '1', others => '0'), (33 => '1', others => '0'), (32 => '1', others => '0'), (31 => '1', 29 => '1', others => '0'), -- 23=1, 22=1, 21=1, 20=1	
										(30 => '1', 28 => '1', others => '0'), (27 => '1', others => '0'), (26 => '1', others => '0'), (25 => '1', 23 => '1', others => '0'), -- 19=1, 18=1, 17=1, 16=1
										(24 => '1', 22 => '1', others => '0'), (21 => '1', others => '0'), (20 => '1', others => '0'), (19 => '1', 17 => '1', others => '0'), -- 15=1, 14=1, 13=1, 12=1
										(18 => '1', 16 => '1', others => '0'), (15 => '1', others => '0'), (14 => '1', others => '0'), (13 => '1', 11 => '1', others => '0'), -- 11=1, 10=1, 09=1, 08=1
										(12 => '1', 10 => '1', others => '0'), (09 => '1', others => '0'), (08 => '1', others => '0'), (07 => '1', 05 => '1', others => '0'), -- 07=1, 06=1, 05=1, 04=1
										(06 => '1', 04 => '1', others => '0'), (03 => '1', others => '0'), (02 => '1', others => '0'), (01 => '1', 47 => '1', others => '0')  -- 03=1, 02=1, 01=1, 00=1
										);  	  
				
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : expand
		port map (
			EI => EI,
			EO => EO
		);	
	
	-- Add your stimulus here ... 
	stim_apply: process 
	begin
		for i in 0 to 31  loop
			EI <= INPUT_DATA(i);
			current_expected <= OUTPUT_DATA(i);
			wait for 10 ns;	 
			assert EO = OUTPUT_DATA(i) report "problem whith EO " & integer'image(i) severity ERROR;
		end loop;	
	end process;
	
	-- explicit declaration for block response (to show on waveforms
	status <= ok when EO = current_expected else error;

end expand_tb_arch;

configuration expand_tb_conf of expand_tb is
	for expand_tb_arch
		for UUT : expand
			use entity work.expand(expand);
		end for;
	end for;
end expand_tb_conf;