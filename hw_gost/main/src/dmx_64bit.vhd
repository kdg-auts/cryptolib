-------------------------------------------------------------------------------
--
-- Title       : dmx_64bit
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

entity dmx_64bit is
	 port(
		 out_sel : in STD_LOGIC;
		 ibus : in STD_LOGIC_VECTOR(63 downto 0);
		 obus1 : out STD_LOGIC_VECTOR(63 downto 0);
		 obus2 : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end dmx_64bit;

architecture dmx_64bit of dmx_64bit is
begin
	
	bus_dmx64: -- шинный демультиплексор (коммутатор) на 64 разряда
	process (out_sel, ibus)
	begin
		case out_sel is
			when '0' => obus1 <= ibus; obus2 <= (others => '0');
			when '1' => obus2 <= ibus; obus1 <= (others => '0');
			when others => obus1 <= (others => 'X'); obus2 <= (others => 'X');
		end case;
	end process bus_dmx64;


end dmx_64bit;
