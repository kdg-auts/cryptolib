-------------------------------------------------------------------------------
--
-- Title       : DMX32
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : DMX32.vhd
-- Generated   : Mon May 20 18:08:10 2013
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
--{entity {DMX32} architecture {DMX32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DMX32 is
	 port(
		 CS : in STD_LOGIC;
		 DI : in STD_LOGIC_VECTOR(31 downto 0);
		 AO : out STD_LOGIC_VECTOR(31 downto 0);
		 BO : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end DMX32;

--}} End of automatically maintained section

architecture DMX32 of DMX32 is
begin
	process (DI,CS)
	begin
	 if CS = '0' then 
		 BO <= DI;
		 AO <= (others => 'Z');
	 else
		 AO <= DI;
		 BO <= (others => 'Z');
	 		  end if;
	   end process;
end DMX32;
