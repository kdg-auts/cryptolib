-------------------------------------------------------------------------------
--
-- Title       : sbox7
-- Design      : main
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sbox7 is
	 port(
		 din : in STD_LOGIC_VECTOR(3 downto 0);
		 dout : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end sbox7;

architecture sbox7 of sbox7 is
begin

	K8: -- название блока по ГОСТ 28147-89
	process (din)
	begin  
		case din is
				when x"0" => dout <= x"B";
				when x"1" => dout <= x"A";
				when x"2" => dout <= x"F";
				when x"3" => dout <= x"5";
				when x"4" => dout <= x"0";
				when x"5" => dout <= x"C";
				when x"6" => dout <= x"E";
				when x"7" => dout <= x"8";
				when x"8" => dout <= x"6";
				when x"9" => dout <= x"2";
				when x"A" => dout <= x"3";
				when x"B" => dout <= x"9";
				when x"C" => dout <= x"1";
				when x"D" => dout <= x"7";
				when x"E" => dout <= x"D";
				when x"F" => dout <= x"4";
				when others => dout <= (others => 'X');
		end case;
	end process;

end sbox7;
