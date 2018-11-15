----------------------------------------------------------------------------------
-- Exericicio 5 e 6
-- Nesse exercicio o objetivo � ultilizar o c�digo do subtrator e somador de 4 bits
-- para permitir com que o usu�rio por meio de uma seletora escolha se deseja a
-- opera��o de soma ou subtra��o e mostrar esse resultado nos LEDs inclusive o 
-- carry out da opera��o.

-- estude esquem�tico desse VHD

--Autor: Jhonathan Nicolas M. Silva
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seletor is
    Port ( led : out STD_LOGIC_VECTOR (4 downto 0);
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           seletora : in STD_LOGIC;
           dp : out STD_LOGIC; -- Para o exericio 6
           an : out STD_LOGIC_VECTOR (3 downto 0); -- Para o exericio 6
           seg : out STD_LOGIC_VECTOR (6 downto 0) -- Para o exericio 6
           );
end Seletor;

architecture Behavioral of Seletor is


-- Necess�rio instanciar os componentes do subtrator e somador de 4 bits
component subtrator_4BITS is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Somador_4BITS is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end component;

------------------------------------------

-- Para o exercicio 7 
-- Necess�rio instanciar o componente decoder

component display_7_segmentos is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;
---------------------------------------------------


--Sinais para a multiplexa��o do resultado
signal s_result_soma : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');
signal s_result_sub : STD_LOGIC_VECTOR (3 downto 0):= (others => '0');

--Sinais para a multiplexa��o do carry out
signal s_carry_soma : STD_LOGIC := '0';
signal s_carry_sub : STD_LOGIC := '0';

-- Sinais para uso geral
signal resultado : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal carry : STD_LOGIC := '0';


begin
----Exercicio 6---------------------------------------------------------------


-- Observe que a l�gica � passar as entradas normalmente para os componentes
-- e ent�o multiplexar os sinais de sa�da conforme o valor na seletora.
-- O carry in dos dois blocos � aterrado pois n�o ser�o cascateados
BLOCO_SOMADOR: Somador_4BITS port map (A => A, B => B,Cout => s_carry_soma, Cin => '0', S => s_result_soma);
BLOCO_SUBTRATOR: Subtrator_4BITS port map (A => A, B => B,Cout => s_carry_sub, Cin => '0', S => s_result_sub);

-- Aqui ser� feito a multiplexa��o do resultado conforme o valor da seletora
with seletora select resultado
  <= s_result_soma when '1',
     s_result_sub when '0',
     (others => 'X') when others; -- Boa prat�ca de descri��o de hardware 

-- Aqui ser� feito a multiplexa��o do carry conforme o valor da seletora
with seletora select carry
  <= s_carry_soma when '1',
     s_carry_sub when '0',
     'X' when others; -- Boa prat�ca de descri��o de hardware 

led(3 downto 0) <= resultado ; -- Os 4 primeiros leds rescebem o valor do resultado da opera��o
led(4) <= carry ; -- O quarto led recebe o valor do carry da opera��o

------------------------------------------------------------------

--------- Continua��o do exercicio 6--------------------------------
-- Aqui basta efetuarmos o port map dos leds na entrada do decoder
decoder_7_segmentos: display_7_segmentos port map(sw => resultado, seg => seg);

--o carry ultlizando o dp do display
dp <= carry;

-- Ligando somente um display e desligando 3 (lembre-se que nivel l�gico alto apaga os displays)
-- Provavalemente o VIVADO ir� gerar um warning informado que os valores de "an" s�o constantes
-- o que n�o acerretar� nenhum problema.
an <= "0111";

-----------------------------------------------------------

end Behavioral;
