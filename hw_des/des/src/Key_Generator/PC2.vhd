-------------------------------------------------------------------------------
-- Title       : PC2
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : PC2.vhd
-- Generated   : Thu Oct 07 15:18:10 2021
-------------------------------------------------------------------------------
-- Description : DES PC2 permutation implementation	(for key schedule)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC2 is
	port(
		PC2 : out STD_LOGIC_VECTOR(47 downto 0);
		PCI : in STD_LOGIC_VECTOR(55 downto 0)
	);
end PC2;

architecture PC2_arch of PC2 is
begin

	PC2(47 downto 36) <= PCI(42)&PCI(39)&PCI(45)&PCI(32)&PCI(55)&PCI(51)&PCI(53)&PCI(28)&PCI(41)&PCI(50)&PCI(35)&PCI(46);
	PC2(35 downto 24) <= PCI(33)&PCI(37)&PCI(44)&PCI(52)&PCI(30)&PCI(48)&PCI(40)&PCI(49)&PCI(29)&PCI(36)&PCI(43)&PCI(54);
	PC2(23 downto 12) <= PCI(15)&PCI(04)&PCI(25)&PCI(19)&PCI(09)&PCI(01)&PCI(26)&PCI(16)&PCI(05)&PCI(11)&PCI(23)&PCI(08);
	PC2(11 downto 00) <= PCI(12)&PCI(07)&PCI(17)&PCI(00)&PCI(22)&PCI(03)&PCI(10)&PCI(14)&PCI(06)&PCI(20)&PCI(27)&PCI(24);

end PC2_arch;
                                                                                                                                                                                                                                  