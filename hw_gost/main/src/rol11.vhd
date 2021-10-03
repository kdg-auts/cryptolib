-------------------------------------------------------------------------------
--
-- Title       : rol11
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

entity rol11 is
	 port(
		 state_in : in STD_LOGIC_VECTOR(31 downto 0);
		 state_out : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end rol11;

architecture rol11 of rol11 is
begin

	 state_out <= state_in(20 downto 0) & state_in(31 downto 21);

end rol11;
