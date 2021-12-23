-------------------------------------------------------------------------------
-- Title       : KeyScheduleRound
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : KeyScheduleRound.vhd
-- Generated   : Wed Dec 15 18:34:37 2021
-------------------------------------------------------------------------------
-- Description : Round function for cipher key schedule module
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity KeyScheduleRound is
	 port (
		 RLX : in STD_LOGIC;
		 KSTI : in STD_LOGIC_VECTOR(55 downto 0);
		 KSTO : out STD_LOGIC_VECTOR(55 downto 0);
		 RKEY : out STD_LOGIC_VECTOR(47 downto 0)
	);
end entity;

architecture KeyScheduleRound_arch of KeyScheduleRound is	 
	signal KST : STD_LOGIC_VECTOR(55 downto 0) := (others => '0');
begin
	
	KST(55 downto 28) <=	KSTI(53 downto 28)&KSTI(55 downto 54) when RLX = '1' else -- rotate 2 bits left
							KSTI(54 downto 28)&KSTI(55); -- when RLX = '0' -- rotate 1 bit left	
	
	KST(27 downto 0) <= 	KSTI(25 downto 0)&KSTI(27)& KSTI(26) when RLX = '1' else -- rotate 2 bits left
							KSTI(26 downto 0)&KSTI(27); -- when RLX = '0' -- rotate 1 bit left	
		
	KSTO <= KST;
	
	rk_gen: entity work.PC2(PC2_arch)
	port map(
		PCI => KST,
		PC2 => RKEY
	);
	
end architecture;