library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity pc2_tb is
end pc2_tb;

architecture pc2_tb_arch of pc2_tb is
	-- Component declaration of the tested unit
	component pc2
	port(
		PC2 : out STD_LOGIC_VECTOR(47 downto 0);
		PCI : in STD_LOGIC_VECTOR(55 downto 0)
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal PCI : STD_LOGIC_VECTOR(55 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal PC2O : STD_LOGIC_VECTOR(47 downto 0);
	signal expected_OUTPUT : STD_LOGIC_VECTOR(47 downto 0);
	type status_type is (ok, error);
	signal status : status_type := ok;
	

	-- Add your code here ...  
	
   type DATA_ARR is array (0 to 55) of std_logic_vector(47 downto 0 ); 
	constant OUTPUT_DATA : DATA_ARR := ((43 => '1', others => '0'), (24 => '1', others => '0'), (41 => '1', others => '0'), (32 => '1', others => '0'),
									   (42 => '1', others => '0'), (38 => '1', others => '0'), (28 => '1', others => '0'), (30 => '1',  others => '0'),
									   ( others => '0'), (36 => '1', others => '0'), (45 => '1', others => '0'), (33 => '1', others => '0'),
									   (25 => '1', others => '0'), (47 => '1', others => '0'), (39 => '1', others => '0'), ( 29 => '1',  others => '0'),
									   (46 => '1',others => '0'), ( others => '0'), (34 => '1', others => '0'), (26 => '1', others => '0'),
									   (37 => '1', others => '0'), ( others => '0'), (35 => '1', others => '0'), ( 44 => '1',others => '0'),
									   (others => '0'), (31 => '1', others => '0'), (27 => '1', others => '0'), (40 => '1', others => '0'),
									   (01 => '1', others => '0'), (17 => '1', others => '0'), (21 => '1', others => '0'), ( 00 => '1', others => '0'),
									   (13 => '1', others => '0'), (07 => '1', others => '0'), ( others => '0'), (02 => '1', others => '0'),
									   (20 => '1', others => '0'), ( others => '0'), (09 => '1', others => '0'), (16 => '1', others => '0'),
									   (23 => '1', others => '0'), (04 => '1', others => '0'), ( others => '0'), (11 => '1', others => '0'),
									   (14 => '1', others => '0'), (05 => '1', others => '0'), (19 => '1', others => '0'), ( 12 => '1',others => '0'),
									   (10 => '1', others => '0'), (03 => '1', others => '0'), ( 15 => '1', others => '0'), (22 => '1', others => '0'),
									   (06 => '1', others => '0'), ( others => '0'), (18 => '1', others => '0'), (  08 => '1', others => '0'));
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : pc2
		port map (
			PCI => PCI,
			PC2 => PC2O
		);

	-- Add your stimulus here ...	  
	process 
	begin
		for i in 0 to 55 loop 
			expected_OUTPUT <= OUTPUT_DATA(i);
			if i = 0 then 
				PCI <= (55 => '1', others => '0');
			else 
				PCI <= PCI(0)& PCI(55 downto 1 );
			end if;
			wait for 10 ns;	 
			assert PC2O = OUTPUT_DATA(i) report "problem whith PCI " & integer'image(i) severity ERROR;
			
		end loop;
		
	end process;
	
	status <= ok when PC2O = expected_OUTPUT else error;

end pc2_tb_arch;

configuration TESTBENCH_FOR_pc2 of pc2_tb is
	for pc2_tb_arch
		for UUT : pc2
			use entity work.pc2(PC2_arch);
		end for;
	end for;
end TESTBENCH_FOR_pc2;
