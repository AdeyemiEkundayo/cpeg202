----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2022 10:49:22 AM
-- Design Name: 
-- Module Name: ekundayoAdeyemi_lab2 - Behavioral
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

--library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ekundayoAdeyemi_lab2 is
    Port ( sw3: in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           led2 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led0 : out STD_LOGIC);
end ekundayoAdeyemi_lab2;

architecture Behavioral of ekundayoAdeyemi_lab2 is

begin
    led0 <= sw0 and sw1;
    led1 <= not sw1 and sw2;
	--led2 <= (not sw0 and sw1) and (sw2 and not sw3);
    led2 <= (not sw0 and not sw2) and (not sw0 and sw1) and (sw2 and not sw3) and not sw2 and (sw0 and sw1 and sw2 and sw3);

end Behavioral;
