-------------------------------------------------------------------------------
--
-- Title       : REG32
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : REG32.vhd
-- Generated   : Mon May 20 17:54:37 2013
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
--{entity {REG32} architecture {REG32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG32 is
	 port(
		 CLK : in STD_LOGIC;
		 DI : in STD_LOGIC_VECTOR(31 downto 0);
		 DO : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end REG32;

--}} End of automatically maintained section

architecture REG32 of REG32 is
begin
	process(CLK) 		
	begin	
	if CLK'event and CLK = '1' then 
		DO <= DI;
	end if;	 
	end process;
end REG32;
