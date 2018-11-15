
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity clk_256hz is
    Port ( clk : in STD_LOGIC;
           div_clk : out STD_LOGIC_VECTOR (1 downto 0));
end clk_256hz;

architecture Behavioral of clk_256hz is
signal dividido : STD_LOGIC_VECTOR :="00";
signal contador : integer range 0 to 100000000;

begin
div_clk <= dividido;

process (clk)
    begin 
    if (rising_edge (clk)) then
        if (contador = 97655) then 
            dividido <= not dividido;
            contador <= 0;
        else
            contador <= contador + 1;
            dividido <= dividido;
        end if;
    end if;
end process;


end Behavioral;
