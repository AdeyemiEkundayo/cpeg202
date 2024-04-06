----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2022 10:27:07 AM
-- Design Name: 
-- Module Name: ssd_pong - Behavioral
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

entity ssd_pong is
    Port ( data : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0)
           );
end ssd_pong;

architecture Behavioral of ssd_pong is
begin
    with data select seg <=
        "1111110" when "0000",
        "0110000" when "0001",
        "1101101" when "0010",
        "1111001" when "0011",
        "0110011" when "0100",
        "1011011" when "0101",
        "1011111" when "0110",
        "1110000" when "0111",
        "1111111" when "1000",
        "1110011" when "1001",
        "1110111" when "1010",
        "0011111" when "1011",
        "1001110" when "1100",
        "0111101" when "1101",
        "1001111" when "1110",
        "1000111" when others;

end Behavioral;
