library IEEE;
use IEEE.std_logic_1164.all;

entity mul_4 is
  port(
    x : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0)
  );
end entity;

architecture mul_4_arch of mul_4 is
    signal mul4 : std_logic_vector(5 downto 0);
    signal mul_c1m1 : std_logic_vector(5 downto 0);
    signal mul_c1m2 : std_logic_vector(5 downto 0);
	signal mul_c2m1 : std_logic_vector(5 downto 0);
    constant M : std_logic_vector(4 downto 0) := "10011";
begin
    mul4 <= x & "00"; -- shift 2 bit left
    mul_c1m1 <= mul4 xor ('0' & M); -- first correction with M*1
    mul_c1m2 <= mul4 xor (M & '0'); -- first correction with M*2
    mul_c2m1 <= mul_c1m2 xor ('0' & M); -- second correction
    -- calculate result
    sel: y <= mul4(3 downto 0) when mul4(5 downto 4) = "00" else 
              mul_c1m1(3 downto 0) when mul4(5 downto 4) = "01" else
              mul_c1m2(3 downto 0) when mul_c1m2(5 downto 4) = "00" else
              mul_c2m1(3 downto 0); -- when mul_c1m2(5 downto 4) = "01"
end architecture;