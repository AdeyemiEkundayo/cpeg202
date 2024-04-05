----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 02:59:15 PM
-- Design Name: 
-- Module Name: ssd_Watch - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssd_Watch is
    Port ( sw : in STD_LOGIC_VECTOR(3 downto 0);
           seg : out STD_LOGIC_VECTOR(6 downto 0);
           cat : out STD_LOGIC);
end ssd_Watch;

architecture Behavioral of ssd_Watch is

begin
cat <= '0';

with sw select
    seg <= "1111110" when "0000",
           "0110000" when "0001", 
           "1101101" when "0010", 
           "1111001" when "0011", 
           "0110011" when "0100", 
           "1011011" when "0101", 
           "1011111" when "0110", 
           "1110000" when "0111", 
           "1111111" when "1000",
           "1111011" when "1001",    
           "1110111" when "1010", 
           "0011111" when "1011",
           "1001110" when "1100", 
           "0111101" when "1101", 
           "1001111" when "1110",
           "1000111" when "1111", 
           "0000000" when others;

end Behavioral;
