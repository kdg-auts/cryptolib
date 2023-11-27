library IEEE;
use IEEE.std_logic_1164.all;

entity mul_9 is
    port(
        x : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end entity;

architecture mul_9_arch of mul_9 is
    -- signal mul8 : std_logic_vector(6 downto 0);
    -- signal mul9 : std_logic_vector(6 downto 0);
    -- signal mul_m1 : std_logic_vector(6 downto 0);
    -- signal mul_m2 : std_logic_vector(6 downto 0);
    -- signal mul_m3 : std_logic_vector(6 downto 0);
    -- constant M : std_logic_vector(4 downto 0) := "10011";
begin
    -- mul8 <= x & "000"; -- shift 3 bit left
    -- mul9 <= mul8 xor ("000" & x);
    -- mul_m1 <= mul9 xor (M & "00"); -- first correction
    -- mul_m2 <= mul_m1 xor ('0' & M & '0'); -- second correction
    -- mul_m3 <= mul_m2 xor ("00" & M); -- third correction
    -- -- calculate result
    -- sel: y <= mul9(3 downto 0) when mul9 < "0010000" else 
    --           mul_m1(3 downto 0) when mul_m1 < "0010000" else
    --           mul_m2(3 downto 0) when mul_m2 < "0010000" else
    --           mul_m3(3 downto 0);
    y <= x"0" when x = x"0" else
         x"9" when x = x"1" else
         x"1" when x = x"2" else
         x"8" when x = x"3" else
         x"2" when x = x"4" else
         x"B" when x = x"5" else
         x"3" when x = x"6" else
         x"A" when x = x"7" else
         x"4" when x = x"8" else
         x"D" when x = x"9" else
         x"5" when x = x"A" else
         x"C" when x = x"B" else
         x"6" when x = x"C" else
         x"F" when x = x"D" else
         x"7" when x = x"E" else
         x"E"; -- when x = x"F"
end architecture;