library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC2 is
	 port(
		 PC2 : out STD_LOGIC_VECTOR(47 downto 0);
		 C : in STD_LOGIC_VECTOR(27 downto 0);
		 D : in STD_LOGIC_VECTOR(27 downto 0)
	     );
end PC2;

architecture PC2_arch of PC2 is
begin

	PC2(47 downto 36) <= C(3)&C(0)&C(7)&C(21)&C(13)&C(17)&C(24)&C(05)&C(27)&C(10)&C(20)&C(15);
	PC2(35 downto 24) <= C(19)&C(4)&C(16)&C(22)&C(11)&C(1)&C(26)&C(18)&C(8)&C(2)&C(23)&C(12);
	PC2(23 downto 12) <= D(01)&D(12)&D(19)&D(26)&D(06)&D(15)&D(07)&D(25)&D(03)&D(11)&D(18)&D(22);
	PC2(11 downto 00) <= D(9)&D(20)&D(5)&D(14)&D(27)&D(02)&D(4)&D(0)&D(23)&D(10)&D(16)&D(13)	;
	  
end PC2_arch;
                                                                                                                                                                                                                                  