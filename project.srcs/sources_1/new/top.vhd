library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std .all;
use ieee.std_logic_unsigned.all;



entity top is 
    Port(
    clk, reset : in std_logic;
    we : in std_logic_vector(7 downto 0);
    wy : out std_logic_vector(3 downto 0)); 
end top;

architecture Behavioral of top is

signal pierwsze2bity : std_logic_vector(1 downto 0) :=(others => '0');
signal pierwsze4bity : std_logic_vector(3 downto 0):=(others => '0');
signal pierwsze6bity : std_logic_vector(5 downto 0):=(others => '0');
signal pierwsze8bity : std_logic_vector(7 downto 0):=(others => '0');
signal obliczenia1 : std_logic_vector(1 downto 0):=(others => '0');
signal obliczenia2 : std_logic_vector(2 downto 0):=(others => '0');
signal obliczenia3 : std_logic_vector(3 downto 0):=(others => '0');
signal mnozenie1 : std_logic_vector(3 downto 0):=(others => '0');
signal mnozenie2 : std_logic_vector(5 downto 0):=(others => '0');
signal mnozenie3 : std_logic_vector(7 downto 0):=(others => '0');
signal wynikrejestr : std_logic_vector(3 downto 0):=(others => '0');


begin
square : process (clk, reset, we)
begin
    if (reset = '1') then
        wy <= "0000";
    elsif (clk'Event and clk = '1') then
            pierwsze2bity <= we(7 downto 6);
            pierwsze4bity <= we(7 downto 4);
            pierwsze6bity <= we(7 downto 2);
            pierwsze8bity <= we(7 downto 0);
            if pierwsze2bity = "00" then
                wy(3) <= '0';
                wynikrejestr(3) <= '0';
                obliczenia1 <= "01";
            elsif pierwsze2bity = "01" or pierwsze2bity = "10" or pierwsze2bity = "11" then
                wy(3) <= '1';
                wynikrejestr(3) <= '1';
                obliczenia1 <= "11";
            end if;
            mnozenie1 <= obliczenia1*obliczenia1;
            
            
            if mnozenie1 > pierwsze4bity then
                wy(2) <= '0';
                wynikrejestr(2) <= '0';
                obliczenia2 <= wynikrejestr(3 downto 2) & ('1');
            else
                wy(2) <= '1';
                wynikrejestr(2) <= '1';
                obliczenia2 <= wynikrejestr(3 downto 2) & ('1');
            end if;
          
            mnozenie2 <= obliczenia2*obliczenia2;
            
            if mnozenie2 > pierwsze6bity then
                wy(1) <= '0';
                wynikrejestr(1) <= '0';
                obliczenia3 <= wynikrejestr(3 downto 1) & ('1');
            else
                wy(1) <= '1';
                wynikrejestr(1) <= '1';
                obliczenia3 <= wynikrejestr(3 downto 1) & ('1');
            end if;
            
            mnozenie3 <= obliczenia3*obliczenia3;
            if mnozenie3 > pierwsze8bity then
                wy(0) <= '0';
            else
                wy(0) <= '1';
            end if;
        end if;
end process;
end Behavioral;
