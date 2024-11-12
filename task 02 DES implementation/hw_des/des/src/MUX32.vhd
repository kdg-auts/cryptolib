-------------------------------------------------------------------------------
--
-- Title       : MUX32
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : MUX32.vhd
-- Generated   : Mon May 20 18:01:10 2013
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
--{entity {MUX32} architecture {MUX32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX32 is
	 port(
		 CS : in STD_LOGIC;
		 A : in STD_LOGIC_VECTOR(31 downto 0);
		 B : in STD_LOGIC_VECTOR(31 downto 0);
		 M : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end MUX32;

--}} End of automatically maintained section

architecture MUX32 of MUX32 is
begin
M <= A when CS = '1' else B;	   
	

end MUX32;
