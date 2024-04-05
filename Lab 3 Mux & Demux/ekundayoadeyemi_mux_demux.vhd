----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 11:24:14 AM
-- Design Name: 
-- Module Name: ekundayoadeyemi_mux_demux - Behavioral
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

-- Entity declaration for a multiplexer-demultiplexer (mux-demux) system named ekundayoadeyemi_mux_demux.
-- This system includes inputs I0 to I3, a 2-bit selector 'sel', and outputs Y0 to Y3.
entity ekundayoadeyemi_mux_demux is
    Port ( I0 : in STD_LOGIC;  -- Input signal 0
           I1 : in STD_LOGIC;  -- Input signal 1
           I2 : in STD_LOGIC;  -- Input signal 2
           I3 : in STD_LOGIC;  -- Input signal 3
           sel : in STD_LOGIC_VECTOR(1 downto 0);  -- 2-bit selector to choose the input
           Y0 : out STD_LOGIC;  -- Output signal 0
           Y1 : out STD_LOGIC;  -- Output signal 1
           Y2 : out STD_LOGIC;  -- Output signal 2
           Y3 : out STD_LOGIC); -- Output signal 3
end ekundayoadeyemi_mux_demux;

-- Architecture declaration of the mux-demux system.
architecture Behavioral of ekundayoadeyemi_mux_demux is

-- Component declaration for a 2-to-1 multiplexer named ekundayoadeyemi_mux2.
component ekundayoadeyemi_mux2 port (
     I0 : in STD_LOGIC;  -- Input signal 0
     I1 : in STD_LOGIC;  -- Input signal 1
     I2 : in STD_LOGIC;  -- Input signal 2
     I3 : in STD_LOGIC;  -- Input signal 3
     sel : in STD_LOGIC_VECTOR(1 downto 0);  -- 2-bit selector to choose the input
     Y : out STD_LOGIC);  -- Output signal of the multiplexer
end component; 

-- Component declaration for a 1-to-4 demultiplexer named ekundayoadeyemi_demux.
component ekundayoadeyemi_demux port (
           I : in STD_LOGIC;  -- Input signal of the demultiplexer
           sel : in STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit selector to choose the output path
           Y0 : out STD_LOGIC;  -- Output signal 0
           Y1 : out STD_LOGIC;  -- Output signal 1
           Y2 : out STD_LOGIC;  -- Output signal 2
           Y3 : out STD_LOGIC); -- Output signal 3
end component; 

signal internal_signal : std_logic;  -- Internal signal to connect the multiplexer output to the demultiplexer input

begin

-- Instantiation of the multiplexer component with connections to inputs, selector, and the internal signal.
mux: ekundayoadeyemi_mux2 port map (I0 => I0, I1 => I1, I2 => I2, I3 => I3, Y => internal_signal, sel => sel);

-- Instantiation of the demultiplexer component with connections from the internal signal, selector, and outputs.
demux: ekundayoadeyemi_demux port map (I => internal_signal, sel => sel, Y0 => Y0, Y1 => Y1, Y2 => Y2, Y3 => Y3);

end Behavioral;
