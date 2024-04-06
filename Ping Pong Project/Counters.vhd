----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2022 01:27:46 PM
-- Design Name: 
-- Module Name: Counters - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counters is
    Port ( clk, reset: in STD_LOGIC;
           state: in std_logic_vector(3 downto 0);
           scor1, scor2 : out std_logic_vector(3 downto 0));
end Counters;

architecture Behavioral of Counters is
    signal player1 : std_logic_vector(3 downto 0) := "0000";
    signal player2 : std_logic_vector(3 downto 0) := "0000";

begin
    process(clk, reset, state)
        begin
            if(reset = '1') then
                player1 <= "0000";
                player2 <= "0000";
            elsif(rising_edge(clk)) then
                if (player1 = "1010" or player2 = "1010") then
                    player1 <= "0000";
                    player2 <= "0000";
                 elsif(state = "0010") then
                    player1<=std_logic_vector(unsigned(player1) + 1);
                 elsif(state = "0101") then
                    player2<=std_logic_vector(unsigned(player2) + 1);
            end if;
        end if;
    end process;
    scor1 <= player1;
    scor2 <= player2;
end Behavioral;