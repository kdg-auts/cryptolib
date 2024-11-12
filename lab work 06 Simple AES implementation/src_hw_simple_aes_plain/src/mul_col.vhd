library IEEE;
use IEEE.std_logic_1164.all;

entity mul_col is
    port(
        N0 : in std_logic_vector(3 downto 0);
        N1 : in std_logic_vector(3 downto 0);
        M0 : out std_logic_vector(3 downto 0);
        M1 : out std_logic_vector(3 downto 0)
    );
end entity;

architecture mul_col_arch of mul_col is
    signal n0x4, n1x4 : std_logic_vector(3 downto 0);
begin
    mul4_n0: entity work.mul_4(mul_4_arch) port map(x => N0, y => n0x4);
    mul4_n1: entity work.mul_4(mul_4_arch) port map(x => N1, y => n1x4);
    M0 <= N0 xor n1x4;
    M1 <= N1 xor n0x4;
end architecture;