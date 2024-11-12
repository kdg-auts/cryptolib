library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ip_inv_tb is
end ip_inv_tb;

architecture ip_inv_tb_arch of ip_inv_tb is
	-- Component declaration of the tested unit
	component ip_inv
	port(
		DIN : in STD_LOGIC_VECTOR(63 downto 0);
		DOUT : out STD_LOGIC_VECTOR(63 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal DIN : STD_LOGIC_VECTOR(63 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal DOUT : STD_LOGIC_VECTOR(63 downto 0);
	type DATA_ARR is array (0 to 63) of std_logic_vector(63 downto 0 ); -- pomehiyat' ot 0 do 63

		constant INPUT_DATA : DATA_ARR := ((63 => '1', others => '0'), (62 => '1', others => '0'), (61 => '1', others => '0'), (60 => '1', others => '0'),
									   (59 => '1', others => '0'), (58 => '1', others => '0'), (57 => '1', others => '0'), (56 => '1', others => '0'),
									   (55 => '1', others => '0'), (54 => '1', others => '0'), (53 => '1', others => '0'), (52 => '1', others => '0'),
									   (51 => '1', others => '0'), (50 => '1', others => '0'), (49 => '1', others => '0'), (48 => '1', others => '0'),
									   (47 => '1', others => '0'), (46 => '1', others => '0'), (45 => '1', others => '0'), (44 => '1', others => '0'),
									   (43 => '1', others => '0'), (42 => '1', others => '0'), (41 => '1', others => '0'), (40 => '1', others => '0'),
									   (39 => '1', others => '0'), (38 => '1', others => '0'), (37 => '1', others => '0'), (36 => '1', others => '0'),
									   (35 => '1', others => '0'), (34 => '1', others => '0'), (33 => '1', others => '0'), (32 => '1', others => '0'),
									   (31 => '1', others => '0'), (30 => '1', others => '0'), (29 => '1', others => '0'), (28 => '1', others => '0'),
									   (27 => '1', others => '0'), (26 => '1', others => '0'), (25 => '1', others => '0'), (24 => '1', others => '0'),
									   (23 => '1', others => '0'), (22 => '1', others => '0'), (21 => '1', others => '0'), (20 => '1', others => '0'),
									   (19 => '1', others => '0'), (18 => '1', others => '0'), (17 => '1', others => '0'), (16 => '1', others => '0'),
									   (15 => '1', others => '0'), (14 => '1', others => '0'), (13 => '1', others => '0'), (12 => '1', others => '0'),
									   (11 => '1', others => '0'), (10 => '1', others => '0'), (9 => '1', others => '0'), (8 => '1', others => '0'),
									   (7 => '1', others => '0'), (6 => '1', others => '0'), (5 => '1', others => '0'), (4 => '1', others => '0'),
									   (3 => '1', others => '0'), (2 => '1', others => '0'), (1 => '1', others => '0'), (0 => '1', others => '0'));
	constant OUTPUT_DATA : DATA_ARR :=(x"0000000000000040", x"0000000000004000", x"0000000000400000", x"0000000040000000",
									   x"0000004000000000", x"0000400000000000", x"0040000000000000", x"4000000000000000", 
									   x"0000000000000010", x"0000000000001000", x"0000000000100000", x"0000000010000000",
									   x"0000001000000000", x"0000100000000000", x"0010000000000000", x"1000000000000000",
									   x"0000000000000004", x"0000000000000400", x"0000000000040000", x"0000000004000000",
									   x"0000000400000000", x"0000040000000000", x"0004000000000000", x"0400000000000000", 
									   x"0000000000000001", x"0000000000000100", x"0000000000010000", x"0000000001000000",
									   x"0000000100000000", x"0000010000000000", x"0001000000000000", x"0100000000000000",
									   x"0000000000000080", x"0000000000008000", x"0000000000800000", x"0000000080000000",
									   x"0000008000000000", x"0000800000000000", x"0080000000000000", x"8000000000000000", 
									   x"0000000000000020", x"0000000000002000", x"0000000000200000", x"0000000020000000",
									   x"0000002000000000", x"0000200000000000", x"0020000000000000", x"2000000000000000",
									   x"0000000000000008", x"0000000000000800", x"0000000000080000", x"0000000008000000",
									   x"0000000800000000", x"0000080000000000", x"0008000000000000", x"0800000000000000", 
									   x"0000000000000002", x"0000000000000200", x"0000000000020000", x"0000000002000000",
									   x"0000000200000000", x"0000020000000000", x"0002000000000000", x"0200000000000000"); 

begin

	-- Unit Under Test port map
	UUT : ip_inv
		port map (
			DIN => DIN,
			DOUT => DOUT
		);

	process 
	begin
	for i in 0 to 63  loop
		DIN <= INPUT_DATA (i);
		wait for 10 ns;	 
		assert DOUT = OUTPUT_DATA (i) report "problem whith DOUT " & integer'image(i) severity ERROR;
	end loop;
		
	end process;
end ip_inv_tb_arch;

configuration TESTBENCH_FOR_ip_inv of ip_inv_tb is
	for ip_inv_tb_arch
		for UUT : ip_inv
			use entity work.ip_inv(ip_inv_arch);
		end for;
	end for;
end TESTBENCH_FOR_ip_inv;

