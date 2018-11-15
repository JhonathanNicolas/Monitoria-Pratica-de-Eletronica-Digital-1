----------------------------------------------------------------------------------
-- Exericicio 4.0
-- Nesse exercicio o objetivo é descrever um subtrator de 1 bit completo

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Subtrator_1BIT is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC);
end Subtrator_1BIT;

architecture Behavioral of Subtrator_1BIT is

begin

S <= (not(A) and not(B) and Cin) OR (not(A) and B and not(Cin)) OR (A and not(B)and not(Cin)) OR (A and B and Cin);
Cout <= (not(A) and not(B) and Cin) OR (not(A) and (B) and not(Cin)) OR (not(A) and B and Cin) OR (A and B and Cin);
end Behavioral;
