library IEEE;
use IEEE.std_logic_1164.all;

entity state_mux is
  port(
    INDB1 : in std_logic_vector(15 downto 0);
    INDB2 : in std_logic_vector(15 downto 0);
    SEL : in std_logic;
    OUDB : out std_logic_vector(15 downto 0)
  );
end entity;

architecture state_mux_arch of state_mux is
begin
    OUDB <= INDB1 when SEL = '0' else INDB2;
end architecture;