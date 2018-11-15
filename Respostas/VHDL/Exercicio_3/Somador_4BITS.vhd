----------------------------------------------------------------------------------
-- Exericicio 3
-- Nesse exercicio o objetivo é ultilizar o VHD do somador de 1 bit
-- para descrever um somador de 4 bits ultilizando port map
-- observe que será utlilizado sinais para fazer as conexões do cout e cin

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Somador_4BITS is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end Somador_4BITS;

architecture Behavioral of Somador_4BITS is

-- Sinais para fazer as conexões dos somadores de 1 bit
signal s_cout1 : STD_LOGIC := '0';
signal s_cout2 : STD_LOGIC := '0';
signal s_cout3 : STD_LOGIC := '0';

-- Necessário instanciar o componente do somador de 1 bit
component somador_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC);
end component;


begin

-- port maps para cada BIT do somador
-- Observe a lógica para conectar os bits:  o carry out do bit anterior será o 
--carry in do bit posterior que será conectado por sinais, além disso o 
-- carry in do primeiro bit sempre será zero e do último bit será o próprio carry out
-- do somador de 4 bits.
BIT0: somador_1bit port map (A => A(0) , B => B(0) , Cout => s_cout1 , Cin => '0' ,S => S(0));
BIT1: somador_1bit port map (A => A(1) , B => B(1) , Cout => s_cout2 , Cin => s_cout1 ,S => S(1));
BIT2: somador_1bit port map (A => A(2) , B => B(2) , Cout => s_cout3 , Cin => s_cout2 ,S => S(2));
BIT3: somador_1bit port map (A => A(3) , B => B(3) , Cout => Cout , Cin => s_cout3 ,S => S(3));


end Behavioral;
