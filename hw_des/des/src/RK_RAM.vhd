-------------------------------------------------------------------------------
-- Title       : RK_RAM
-- Design      : des
-- Author      : KDG
-- Company     : AUTS - NTU KhPI
-- File        : RK_RAM.vhd
-- Generated   : Wed Dec 15 17:54:37 2021
-------------------------------------------------------------------------------
-- Description : 16-cell storage RAM for scheduled 48-bit round keys
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RK_RAM is
	 port (
		 CLK : in STD_LOGIC;
		 RST : in STD_LOGIC;
		 RW : in STD_LOGIC;
		 OE : in STD_LOGIC;
		 ADDR : in STD_LOGIC_VECTOR(3 downto 0);
		 DI : in STD_LOGIC_VECTOR(47 downto 0);
		 DO : out STD_LOGIC_VECTOR(47 downto 0)
	);
end entity;

architecture RK_RAM_arch of RK_RAM is	 
	type RAM_DATA_t is array (0 to 15) of std_logic_vector(47 downto 0);
	signal RAM_DATA : RAM_DATA_t := (others => (others => '0'));
	signal sel_value : STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
begin
	main: process(CLK, RST) 		
	begin	
		if RST = '1' then
			RAM_DATA <= (others => (others => '0'));
		elsif CLK'event and CLK = '1' then
			if RW = '0' then -- read RAM
				sel_value <= RAM_DATA(to_integer(unsigned(ADDR)));
			else -- RW = '1' -- write RAM
				RAM_DATA(to_integer(unsigned(ADDR))) <= DI;
			end if;
		end if;	 
	end process;
	
	DO <= sel_value when OE = '1' else (others => '0');
	
end architecture;