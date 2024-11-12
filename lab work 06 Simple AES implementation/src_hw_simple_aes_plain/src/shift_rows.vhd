library IEEE;
use IEEE.std_logic_1164.all;

entity shift_rows is
  port(
    INDB : in std_logic_vector(15 downto 0);
    OUDB : out std_logic_vector(15 downto 0)
  );
end entity;

architecture shift_rows_arch of shift_rows is
begin
    OUDB <= INDB(15 downto 12) & INDB(3 downto 0) & INDB(7 downto 4) & INDB(11 downto 8);
end architecture;