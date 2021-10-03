-------------------------------------------------------------------------------
--
-- Title       : basic_cypher
-- Design      : main
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\compile\basic_cypher.vhd
-- Generated   : Sun Oct  3 22:17:23 2021
-- From        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\src\basic_cypher.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity basic_cypher is
  port(
       data_out_en : in STD_LOGIC;
       init_load_en : in STD_LOGIC;
       last_round_en : in STD_LOGIC;
       round_clk : in STD_LOGIC;
       data_in : in STD_LOGIC_VECTOR(63 downto 0);
       round_key : in STD_LOGIC_VECTOR(31 downto 0);
       data_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end basic_cypher;

architecture basic_cypher of basic_cypher is

---- Component declarations -----

component dmx_64bit
  port (
       ibus : in STD_LOGIC_VECTOR(63 downto 0);
       out_sel : in STD_LOGIC;
       obus1 : out STD_LOGIC_VECTOR(63 downto 0);
       obus2 : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component latch_32bit
  port (
       DI : in STD_LOGIC_VECTOR(63 downto 0);
       WE : in STD_LOGIC;
       DO : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0')
  );
end component;
component mux_64bit
  port (
       bus1 : in STD_LOGIC_VECTOR(63 downto 0);
       bus2 : in STD_LOGIC_VECTOR(63 downto 0);
       bus_sel : in STD_LOGIC;
       bout : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component round_function
  port (
       last_round_en : in STD_LOGIC;
       round_key : in STD_LOGIC_VECTOR(31 downto 0);
       state_in : in STD_LOGIC_VECTOR(63 downto 0);
       state_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS113 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS147 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS176 : STD_LOGIC_VECTOR (63 downto 0);
signal BUS68 : STD_LOGIC_VECTOR (63 downto 0);

begin

----  Component instantiations  ----

U1 : mux_64bit
  port map(
       bout => BUS147,
       bus1 => BUS113,
       bus2 => data_in,
       bus_sel => init_load_en
  );

U2 : latch_32bit
  port map(
       DI => BUS147,
       DO => BUS176,
       WE => round_clk
  );

U3 : round_function
  port map(
       last_round_en => last_round_en,
       round_key => round_key,
       state_in => BUS68,
       state_out => BUS113
  );

U4 : dmx_64bit
  port map(
       ibus => BUS176,
       obus1 => BUS68,
       obus2 => data_out,
       out_sel => data_out_en
  );


end basic_cypher;
