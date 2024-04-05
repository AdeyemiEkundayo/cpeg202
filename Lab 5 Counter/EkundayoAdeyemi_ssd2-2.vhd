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
-- Description: This VHDL module is designed to drive a 7-segment display based on
--              a 4-bit binary input (sw). It supports displaying hexadecimal digits
--              (0-9, A-F). The 'cat' output is used to control the common cathode/anode
--              of the display.
-- 
-- Dependencies: Requires IEEE.STD_LOGIC_1164.ALL for the STD_LOGIC types.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE; -- Standard library
use IEEE.STD_LOGIC_1164.ALL; -- Use standard logic types

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EkundayoAdeyemi_ssd2 is
    Port ( sw : in STD_LOGIC_VECTOR(3 downto 0); -- 4-bit binary input to select the digit to display
           seg : out STD_LOGIC_VECTOR(6 downto 0); -- 7-bit output to control the segments of the display
           cat : out STD_LOGIC); -- Output to control the common cathode/anode of the display
end EkundayoAdeyemi_ssd2;

architecture Behavioral of EkundayoAdeyemi_ssd2 is

begin

cat <= '0'; -- Initialize 'cat' to '0'. Adjust based on your display type (common cathode/anode).

-- The following process maps the 4-bit input 'sw' to the corresponding 7-segment display encoding.
with sw select
    seg <= "1111110" when "0000", --0
           "0110000" when "0001", --1
           "1101101" when "0010", --2
           "1111001" when "0011", --3
           "0110011" when "0100", --4
           "1011011" when "0101", --5
           "1011111" when "0110", --6
           "1110000" when "0111", --7
           "1111111" when "1000", --8
           "1111011" when "1001", --9     
           "1110111" when "1010", --A(10)
           "0011111" when "1011", --B(11)
           "1001110" when "1100", --C(12)
           "0111101" when "1101", --D(13)
           "1001111" when "1110", --E(14)
           "1000111" when others; -- Default case for any other input (F/15)
end Behavioral;
