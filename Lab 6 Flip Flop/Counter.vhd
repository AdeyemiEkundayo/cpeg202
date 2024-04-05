----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 02:49:26 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           digin : out std_logic_vector(3 downto 0);
           digout : out std_logic_vector(3 downto 0));
end Counter;

architecture Behavioral of Counter is

signal digit_temp : std_logic_vector(3 downto 0) := "0000";
signal digit_temp2 : std_logic_vector(3 downto 0) := "0000";

begin process (clk, rst)
    begin 
        if (rst = '1') then
            digit_temp <= "0000";
            digit_temp2 <= "0000";
        elsif (rising_edge(clk)) then
            if digit_temp = "1001" then
                digit_temp <= "0000";
                if digit_temp2 = "1001" then
                    digit_temp2 <= "0000";
                else
                digit_temp2 <= digit_temp2 + 1;
            end if;
            else
                digit_temp <= digit_temp + 1;
           end if;
        end if;
    end process; 
           
            digin <= digit_temp;
            digout <= digit_temp2;

end Behavioral;
