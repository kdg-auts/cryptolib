

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XOR48 is
	port(
		I1 : in STD_LOGIC_VECTOR(47 downto 0);
		I2 : in STD_LOGIC_VECTOR(47 downto 0);
		XR : out STD_LOGIC_VECTOR(47 downto 0)
		);
end XOR48;

--}} End of automatically maintained section

architecture XOR48 of XOR48 is
begin
	process(I1,I2)
		variable i : integer;
	begin		
		for i in 0 to 47 loop
			XR(i) <= I1(i) xor I2(i);	
		end loop;
	end process;
	--XR(47 downto 0) <= I1(47 downto 0) xor I2(47 downto 0);
	
end XOR48;
