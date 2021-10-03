-- Файл организации тестирования работы модуля шифрования
-- тестовая установка
library IEEE;
use  IEEE.std_logic_1164.all;

-- интерфейс тестовой установки
entity GOST_Testbench is
end GOST_Testbench;

-- функционал тестовой установки
architecture Struct of GOST_Testbench is

	-- объявление тестовых сигналов
	signal Test_Output : STD_LOGIC_VECTOR (9 downto 0);
	signal Clock,Clear :STD_LOGIC;

	component basic_cypher is
		port (
			CLK: in STD_LOGIC;
			RESET: in STD_LOGIC;
			Output: out STD_LOGIC_VECTOR (9 downto 0)
		); 
	end component;

begin

	Project:Top
		port map(Clock,Clear,Test_Output);
	
	process
	begin
		Clock <= '1';
		wait for 10 ns;
		Clock <= '0';
		wait for 10 ns;
	end process;

	process
	begin
		Clear<='1';
		wait for 10 ns;
		Clear<='0';
		wait for 10000 ns;       
	end process;

end struct;