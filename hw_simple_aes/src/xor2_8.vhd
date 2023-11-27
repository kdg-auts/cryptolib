library IEEE;
use IEEE.std_logic_1164.all;

entity xor2_8 is
  port(
    DI1 : in std_logic_vector(7 downto 0);
    DI2 : in std_logic_vector(7 downto 0);
    DO : out std_logic_vector(7 downto 0)
  );
end entity;

architecture xor2_8_arch of xor2_8 is
begin
    DO <= DI1 xor DI2;
end architecture;