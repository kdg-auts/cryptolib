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

	DOUT (63 downto 32) <= DIN(6)&DIN(14)&DIN(22)&DIN(30)&DIN(38)&DIN(46)&DIN(54)&DIN(62)&DIN(4)&DIN(12)&DIN(20)&DIN(28)&DIN(36)&DIN(44)&DIN(52)&DIN(60)&DIN(2)&DIN(10)&DIN(18)&DIN(26)&DIN(34)&DIN(42)&DIN(50)&DIN(58)&DIN(0)&DIN(8)&DIN(16)&DIN(24)&DIN(32)&DIN(40)&DIN(48)&DIN(56);
	DOUT (31 downto 0) <= DIN(7)&DIN(15)&DIN(23)&DIN(31)&DIN(39)&DIN(47)&DIN(55)&DIN(63)&DIN(5)&DIN(13)&DIN(21)&DIN(29)&DIN(37)&DIN(45)&DIN(53)&DIN(61)&DIN(3)&DIN(11)&DIN(19)&DIN(27)&DIN(35)&DIN(43)&DIN(51)&DIN(59)&DIN(1)&DIN(9)&DIN(17)&DIN(25)&DIN(33)&DIN(41)&DIN(49)&DIN(57);

end IP;
