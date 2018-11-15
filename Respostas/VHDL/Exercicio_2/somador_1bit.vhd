----------------------------------------------------------------------------------
-- Exericicio 2
-- Nesse exercicio o objetivo é descrever um somador de 1 bit completo

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somador_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC);
end somador_1bit;

architecture Behavioral of somador_1bit is

begin
-- Equação boleana da saída para o somador completo, vide a teoria do somador completo
S <= A XOR B XOR Cin;
Cout <= ((A XOR B) AND Cin) OR (A AND B);

end Behavioral;
