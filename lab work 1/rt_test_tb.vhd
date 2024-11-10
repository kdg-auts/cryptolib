library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity rt_test_tb is
end rt_test_tb;

architecture rt_test_tb_arch of rt_test_tb is
	-- Component declaration of the tested unit
	component serial_register_transmiter
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		idv : in STD_LOGIC;
		pdi : in STD_LOGIC_VECTOR(7 downto 0);
		sdo : out STD_LOGIC;
		odv : out STD_LOGIC );
	end component;

	component serial_register_receiver
	port(
		clk : in STD_LOGIC; 
   		rst : in STD_LOGIC; 
    	idv : in STD_LOGIC; 
    	sdi : in STD_LOGIC; 
    	pdo : out STD_LOGIC_VECTOR(7 downto 0); 
    	rdy : out STD_LOGIC;
		err : out STD_LOGIC
		);
	end component;
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal rst : STD_LOGIC;
	signal sdi : STD_LOGIC := '0';
	signal idv : STD_LOGIC := '0';
	signal pdi : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal pdo : STD_LOGIC_VECTOR(7 downto 0);
	signal sdo : STD_LOGIC := '0';
	signal rdy : STD_LOGIC := '0';
	signal odv : STD_LOGIC := '0';
	signal err : STD_LOGIC := '0';
	signal serial_data: STD_LOGIC := '0';
	signal err_inj_serial_data: STD_LOGIC := '0';
	signal transmit_data: STD_LOGIC := '0';
	signal inject: STD_LOGIC := '0';
	constant CLK_PERIOD: TIME := 10 ns; 
	type stim_arr_type is array(0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
	constant stim_arr: stim_arr_type :=(x"c3", x"10", x"c6", x"d1", x"77", x"08", x"47", x"42"); 
	constant tx_attempts: natural := 1000;
	signal error_injection_count : natural := 0;
begin

	-- Unit Under Test port map
	UUTT : serial_register_transmiter
	port map (
		clk => clk,
		rst => rst,
		idv => idv,
		pdi => pdi,
		sdo => serial_data,
		odv => transmit_data
	);
	
	UUTR : serial_register_receiver
	port map (
		clk => clk,
   		rst => rst,
    	idv => transmit_data,
    	sdi => err_inj_serial_data,
    	pdo => pdo,
    	rdy => rdy,
		err => err
	);
		
	CLK_GEN: process
	begin
		clk <= '0';
		wait for CLK_PERIOD/2;
		clk <= '1';
		wait for CLK_PERIOD/2;
	end process;
	
	
	stimulators: process
		variable error_count, mismatch_count: natural := 0;
		variable stim_seed1: natural := 42;
		variable stim_seed2: natural := 42**3;
		impure function rand_slv(len : integer) return std_logic_vector is
			variable r : real;
			variable slv : std_logic_vector(len - 1 downto 0);
		begin
			for i in slv'range loop
				uniform(stim_seed1, stim_seed2, r);
				if r > 0.5 then
					slv(i) := '1';
				else 
					slv(i) := '0';
				end if;
			end loop;
			return slv;
		end function;
	begin
		rst <= '1';
		wait for CLK_PERIOD*5;
		rst <= '0';
		wait for CLK_PERIOD*5;
		
		--for element in stim_arr'range loop
		--for element in 0 to stim_arr'high loop
		for element in 1 to tx_attempts loop
			--pdi <= stim_arr(element);
			pdi <= rand_slv(8);
			idv <= '1';
			report "TX launched "&integer'image(element) severity warning;
			wait for CLK_PERIOD;
			idv <= '0';
			wait until rdy = '1'; -- data just have been received
			wait for CLK_PERIOD/2; -- make half-step to get certain values of signals
			if err = '1' then 
				report "Error! Received data corrupted." severity warning;
				error_count := error_count + 1;
			end if;
			--assert pdo = pdi report "TD and RD missmatch!" severity error;
			if pdo /= pdi then
				report "TD and RD missmatch!" severity error;
				mismatch_count := mismatch_count + 1;
			end if;
			wait for CLK_PERIOD;
		end loop;
		report "Overal transmittion attempts: "&integer'image(tx_attempts);
		report "Overal errors detected: "&integer'image(error_count);
		report "Overal data missmatch: "&integer'image(mismatch_count);
		report "Overal errors injected: "&integer'image(error_injection_count);
		wait;
	end process;
		
	err_injector: process(clk, transmit_data)
		variable err_flag: boolean := false;
		variable seed1: integer := 44;
		variable seed2: integer := 3252;
		variable rnd: real := 0.0;
	begin
		
		if transmit_data = '1' then
			if clk'event and clk='1' then
				inject <= '0';
				if err_flag = false then
					UNIFORM(seed1, seed2, rnd);
					if rnd >= 0.97 then 
						err_flag := true;
						inject <= '1';
						error_injection_count <= error_injection_count + 1;
					end if;
				end if;
			end if;
		else
			err_flag := false;
		end if;
	end process;
	err_inj_serial_data <= not serial_data when inject = '1' else serial_data;
			
	
	end rt_test_tb_arch;

configuration TESTBENCH_FOR_serial_register_transmiter of rt_test_tb is
	for rt_test_tb_arch
		for UUTT : serial_register_transmiter
			use entity work.serial_register_transmiter(serial_register_transmiter_arch);
		end for;
		
		for UUTR : serial_register_receiver
			use entity work.serial_register_receiver(serial_register_receiver_arc);
		end for;
		
	end for;
end TESTBENCH_FOR_serial_register_transmiter;

