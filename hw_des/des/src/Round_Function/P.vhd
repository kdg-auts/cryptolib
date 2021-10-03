-------------------------------------------------------------------------------
--
-- Title       : P
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : P.vhd
-- Generated   : Tue May 21 16:10:33 2013
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
--{entity {P} architecture {P}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity P is
	 port(
		 PI : in STD_LOGIC_VECTOR(31 downto 0);
		 PO : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end P;

--}} End of automatically maintained section

architecture P of P is
begin
	PO <= PI(24)&PI(3)&PI(10)&PI(21)&PI(5)&PI(29)&PI(12)&PI(18)&PI(8)&PI(2)&PI(26)&PI(31)&PI(13)&PI(23)&PI(7)&PI(1)&PI(9)&PI(30)&PI(17)&PI(4)&PI(25)&PI(22)&PI(14)&PI(0)&PI(16)&PI(27)&PI(11)&PI(28)&PI(20)&PI(19)&PI(6)&PI(15);
	
                                                                                                                                                                                                         
                                                        



	
end P;
