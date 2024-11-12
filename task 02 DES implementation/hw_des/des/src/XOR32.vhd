-------------------------------------------------------------------------------
-- Title       : XOR32
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : XOR32.vhd
-- Generated   : Mon May 20 18:18:56 2013
-------------------------------------------------------------------------------
-- Description : 32-bit XOR operation
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity XOR32 is
	port(
		I1 : in STD_LOGIC_VECTOR(31 downto 0);
		I2 : in STD_LOGIC_VECTOR(31 downto 0);
		XR : out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture XOR32_arch of XOR32 is
begin
	XR <= I1 xor I2;	  
end architecture;
