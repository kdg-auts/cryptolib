library IEEE;
use IEEE.std_logic_1164.all;

entity inv_sub_nibbles is
  port(
    INDB : in std_logic_vector(15 downto 0);
    OUDB : out std_logic_vector(15 downto 0)
  );
end entity;

architecture inv_sub_nibbles_arch of inv_sub_nibbles is
begin
    inv_sbox1: entity work.inv_sbox4(inv_sbox4_arch)
    port map(DIN => INDB(15 downto 12), DOUT => OUDB(15 downto 12));
    inv_sbox2: entity work.inv_sbox4(inv_sbox4_arch)
    port map(DIN => INDB(11 downto 8), DOUT => OUDB(11 downto 8));
    inv_sbox3: entity work.inv_sbox4(inv_sbox4_arch)
    port map(DIN => INDB(7 downto 4), DOUT => OUDB(7 downto 4));
    inv_sbox4: entity work.inv_sbox4(inv_sbox4_arch)
    port map(DIN => INDB(3 downto 0), DOUT => OUDB(3 downto 0));
end architecture;