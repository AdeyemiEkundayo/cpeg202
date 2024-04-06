----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2022 10:21:39 AM
-- Design Name: 
-- Module Name: pong_main - Behavioral
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

entity pong_main is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           sw : in std_logic;
           cat : out STD_LOGIC;
           seg : out std_logic_vector(6 downto 0);
           led : out std_logic_vector(7 downto 0));
end pong_main;

architecture Behavioral of pong_main is

-- comp 1: STATE MACHINE
component pong_stateMachine is
     Port ( clk, reset, p1buffer, p2buffer : in std_logic;
           p1score,p2score : out std_logic_vector(3 downto 0);
           led : out std_logic_vector(2 downto 0));
end component;

-- comp 2: LED
component pong_led is
    Port ( led_array : in std_logic_vector(2 downto 0);
           led_go : out std_logic_vector(7 downto 0));
end component;

-- comp 3: SSD
component ssd_pong is
    Port ( data : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0));
end component;

-- comp 4 : CLOCK DIVIDER
component clk_div is
    port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

-- comp 5 : MUX 4BIT
component mux4bit is
    Port ( I0   : in  STD_LOGIC_VECTOR (3 downto 0);
           I1   : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
           Y   : out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- comp 6 HZ60 COUNTER
component Clk60Hz is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

-- comp 7 BUFFER
component Inp_Buffer is  
    Port ( clk, game_clk, reset_in, p1, p2 : in STD_LOGIC;
           p1buf, p2buf, reset_out : out STD_LOGIC);
end component;



    signal p1buf : std_logic;
    signal p2buf : std_logic;
    signal resetbuf : std_logic; 
    signal game_clk : std_logic;
    signal hz60clked : std_logic;
    signal states : std_logic_vector(3 downto 0);
    signal leds : std_logic_vector(2 downto 0);
    signal p1scor : std_logic_vector(3 downto 0);
    signal p2scor : std_logic_vector(3 downto 0);
    signal muxer : std_logic_vector(3 downto 0);
    
begin

divider : clk_div port map (
    clk_in => clk,
    reset => reset,
    sw => sw,
    clk_out => game_clk
    );
    
hz60o : Clk60Hz port map (
    clk_in => clk,
    reset => reset,
    clk_out => hz60clked
    );

stateMachine : pong_stateMachine port map (
    clk => game_clk,
    reset => resetbuf,
    led => leds,
    p1buffer => p1buf,
    p2buffer => p2buf,
    p1score => p1scor,
    p2score => p2scor
    );

mux : mux4bit port map (
    I0 => p1scor,
    I1 => p2scor,
    sel => hz60clked,
    Y => muxer
    );

ssd : ssd_pong port map (
    data => muxer,
    seg => seg
    );
    
led_disp : pong_led port map (
    led_array => leds,
    led_go => led
    );

buffers : Inp_Buffer port map (
    clk => clk,
    game_clk => game_clk, 
    reset_in => reset,
    p1 => p1,
    p2 => p2,
    p1buf => p1buf,
    p2buf => p2buf,
    reset_out => resetbuf
    );

    cat <= hz60clked;

end Behavioral;
