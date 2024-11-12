library ieee;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity p_tb is
end p_tb;

architecture p_tb_arch of p_tb is
	-- Component declaration of the tested unit
	component p
		port(
			PI : in STD_LOGIC_VECTOR(31 downto 0);
			PO : out STD_LOGIC_VECTOR(31 downto 0) );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal PI : STD_LOGIC_VECTOR(31 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal PO : STD_LOGIC_VECTOR(31 downto 0); 
	signal expected_OUTPUT : STD_LOGIC_VECTOR(31 downto 0);
	type status_type is (ok, error);
	signal status : status_type := ok;
	
	type DATA_ARR is array (0 to 31) of std_logic_vector(31 downto 0 ); -- pomehiyat' ot 0 do 31
	-- constant INPUT_DATA : DATA_ARR := (x"8000000000000000", x"4000000000000000", x"2000000000000000", x"1000000000000000"); -- (x0800000000000000, x0400000000000000, x0200000000000000, x0100000000000000);
	constant OUTPUT_DATA : DATA_ARR := ((23 => '1', others => '0'), (15 => '1', others => '0'), (09 => '1', others => '0'), (01 => '1', others => '0'),
										(19 => '1', others => '0'), (04 => '1', others => '0'), (30 => '1', others => '0'), (14 => '1', others => '0'),
										(08 => '1', others => '0'), (16 => '1', others => '0'), (02 => '1', others => '0'), (26 => '1', others => '0'),
										(06 => '1', others => '0'), (12 => '1', others => '0'), (22 => '1', others => '0'), (31 => '1', others => '0'),
										(24 => '1', others => '0'), (18 => '1', others => '0'), (07 => '1', others => '0'), (29 => '1', others => '0'),
										(28 => '1', others => '0'), (03 => '1', others => '0'), (21 => '1', others => '0'), (13 => '1', others => '0'),
										(00 => '1', others => '0'), (20 => '1', others => '0'), (10 => '1', others => '0'), (25 => '1', others => '0'),
										(27 => '1', others => '0'), (05 => '1', others => '0'), (17 => '1', others => '0'), (11 => '1', others => '0'));	 
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : p
	port map (
		PI => PI,
		PO => PO
		);
	-- Add your stimulus here ...
	
	process 
	begin
		for i in 0 to 31 loop 
			expected_OUTPUT <= OUTPUT_DATA(i);
			if i = 0 then 
				PI <= (31 => '1', others => '0');
			else 
				PI <= PI(0)& PI(31 downto 1 );
			end if;
			wait for 10 ns;	 
			assert PO = OUTPUT_DATA(i) report "problem whith DOUT " & integer'image(i) severity ERROR;
			
		end loop;
		
	end process;
	
	status <= ok when PO = expected_OUTPUT else error;
	
end p_tb_arch;

configuration p_tb_conf of p_tb is
	for p_tb_arch
		for UUT : p
			use entity work.p(p);
		end for;
	end for;
end p_tb_conf;

