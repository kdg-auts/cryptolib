-------------------------------------------------------------------------------
--
-- Title       : latch_32bit
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

entity latch_32bit is
	 port(
		 WE : in STD_LOGIC;
		 DI : in STD_LOGIC_VECTOR(63 downto 0);
		 DO : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0')
	     );
end latch_32bit;

architecture latch_32bit of latch_32bit is
begin

	latch64: -- регистр хранения промежуточного состояния между раундами
	process (WE)
	begin
		if (WE'event and WE = '1') then
			DO <= DI;
		end if;
	end process latch64;


end latch_32bit;
