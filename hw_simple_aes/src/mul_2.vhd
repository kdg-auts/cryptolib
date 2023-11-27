library IEEE;
use IEEE.std_logic_1164.all;

entity mul_2 is
  port(
    x : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end entity;

architecture mul_2_arch of mul_2 is
    signal mul2 : std_logic_vector(4 downto 0);
    signal mul_m1 : std_logic_vector(4 downto 0);
    constant M : std_logic_vector(4 downto 0) := "10011";
begin
    mul2 <= x & '0'; -- shift 1 bit left
    mul_m1 <= mul2 xor M; -- first correction
    -- calculate result
    sel: y <= mul2(3 downto 0) when mul2(4) = '0' else mul_m1(3 downto 0);
end architecture;