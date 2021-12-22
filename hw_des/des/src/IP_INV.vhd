library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IP_INV is
	 port(
		 DIN : in STD_LOGIC_VECTOR(63 downto 0);
		 DOUT : out STD_LOGIC_VECTOR(63 downto 0)
	     );
end IP_INV;

architecture IP_INV_arch of IP_INV is
begin
	
	DOUT(63 downto 48) <= DIN(24)&DIN(56)&DIN(16)&DIN(48)&DIN(08)&DIN(40)&DIN(00)&DIN(32)&DIN(25)&DIN(57)&DIN(17)&DIN(49)&DIN(09)&DIN(41)&DIN(01)&DIN(33);
	DOUT(47 downto 32) <= DIN(26)&DIN(58)&DIN(18)&DIN(50)&DIN(10)&DIN(42)&DIN(02)&DIN(34)&DIN(27)&DIN(59)&DIN(19)&DIN(51)&DIN(11)&DIN(43)&DIN(03)&DIN(35);
	DOUT(31 downto 16) <= DIN(28)&DIN(60)&DIN(20)&DIN(52)&DIN(12)&DIN(44)&DIN(04)&DIN(36)&DIN(29)&DIN(61)&DIN(21)&DIN(53)&DIN(13)&DIN(45)&DIN(05)&DIN(37);
	DOUT(15 downto 0 ) <= DIN(30)&DIN(62)&DIN(22)&DIN(54)&DIN(14)&DIN(46)&DIN(06)&DIN(38)&DIN(31)&DIN(63)&DIN(23)&DIN(55)&DIN(15)&DIN(47)&DIN(07)&DIN(39);

end IP_INV_arch;
                                                                                                                                                                                                                                  