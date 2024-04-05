----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 02:09:07 PM
-- Design Name: 
-- Module Name: Stopwatch - Behavioral
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

entity Stopwatch is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           stop : in std_logic;
           start : in STD_LOGIC;
           seg : out std_logic_vector(6 downto 0);
           cat : out STD_LOGIC);
end Stopwatch;

architecture Behavioral of Stopwatch is

    component Stopwatch_State is --Component 1
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               stop : in STD_LOGIC;
               start : in STD_LOGIC;
               clkState : out STD_LOGIC);
    end component; 
    
    component Clockdiv is --Component 2
        Port ( clk_in : in STD_LOGIC;
               reset : in STD_LOGIC;
               sw : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component; 

    component Counter --Component 3
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               digin : out STD_LOGIC_VECTOR(3 downto 0);
               digout : out STD_LOGIC_VECTOR(3 downto 0));      
    end component;
    
    component clk60Hz is --Component 4
        Port ( clk_in : in STD_LOGIC;
               reset : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component; 
    
    component Two2One is --Component 5
     Port ( I0   : in  STD_LOGIC_VECTOR (3 downto 0);
           I1   : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC;
           Y   : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component ssd_Watch is --Component 6
        Port ( sw : in STD_LOGIC_VECTOR(3 downto 0);
               seg : out STD_LOGIC_VECTOR(6 downto 0)
               );
    end component;
    
signal sigCount : std_logic_vector (3 downto 0) := "0000";
signal sigOut : std_logic;
signal sigDivout : std_logic;
signal sigOut1 : std_logic_vector (3 downto 0);
signal sigOut2 : std_logic_vector (3 downto 0);
signal sig60Hz : std_logic;
 
begin
 
    fsm : Stopwatch_State port map(
        clk => clk,
        rst => reset,
        start => start,
        stop => stop,
        clkState => sigOut
        );
        
     div : Clockdiv port map(
        clk_in => clk,
        reset => reset,
        sw => sw,
        clk_out => sigDivout
        );
        
     ctr : Counter port map(
        clk  => sigDivout,
        rst  => reset,
        digin => sigOut1,
        digout => sigOut2
        );
        
     sixtyHz : clk60Hz port map(
        clk_in => clk,
        reset => reset,
        clk_out => cat
        );
        
     mux : Two2One port map(
        I0 => sigOut1,
        I1 => sigOut2,
        SEL => sig60Hz,
        Y => sigCount
        );
     
     ssd_c : ssd_Watch port map(
        sw => sigCount,
        seg => seg
        );
        
      cat <= sig60Hz;


end Behavioral;
