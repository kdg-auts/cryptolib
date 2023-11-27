library IEEE;
use IEEE.std_logic_1164.all;

entity sub_nibbles is
  port(
    INDB : in std_logic_vector(15 downto 0);
    OUDB : out std_logic_vector(15 downto 0)
  );
end entity;

architecture sub_nibbles_arch of sub_nibbles is
begin
    sbox1: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(15 downto 12), DOUT => OUDB(15 downto 12));
    sbox2: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(11 downto 8), DOUT => OUDB(11 downto 8));
    sbox3: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(7 downto 4), DOUT => OUDB(7 downto 4));
    sbox4: entity work.sbox4(sbox4_arch)
    port map(DIN => INDB(3 downto 0), DOUT => OUDB(3 downto 0));
end architecture;