----------------------------------------------------------------------------------
-- Exericicio 4.1
-- Nesse exercicio o objetivo é ultilizando o código do subtrator de 1 BIT
-- descrever um subtrator completo de 4 bits ultlizando sinais para fazer
-- as conexões necessárias do port map


-- Fica como sugestão fazer esse código ultlizando o somador de 4 bits 
-- juntamente com o complemento de 2

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity subtrator_4BITS is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end subtrator_4BITS;

architecture Behavioral of subtrator_4BITS is

-- Necessário instanciar o componente do subtrator de 1 bit
component Subtrator_1BIT is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC);
end component;


-- Sinais para fazer as conexões dos subtratores de 1 bit
signal s_cout1 : STD_LOGIC := '0';
signal s_cout2 : STD_LOGIC := '0';
signal s_cout3 : STD_LOGIC := '0';

begin

-- port maps para cada BIT do somador
-- Observe a lógica para conectar os bits:  o carry out do bit anterior será o 
--carry in do bit posterior que será conectado por sinais, além disso o 
-- carry in do primeiro bit sempre será zero e do último bit será o próprio carry out
-- do subtrator de 4 bits.
BIT0: Subtrator_1BIT port map (A => A(0) , B => B(0) , Cout => s_cout1 , Cin => '0' ,S => S(0));
BIT1: Subtrator_1BIT port map (A => A(1) , B => B(1) , Cout => s_cout2 , Cin => s_cout1 ,S => S(1));
BIT2: Subtrator_1BIT port map (A => A(2) , B => B(2) , Cout => s_cout3 , Cin => s_cout2 ,S => S(2));
BIT3: Subtrator_1BIT port map (A => A(3) , B => B(3) , Cout => Cout , Cin => s_cout3 ,S => S(3));

end Behavioral;
