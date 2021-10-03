library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IP_INV is
	 port(
		 DOUT : out STD_LOGIC_VECTOR(63 downto 0);
		 DL : in STD_LOGIC_VECTOR(31 downto 0);
		 DR : in STD_LOGIC_VECTOR(31 downto 0)
	     );
end IP_INV;

architecture IP_INV_arch of IP_INV is
begin

	DOUT(63 downto 48) <= DR(24)&DL(24)&DR(16)&DL(16)&DR(08)&DL(08)&DR(00)&DL(00)&DR(25)&DL(25)&DR(17)&DL(17)&DR(09)&DL(09)&DR(01)&DL(01);
	DOUT(47 downto 32) <= DR(26)&DL(26)&DR(18)&DL(18)&DR(10)&DL(10)&DR(02)&DL(02)&DR(27)&DL(27)&DR(19)&DL(19)&DR(11)&DL(11)&DR(03)&DL(03);
	DOUT(31 downto 16) <= DR(28)&DL(28)&DR(20)&DL(20)&DR(12)&DL(12)&DR(04)&DL(04)&DR(29)&DL(29)&DR(21)&DL(21)&DR(13)&DL(13)&DR(05)&DL(05);
	DOUT(15 downto 0 ) <= DR(30)&DL(30)&DR(22)&DL(22)&DR(14)&DL(14)&DR(06)&DL(06)&DR(31)&DL(31)&DR(23)&DL(23)&DR(15)&DL(15)&DR(07)&DL(07);
	 

end IP_INV_arch;
                                                                                                                                                                                                                                  