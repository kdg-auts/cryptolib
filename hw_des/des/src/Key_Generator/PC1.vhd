-------------------------------------------------------------------------------
-- Title       : PC1
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : PC1.vhd
-- Generated   : Thu Oct 07 14:58:10 2021
-------------------------------------------------------------------------------
-- Description : DES PC1 permutation implementation	(for key schedule)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC1 is
	port(
		PCI : in STD_LOGIC_VECTOR(63 downto 0);
		PCO : out STD_LOGIC_VECTOR(55 downto 0)
	);
end entity;
 
architecture PC1_arch of PC1 is
begin

	PCO <=  PCI(07)&PCI(15)&PCI(23)&PCI(31)&PCI(39)&PCI(47)&PCI(55)&PCI(63)&
			PCI(06)&PCI(14)&PCI(22)&PCI(30)&PCI(38)&PCI(46)&PCI(54)&PCI(62)&
			PCI(05)&PCI(13)&PCI(21)&PCI(29)&PCI(37)&PCI(45)&PCI(53)&PCI(61)&
			PCI(04)&PCI(12)&PCI(20)&PCI(28)&PCI(01)&PCI(09)&PCI(17)&PCI(25)&
			PCI(33)&PCI(41)&PCI(49)&PCI(57)&PCI(02)&PCI(10)&PCI(18)&PCI(26)&
			PCI(34)&PCI(42)&PCI(50)&PCI(58)&PCI(03)&PCI(11)&PCI(19)&PCI(27)&
			PCI(35)&PCI(43)&PCI(51)&PCI(59)&PCI(36)&PCI(44)&PCI(52)&PCI(60);
	
end architecture;
