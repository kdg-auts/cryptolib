library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity S6 is
	 port(
		 SI : in STD_LOGIC_VECTOR(5 downto 0);
		 SO : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end S6;

architecture S6 of S6 is
begin
process (SI)
begin
if SI(5)&SI(0) = "00" then
	case SI(4 downto 1) is
		when "0000" => SO <= "1100";--12 
		when "0001"	=> SO <= "0001";--1
		when "0010" => SO <= "1010";--10
		when "0011" => SO <= "1111";--15
		when "0100" => SO <= "1001";--9
		when "0101" => SO <= "0010";--2
		when "0110" => SO <= "0110";--6
		when "0111" => SO <= "1000";--8
		when "1000" => SO <= "0000";--0
		when "1001" => SO <= "1101";--13
		when "1010" => SO <= "0011";--3
		when "1011" => SO <= "0100";--4
		when "1100" => SO <= "1110";--14
		when "1101" => SO <= "0111";--7
		when "1110" => SO <= "0101";--5
		when others => SO <= "1011";--11  
	end case;
elsif SI(5)&SI(0)="01" then
	case SI(4 downto 1) is
		when "0000" => SO <= "1010";--10 
		when "0001"	=> SO <= "1111";--15
		when "0010" => SO <= "0100";--4
		when "0011" => SO <= "0010";--2
		when "0100" => SO <= "0111";--7
		when "0101" => SO <= "1100";--12
		when "0110" => SO <= "1001";--9
		when "0111" => SO <= "0101";--5
		when "1000" => SO <= "0110";--6
		when "1001" => SO <= "0001";--1
		when "1010" => SO <= "1101";--13
		when "1011" => SO <= "1110";--14
		when "1100" => SO <= "0000";--0
		when "1101" => SO <= "1011";--11
		when "1110" => SO <= "0011";--3
		when others => SO <= "1000";--8 
	end case;
elsif SI(5)&SI(0)="10" then
	case SI(4 downto 1) is
		when "0000" => SO <= "1001";--9 
		when "0001"	=> SO <= "1110";--14
		when "0010" => SO <= "1111";--15
		when "0011" => SO <= "0101";--5
		when "0100" => SO <= "0010";--2
		when "0101" => SO <= "1000";--8
		when "0110" => SO <= "1100";--12
		when "0111" => SO <= "0011";--3
		when "1000" => SO <= "0111";--7
		when "1001" => SO <= "0000";--0
		when "1010" => SO <= "0100";--4
		when "1011" => SO <= "1010";--10
		when "1100" => SO <= "0001";--1
		when "1101" => SO <= "1101";--13
		when "1110" => SO <= "1011";--11
		when others => SO <= "0110";--6  
	end case;
elsif SI(5)&SI(0)="11" then
	case SI(4 downto 1) is
		when "0000" => SO <= "0100";--4 
		when "0001"	=> SO <= "0011";--3
		when "0010" => SO <= "0010";--2
		when "0011" => SO <= "1100";--12
		when "0100" => SO <= "1001";--9
		when "0101" => SO <= "0101";--5
		when "0110" => SO <= "1111";--15
		when "0111" => SO <= "1010";--10
		when "1000" => SO <= "1011";--11
		when "1001" => SO <= "1110";--14
		when "1010" => SO <= "0001";--1
		when "1011" => SO <= "0111";--7
		when "1100" => SO <= "0110";--6
		when "1101" => SO <= "0000";--0
		when "1110" => SO <= "1000";--8
		when others => SO <= "1101";--13  
	end case;	
end if;	   
end process;
end S6;
