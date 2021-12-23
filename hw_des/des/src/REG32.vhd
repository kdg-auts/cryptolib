-------------------------------------------------------------------------------
-- Title       : REG32
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : REG32.vhd
-- Generated   : Mon May 20 17:54:37 2013
-------------------------------------------------------------------------------
-- Description : 32-bit register for cipher state storage
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG32 is
	port(
		CLK : in STD_LOGIC;
		DI : in STD_LOGIC_VECTOR(31 downto 0);
		DO : out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture REG32_arch of REG32 is
begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then 
			DO <= DI;
		end if;
	end process;
end architecture;
