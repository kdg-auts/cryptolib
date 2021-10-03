library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity LS is
	port(
		SHS : in STD_LOGIC;
		SHE : in STD_LOGIC;
		WE : in STD_LOGIC;
		CLK : in STD_LOGIC;
		LI : in STD_LOGIC_VECTOR(27 downto 0);
		LO : out STD_LOGIC_VECTOR(27 downto 0)
		);
end LS;

architecture LS of LS is
	--signal TEMP : STD_LOGIC_VECTOR(27 downto 0) := (others => '0');
begin 
	process(CLK)
		variable TEMP : STD_LOGIC_VECTOR(27 downto 0) := (others => '1');
	begin
		if CLK'event and CLK = '1' then
			if WE = '1' then
				TEMP := LI;
			elsif SHE = '1' then
				if SHS = '0' then
					TEMP := (TEMP(0) & TEMP(27 downto 1));
					LO <= TEMP;
				else 
					TEMP := (TEMP(1 downto 0) & TEMP(27 downto 2));
					LO <= TEMP;
				end if;
			end if;
		end if;
	end process;
	
	
	
end LS;
