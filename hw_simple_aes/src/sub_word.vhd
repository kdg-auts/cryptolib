library IEEE;
use IEEE.std_logic_1164.all;

entity sub_word is
  port(
    INDB : in std_logic_vector(7 downto 0);
    OUDB : out std_logic_vector(7 downto 0)
  );
end entity;

architecture sub_word_arch of sub_word is
begin
    sbox1: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(7 downto 4), DOUT => OUDB(7 downto 4));
    sbox2: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(3 downto 0), DOUT => OUDB(3 downto 0));
end architecture;