-------------------------------------------------------------------------------
--
-- Title       : xor_32bit
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

entity xor_32bit is
	 port(
		 inp1 : in STD_LOGIC_VECTOR(31 downto 0);
		 inp2 : in STD_LOGIC_VECTOR(31 downto 0);
		 rslt : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end xor_32bit;

architecture xor_32bit_behavioral of xor_32bit is
begin

	 rslt <= inp1 xor inp2;

end xor_32bit_behavioral;
