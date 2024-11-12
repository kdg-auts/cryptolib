-------------------------------------------------------------------------------
--
-- Title       : EXPAND
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : EXPAND.vhd
-- Generated   : Mon May 20 18:33:00 2013
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
--{entity {EXPAND} architecture {EXPAND}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity EXPAND is
	 port(
		 EI : in STD_LOGIC_VECTOR(31 downto 0);
		 EO : out STD_LOGIC_VECTOR(47 downto 0)
	     );
end EXPAND;

architecture EXPAND of EXPAND is
begin
EO <= EI(0)&EI(31 downto 27)&EI(28 downto 23)&EI(24 downto 19)&EI(20 downto 15)&EI(16 downto 11)&EI(12 downto 7)&EI(8 downto 3)&EI(4 downto 0)&EI(31);  
end EXPAND;
