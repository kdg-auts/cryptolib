-------------------------------------------------------------------------------
--
-- Title       : XOR32
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : XOR32.vhd
-- Generated   : Mon May 20 18:18:56 2013
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
--{entity {XOR32} architecture {XOR32}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XOR32 is
	 port(
		 I1 : in STD_LOGIC_VECTOR(31 downto 0);
		 I2 : in STD_LOGIC_VECTOR(31 downto 0);
		 XR : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end XOR32;

--}} End of automatically maintained section

architecture XOR32 of XOR32 is
begin
	   	  XR <= I1 xor I2;	  
end XOR32;
