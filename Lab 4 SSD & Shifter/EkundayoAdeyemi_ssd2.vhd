----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2022 01:25:25 PM
-- Design Name: 
-- Module Name: EkundayoAdeyemi_ssd2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a 7-segment display decoder that takes a 4-bit binary input
--              and outputs the corresponding value on a 7-segment display. It supports
--              hexadecimal values (0-9, A-F).
-- 
-- Dependencies: Requires the IEEE STD_LOGIC_1164 library for the STD_LOGIC types.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE; -- Standard library
use IEEE.STD_LOGIC_1164.ALL; -- Use the standard logic package for digital circuit design

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EkundayoAdeyemi_ssd2 is
    Port ( sw : in STD_LOGIC_VECTOR(3 downto 0); -- Input switch: 4-bit binary input
           seg : out STD_LOGIC_VECTOR(6 downto 0); -- Output segment: Controls the 7 segments of the display
           cat : out STD_LOGIC); -- Output cathode: Common cathode for the 7-segment display
end EkundayoAdeyemi_ssd2;

architecture Behavioral of EkundayoAdeyemi_ssd2 is

begin

cat <= '0'; -- Set the common cathode to '0' (active low)

-- The main logic to determine which segments should be lit based on the input switch value
with sw select
    seg <= "1111110" when "0000", --0: All segments except for the middle one
           "0110000" when "0001", --1: Only the top right and bottom right segments
           "1101101" when "0010", --2: All segments except for the top right and bottom left
           "1111001" when "0011", --3: All segments except for the top left and bottom left
           "0110011" when "0100", --4: Middle, top right, bottom right, and top left segments
           "1011011" when "0101", --5: All segments except for the top right and bottom right
           "1011111" when "0110", --6: All segments except for the top right
           "1110000" when "0111", --7: Top and both right segments
           "1111111" when "1000", --8: All segments lit
           "1111011" when "1001", --9: All segments except for the bottom left
           "1110111" when "1010", --A(10): All segments except for the bottom segment
           "0011111" when "1011", --B(11): All segments on the left plus the middle, bottom, and bottom right
           "1001110" when "1100", --C(12): Top, bottom, and both left segments
           "0111101" when "1101", --D(13): All segments on the right plus the top, middle, and bottom
           "1001111" when "1110", --E(14): All segments except for the top right
           "1000111" when others; -- Default case: Represents F (15) with all segments except for the top and bottom right
end Behavioral;
