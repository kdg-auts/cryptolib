library IEEE; 
use IEEE.std_logic_1164.all; 
 
entity serial_register_receiver is 
	port ( 
		clk : in STD_LOGIC; 
		rst : in STD_LOGIC; 
		idv : in STD_LOGIC; 
		sdi : in STD_LOGIC; 
		pdo : out STD_LOGIC_VECTOR(7 downto 0); 
		rdy : out STD_LOGIC;
		err : out STD_LOGIC
	); 
end entity;
 
architecture serial_register_receiver_arc of serial_register_receiver is   
	signal shift_reg : STD_LOGIC_VECTOR(8 downto 0);  
	signal counter : integer range 0 to 9;
	signal parity : std_logic;
begin 
	parity <= shift_reg(7) xor shift_reg(6) xor shift_reg(5) xor shift_reg(4) xor shift_reg(3) xor shift_reg(2) xor shift_reg(1) xor shift_reg(0);
	shifting_in: process(clk, rst) 
	begin 
		if clk'event and clk = '1' then  
			if rst = '1' then
				shift_reg <= (others => '0'); 
				rdy <= '0';
				counter <= 0;  
				pdo <= (others => '0'); 
			elsif idv = '1' and counter < 9 then   
				shift_reg <= shift_reg(7 downto 0) & sdi; 
				rdy <= '0'; 
				counter <= counter + 1; 
			elsif counter = 9 then  
				pdo <= shift_reg(7 downto 0);
				if parity = shift_reg(8) then
					err <='0';
				else 
					err <='1';
				end if;
				rdy <= '1'; 
				counter <= 0; 
			else 
				shift_reg <= (others => '0');   
				rdy <= '0'; 
				counter <= 0; 
			end if; 
		end if; 
  end process;  
end architecture; 
