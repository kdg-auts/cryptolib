library IEEE;
use IEEE.std_logic_1164.all;

entity sbox4 is
  port(
    DIN : in std_logic_vector(3 downto 0);
    DOUT : out std_logic_vector(3 downto 0)
  );
end entity;

architecture sbox4_arch of sbox4 is
begin
    DOUT <= x"9" when DIN = x"0" else
            x"4" when DIN = x"1" else
            x"A" when DIN = x"2" else
            x"B" when DIN = x"3" else
            x"D" when DIN = x"4" else
            x"1" when DIN = x"5" else
            x"8" when DIN = x"6" else
            x"5" when DIN = x"7" else
            x"6" when DIN = x"8" else
            x"2" when DIN = x"9" else
            x"0" when DIN = x"A" else
            x"3" when DIN = x"B" else
            x"C" when DIN = x"C" else
            x"E" when DIN = x"D" else
            x"F" when DIN = x"E" else
            x"7"; --when DIN = x"F" 
end architecture;