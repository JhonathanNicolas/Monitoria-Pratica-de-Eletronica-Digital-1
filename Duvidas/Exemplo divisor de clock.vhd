
-- Esse é um exemplo de um código divisor de clock 
-- Observe que o sinal contador controla a frequencia do clock nesse caso ultiliza-se a seguinte formula:
-- contador = 100Mhz / (2* Fq)
-- Onde: 100MHz é a frequência do clock da placa
--       Fq = a frequência desejada
-- Por exemplo se você quer um clock com a frequência de 1Hz 
-- fq = 1
-- logo:
--     contador = 100*10^6/(2*1) => contador = 50000000
-- Autor: Jhonathan Nicolas



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity clk_1hz is
    Port ( clk : in STD_LOGIC;
           div_clk : out STD_LOGIC_VECTOR (1 downto 0));
end clk_1hz;

architecture Behavioral of clk_1hz is
signal dividido : STD_LOGIC_VECTOR :="00";
signal contador : integer range 0 to 100000000;

begin
div_clk <= dividido;
process (clk)
    begin 
    if (rising_edge (clk)) then
        if (contador = 50000000) then -- contador para a frequência de 1Hz
            dividido <= not dividido;
            contador <= 0;
        else
            contador <= contador + 1;
            dividido <= dividido;
        end if;
    end if;
end process;


end Behavioral;
