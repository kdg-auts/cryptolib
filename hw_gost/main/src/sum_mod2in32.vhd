-------------------------------------------------------------------------------
--
-- Title       : sum_mod2in32
-- Design      : main
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : sum_mod2in32.vhd
-- Generated   : Wed Apr 25 13:11:42 2012
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;

entity sum_mod2pw32 is
	 port(
		 inp1 : in STD_LOGIC_VECTOR(31 downto 0);
		 inp2 : in STD_LOGIC_VECTOR(31 downto 0);
		 rslt : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end sum_mod2pw32;

architecture sum_mod2pw32_beh of sum_mod2pw32 is   
begin

	rslt <= inp1 + inp2;
	
end sum_mod2pw32_beh;
