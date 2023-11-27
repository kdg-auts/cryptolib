library IEEE;
use IEEE.std_logic_1164.all;

entity inv_mul_col is
    port(
        M0 : in std_logic_vector(3 downto 0);
        M1 : in std_logic_vector(3 downto 0);
        N0 : out std_logic_vector(3 downto 0);
        N1 : out std_logic_vector(3 downto 0)
    );
end entity;

architecture inv_mul_col_arch of inv_mul_col is
    signal m0x2, m1x2, m0x9, m1x9 : std_logic_vector(3 downto 0);
begin
    mul2_m0: entity work.mul_2(mul_2_arch) port map(x => M0, y => m0x2);
    mul2_m1: entity work.mul_2(mul_2_arch) port map(x => M1, y => m1x2);
    mul9_m0: entity work.mul_9(mul_9_arch) port map(x => M0, y => m0x9);
    mul9_m1: entity work.mul_9(mul_9_arch) port map(x => M1, y => m1x9);
    N0 <= m0x9 xor m1x2;
    N1 <= m1x9 xor m0x2;
end architecture;