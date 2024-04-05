----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2022 10:50:38 AM
-- Design Name: 
-- Module Name: Two2One2 - Behavioral
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

entity Two2One2 is
    Port ( I0   : in  STD_LOGIC;
           I1   : in  STD_LOGIC;
           SEL : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end Two2One2;

architecture Behavioral of Two2One2 is

begin
with SEL select
    Y <= I0 when '0',
        I1 when '1',
        '0' when others;

end Behavioral;
