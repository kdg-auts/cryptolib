library IEEE;
use IEEE.std_logic_1164.all;

entity inv_mix_columns is
    port(
        INDB : in std_logic_vector(15 downto 0);
        OUDB : out std_logic_vector(15 downto 0)
    );
end entity;

architecture inv_mix_columns_arch of inv_mix_columns is
begin
    inv_mul_col1: entity work.inv_mul_col(inv_mul_col_arch) 
    port map(
        M0 => INDB(15 downto 12), 
        M1 => INDB(11 downto 8), 
        N0 => OUDB(15 downto 12), 
        N1 => OUDB(11 downto 8)
    );
    inv_mul_col2: entity work.inv_mul_col(inv_mul_col_arch) 
    port map(
        M0 => INDB(7 downto 4), 
        M1 => INDB(3 downto 0), 
        N0 => OUDB(7 downto 4), 
        N1 => OUDB(3 downto 0)
    );
end architecture;