----------------------------------------------------------------------------------

-- Exercicio 1-B
-- Nessa abordagem será ultilizado arquiterua RTL para contruir o mesmo circuito do 
-- exercicio 1A verifique que o circuito se trata de um multiplexador de 4 entradas
-- e uma saída.

--Observação: Analise o esquemático tanto do exercio A quanto do B

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Exercicio_1B is
    Port ( S : out STD_LOGIC;
           E0 : in STD_LOGIC;
           E1 : in STD_LOGIC;
           E2 : in STD_LOGIC;
           E3 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC);
end Exercicio_1B;

architecture Behavioral of Exercicio_1B is

-- Esse sinal será para unir a entrada A e B em um único vetor
signal seletora : std_logic_vector(1 downto 0) := "00";

begin

-- Aqui é feita a concatenação da entrada A e B no sinal "seletora" para facilitar
-- a multiplexação
seletora <= A & B;
-- Aqui é feita a multiplexação da saída S conforme o valor que estiver na seletora
with seletora select S
    <= E0 when "00",
       E1 when "01",
       E2 when "10",
       E3 when "11",
       'X' when others; -- caso exista outro valor devido ao tipo de dado std_logic use o dont care

end Behavioral;
