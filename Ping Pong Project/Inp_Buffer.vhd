----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2022 01:22:51 PM
-- Design Name: 
-- Module Name: Inp_Buffer - Behavioral
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

entity Inp_Buffer is
    Port ( clk : in STD_LOGIC;
           game_clk: in STD_LOGIC;
           reset_in : in STD_LOGIC;
           p1, p2 : in STD_LOGIC;
           p1buf, p2buf, reset_out : out STD_LOGIC);
end Inp_Buffer;

architecture Behavioral of Inp_Buffer is

   signal buffOut : std_logic_vector(2 downto 0) := "000";

begin

	p1buf        <= buffOut(0);
	p2buf        <= buffOut(1);
	reset_out <= buffOut(2);

	clocking : process (clk, game_clk, p1, p2, reset_in)
	begin
		if (rising_edge(clk)) then
			if (game_clk = '1') then --reset buffers when game clocks
				buffOut(0) <= '0';
				buffOut(1) <= '0';
				buffOut(2) <= '0';
			elsif (p1 = '1') then
				buffOut(0) <= '1';
			elsif (p2 = '1') then
				buffOut(1) <= '1';
			elsif (reset_in = '1') then
				buffOut(2) <= '1';
			end if;
		end if;
		end process;

end Behavioral;
