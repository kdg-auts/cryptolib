-------------------------------------------------------------------------------
-- Title       : IP
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : IP.vhd
-- Generated   : Thu Sep 16 15:08:10 2021
-------------------------------------------------------------------------------
-- Description : DES IP permutation implementation
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IP is
	 port(
		 DIN : in STD_LOGIC_VECTOR(63 downto 0);
		 DOUT : out STD_LOGIC_VECTOR(63 downto 0)
		 );
end IP;
 
architecture IP of IP is
begin

	DOUT(63 downto 56) <= DIN(06)&DIN(14)&DIN(22)&DIN(30)&DIN(38)&DIN(46)&DIN(54)&DIN(62);
	DOUT(55 downto 48) <= DIN(04)&DIN(12)&DIN(20)&DIN(28)&DIN(36)&DIN(44)&DIN(52)&DIN(60);
	DOUT(47 downto 40) <= DIN(02)&DIN(10)&DIN(18)&DIN(26)&DIN(34)&DIN(42)&DIN(50)&DIN(58);
	DOUT(39 downto 32) <= DIN(00)&DIN(08)&DIN(16)&DIN(24)&DIN(32)&DIN(40)&DIN(48)&DIN(56);
	DOUT(31 downto 24) <= DIN(07)&DIN(15)&DIN(23)&DIN(31)&DIN(39)&DIN(47)&DIN(55)&DIN(63);
	DOUT(23 downto 16) <= DIN(05)&DIN(13)&DIN(21)&DIN(29)&DIN(37)&DIN(45)&DIN(53)&DIN(61);
	DOUT(15 downto 08) <= DIN(03)&DIN(11)&DIN(19)&DIN(27)&DIN(35)&DIN(43)&DIN(51)&DIN(59);
	DOUT(07 downto 00) <= DIN(01)&DIN(09)&DIN(17)&DIN(25)&DIN(33)&DIN(41)&DIN(49)&DIN(57);
	
end IP;
