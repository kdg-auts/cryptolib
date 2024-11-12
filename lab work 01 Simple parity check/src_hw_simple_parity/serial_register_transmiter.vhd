library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity serial_register_transmiter is
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 idv : in STD_LOGIC;
		 pdi : in STD_LOGIC_VECTOR(7 downto 0);
		 sdo : out STD_LOGIC;
		 odv : out STD_LOGIC
	     );
end serial_register_transmiter;


architecture serial_register_transmiter_arch of serial_register_transmiter is
	signal shift_reg : STD_LOGIC_VECTOR(8 downto 0);
	signal counter : integer range 0 to 8;
	signal parity : std_logic;
begin
	sdo <= shift_reg(8);
	parity <= pdi(7) xor pdi(6) xor pdi(5) xor pdi(4) xor pdi(3) xor pdi(2) xor pdi(1) xor pdi(0);
	shifting_out: process(clk, rst)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then 
				shift_reg <= (others => '0'); 
				odv <= '0'; 
				counter <= 0; 
			elsif idv = '1' then
				shift_reg <= parity & pdi; 
				odv <= '1'; 
				counter <= 8;
			elsif counter > 0 then 
				shift_reg <= shift_reg(7 downto 0) & '0'; 
				counter <= counter - 1; 
			else 
				shift_reg <= (others => '0'); 
				odv <= '0'; 
			end if;
		end if;
	end process;
end serial_register_transmiter_arch;
