-------------------------------------------------------------------------------
--
-- Title       : mux_64bit
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

entity mux_64bit is
	 port(
		 bus_sel : in STD_LOGIC;
		 bus1 : in STD_LOGIC_VECTOR(63 downto 0);
		 bus2 : in STD_LOGIC_VECTOR(63 downto 0);
		 bout : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end mux_64bit;

architecture mux_64bit of mux_64bit is
begin

	bus_mux64: -- шинный мультиплексор (коммутатор)	на 64 разряда
	process (bus_sel, bus1, bus2)
	begin
		case bus_sel is
			when '0' => bout <= bus1;
			when '1' => bout <= bus2;
			when others => bout <= (others => 'X');
		end case;
	end process bus_mux64;

end mux_64bit;
