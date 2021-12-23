-------------------------------------------------------------------------------
-- Title       : REG56
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : REG56.vhd
-- Generated   : Wed Dec 15 17:54:37 2021
-------------------------------------------------------------------------------
-- Description : 56-bit register for cipher key schedule
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG56 is
	 port (
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 WE : in STD_LOGIC;
		 DI : in STD_LOGIC_VECTOR(55 downto 0);
		 DO : out STD_LOGIC_VECTOR(55 downto 0)
	);
end entity;

architecture REG56_arch of REG56 is	 
	signal reg_state : STD_LOGIC_VECTOR(55 downto 0) := (others => '0');
begin
	p1: process(CLK, RST) 		
	begin	
		if RST = '1' then
			reg_state <= (others => '0');
		elsif CLK'event and CLK = '1' then
			if WE = '1' then
				reg_state <= DI;
			end if;
	end if;	 
	end process;
	
	DO <= reg_state;
	
end architecture;