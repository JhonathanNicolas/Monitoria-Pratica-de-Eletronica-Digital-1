----------------------------------------------------------------------------------

-- Exercicio 1-A
-- Nessa abordagem será ultilizado sinais para facilitar o entendimento da 
-- descrição em VHDL porém a equação boleana pode ser implementada sem a 
-- ultlização de sinais.

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Se atentar ao fato de que a entidade deve conter as entradas e saídas
-- exatamente como descrito no diagrama
entity Exercicio_1A is
    Port ( S : out STD_LOGIC;
           E0 : in STD_LOGIC;
           E1 : in STD_LOGIC;
           E2 : in STD_LOGIC;
           E3 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC);
end Exercicio_1A;

architecture Behavioral of Exercicio_1A is

--Sinais temporários
signal s0 : std_logic := '0';
signal s1 : std_logic := '0';
signal s2 : std_logic := '0';
signal s3 : std_logic := '0';

begin

-- O sinais recebem o valor de cada AND de 3 entradas conforme o diagrama
s0 <= E0 and not(A) and not(B);
s1 <= E1 and not(A) and B;
s2 <= E2 and A and not(B);
s3 <= E0 and A and  B;

-- A saida S recebe o valor dos sinais como resultado de uma OR de quantro entradas conforme o diagrama

S <= s0 OR s1 OR s2 OR s3;

end Behavioral;
