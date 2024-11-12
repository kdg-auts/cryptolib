library IEEE;
use IEEE.std_logic_1164.all;

entity mix_columns is
    port(
        INDB : in std_logic_vector(15 downto 0);
        OUDB : out std_logic_vector(15 downto 0)
    );
end entity;

architecture mix_columns_arch of mix_columns is
begin
    mul_col1: entity work.mul_col(mul_col_arch) 
    port map(
        N0 => INDB(15 downto 12), 
        N1 => INDB(11 downto 8), 
        M0 => OUDB(15 downto 12), 
        M1 => OUDB(11 downto 8)
    );
    mul_col2: entity work.mul_col(mul_col_arch) 
    port map(
        N0 => INDB(7 downto 4), 
        N1 => INDB(3 downto 0), 
        M0 => OUDB(7 downto 4), 
        M1 => OUDB(3 downto 0)
    );
end architecture;