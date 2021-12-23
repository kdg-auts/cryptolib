-------------------------------------------------------------------------------
-- Title       : DMX32
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : DMX32.vhd
-- Generated   : Mon May 20 18:08:10 2013
-------------------------------------------------------------------------------
-- Description : 32-bit demultiplexer
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DMX32 is
	 port(
		 CS : in STD_LOGIC;
		 DI : in STD_LOGIC_VECTOR(31 downto 0);
		 AO : out STD_LOGIC_VECTOR(31 downto 0);
		 BO : out STD_LOGIC_VECTOR(31 downto 0)
	 );
end entity;

architecture DMX32_arch of DMX32 is
begin
	process (DI,CS)
	begin
		if CS = '0' then 
			BO <= DI;
			AO <= (others => '0');
		else
			AO <= DI;
			BO <= (others => '0');
		end if;
	end process;
end architecture;
