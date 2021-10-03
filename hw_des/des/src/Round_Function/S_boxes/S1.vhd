-------------------------------------------------------------------------------
--
-- Title       : S1
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : S1.vhd
-- Generated   : Tue May 21 17:08:26 2013
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {S1} architecture {S1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity S1 is
	 port(
		 SI : in STD_LOGIC_VECTOR(5 downto 0);
		 SO : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end S1;

--}} End of automatically maintained section

architecture S1 of S1 is
begin
process (SI)
begin
if SI(5)&SI(0) = "00" then
	case SI(4 downto 1) is
		when "0000" => SO <= "1110";--14 
		when "0001"	=> SO <= "0100";--4
		when "0010" => SO <= "1101";--13
		when "0011" => SO <= "0001";--1
		when "0100" => SO <= "0010";--2
		when "0101" => SO <= "1111";--15
		when "0110" => SO <= "1011";--11
		when "0111" => SO <= "1000";--8
		when "1000" => SO <= "0011";--3
		when "1001" => SO <= "1010";--10
		when "1010" => SO <= "0110";--6
		when "1011" => SO <= "1100";--12
		when "1100" => SO <= "0101";--5
		when "1101" => SO <= "1001";--9
		when "1110" => SO <= "0000";--0
		when others => SO <= "0111";--7  
	end case;
elsif SI(5)&SI(0)="01" then
	case SI(4 downto 1) is
		when "0000" => SO <= "0000";--0 
		when "0001"	=> SO <= "1111";--15
		when "0010" => SO <= "0111";--7
		when "0011" => SO <= "0100";--4
		when "0100" => SO <= "1110";--14
		when "0101" => SO <= "0010";--2
		when "0110" => SO <= "1101";--13
		when "0111" => SO <= "0001";--1
		when "1000" => SO <= "1010";--10
		when "1001" => SO <= "0110";--6
		when "1010" => SO <= "1100";--12
		when "1011" => SO <= "1011";--11
		when "1100" => SO <= "1001";--9
		when "1101" => SO <= "0101";--5
		when "1110" => SO <= "0011";--3
		when others => SO <= "1000";--8  
	end case;
elsif SI(5)&SI(0)="10" then
	case SI(4 downto 1) is
		when "0000" => SO <= "0100";--4 
		when "0001"	=> SO <= "0001";--1
		when "0010" => SO <= "1110";--14
		when "0011" => SO <= "1000";--8
		when "0100" => SO <= "1101";--13
		when "0101" => SO <= "0110";--6
		when "0110" => SO <= "0010";--2
		when "0111" => SO <= "1011";--11
		when "1000" => SO <= "1111";--15
		when "1001" => SO <= "1100";--12
		when "1010" => SO <= "1001";--9
		when "1011" => SO <= "0111";--7
		when "1100" => SO <= "0011";--3
		when "1101" => SO <= "1010";--10
		when "1110" => SO <= "0101";--5
		when others => SO <= "0000";--0  
	end case;
elsif SI(5)&SI(0)="11" then
	case SI(4 downto 1) is
		when "0000" => SO <= "1111";--15 
		when "0001"	=> SO <= "1100";--12
		when "0010" => SO <= "1000";--8
		when "0011" => SO <= "0010";--2
		when "0100" => SO <= "0100";--4
		when "0101" => SO <= "1001";--9
		when "0110" => SO <= "0001";--1
		when "0111" => SO <= "0111";--7
		when "1000" => SO <= "0101";--5
		when "1001" => SO <= "1011";--11
		when "1010" => SO <= "0011";--3
		when "1011" => SO <= "1110";--14
		when "1100" => SO <= "1010";--10
		when "1101" => SO <= "0000";--0
		when "1110" => SO <= "0110";--6
		when others => SO <= "1101";--13  
	end case;	
end if;	   
end process;
end S1;
