library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std .all;
use ieee.std_logic_unsigned.all;


entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
component top is
    Port(
        clk  : in std_logic;
        reset : in std_logic;
        we : in std_logic_vector(7 downto 0);
        wy : out std_logic_vector(3 downto 0)
        ); 
end component ;

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal we : std_logic_vector(7 downto 0) :=(others => '0');
signal wy : std_logic_vector(3 downto 0) :=(others => '0');

constant clk_period : time := 10 ns;
begin


    i_top : top
    Port map (
        clk => clk,
        reset => reset,        
        we => we,   
        wy => wy);
        
     -- Definicja zegara
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
        
    Symulacja: process
    begin 
        reset <= '1';
        wait for clk_period * 2;
        reset <= '0';
--        sqrt(16)
--        we <= "00010000";
--        wait for clk_period * 21;

--        sqrt(25)
--        we <= "00011001";
--        wait for clk_period * 21;

--        sqrt(4)
--        we <= "00000100";
--        wait for clk_period * 21;

--        sqrt(9)     
--        we <= "00001001";
--        wait for clk_period * 21;

--        sqrt(36)
--        we <= "00100100";        
--        wait for clk_period * 21;

--        sqrt(49)
--        we <= "00110001";
--        wait for clk_period * 21;

--        sqrt(64)
--        we <= "01000000";
--        wait for clk_period * 21;

--        sqrt(81)
--        we <= "01010001";
--        wait for clk_period * 21; 

--        sqrt(121) tak
--        we <= "01111001";
--        wait for clk_period * 21;
 
--        sqrt(144)
--        we <= "10010000";
--        wait for clk_period * 21;

--        sqrt(169)
--        we <= "10101001";
--        wait for clk_period * 21;

--        sqrt(196)
--        we <= "11000100";
--        wait for clk_period * 21;

--        sqrt(225)
--        we <= "11100001";
--        wait for clk_period * 21; 

--        sqrt(14,0625)
--        we <= "11100001";
--        wait for clk_period * 21;

--        sqrt(12,0)
--        we <= "11000000";
--        wait for clk_period * 21; 

--        sqrt(1,5)
--        we <= "00011000";
--        wait for clk_period * 21;



   
        assert false severity failure;
    end process;

end Behavioral;
