----------------------------------------------------------------------------------
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- Description: VHDL code for addsub_design_wrapper, a wrapper for the addsub_design component.
--              This wrapper facilitates the addition and subtraction operations.
--              It is designed to be synthesized with Xilinx Vivado tools.
----------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon May  9 20:40:39 2022
-- Host        : ECEG-DISUITE-00 running 64-bit major release  (build 9200)
-- Command     : generate_target addsub_design_wrapper.bd
-- Design      : addsub_design_wrapper
-- Purpose     : IP block netlist
----------------------------------------------------------------------------------

library IEEE; -- Standard library
use IEEE.STD_LOGIC_1164.ALL; -- Use the standard logic package

library UNISIM; -- Library for Xilinx primitive components
use UNISIM.VCOMPONENTS.ALL; -- Use all components from the UNISIM library

-- Entity declaration for addsub_design_wrapper
entity addsub_design_wrapper is
  port (
    A0 : in STD_LOGIC; -- Input bit 0 of operand A
    A1 : in STD_LOGIC; -- Input bit 1 of operand A
    A2 : in STD_LOGIC; -- Input bit 2 of operand A
    A3 : in STD_LOGIC; -- Input bit 3 of operand A
    B0 : in STD_LOGIC; -- Input bit 0 of operand B
    B1 : in STD_LOGIC; -- Input bit 1 of operand B
    B2 : in STD_LOGIC; -- Input bit 2 of operand B
    B3 : in STD_LOGIC; -- Input bit 3 of operand B
    Cin : in STD_LOGIC; -- Carry input
    Cout : out STD_LOGIC; -- Carry output
    S0 : out STD_LOGIC; -- Sum bit 0 (or difference if subtraction)
    S1 : out STD_LOGIC; -- Sum bit 1 (or difference if subtraction)
    S2 : out STD_LOGIC; -- Sum bit 2 (or difference if subtraction)
    S3 : out STD_LOGIC  -- Sum bit 3 (or difference if subtraction)
  );
end addsub_design_wrapper;

-- Architecture declaration of addsub_design_wrapper
architecture STRUCTURE of addsub_design_wrapper is
  -- Declaration of the addsub_design component
  component addsub_design is
  port (
    A0 : in STD_LOGIC;
    B0 : in STD_LOGIC;
    A1 : in STD_LOGIC;
    B1 : in STD_LOGIC;
    A2 : in STD_LOGIC;
    B2 : in STD_LOGIC;
    A3 : in STD_LOGIC;
    B3 : in STD_LOGIC;
    S0 : out STD_LOGIC;
    S1 : out STD_LOGIC;
    S2 : out STD_LOGIC;
    S3 : out STD_LOGIC;
    Cin : in STD_LOGIC;
    Cout : out STD_LOGIC
  );
  end component addsub_design;
begin
  -- Instantiation of addsub_design component with port mapping
  addsub_design_i: component addsub_design
     port map (
      A0 => A0, -- Connect A0 input to A0 of addsub_design
      A1 => A1, -- Connect A1 input to A1 of addsub_design
      A2 => A2, -- Connect A2 input to A2 of addsub_design
      A3 => A3, -- Connect A3 input to A3 of addsub_design
      B0 => B0, -- Connect B0 input to B0 of addsub_design
      B1 => B1, -- Connect B1 input to B1 of addsub_design
      B2 => B2, -- Connect B2 input to B2 of addsub_design
      B3 => B3, -- Connect B3 input to B3 of addsub_design
      Cin => Cin, -- Connect Cin input to Cin of addsub_design
      Cout => Cout, -- Connect Cout output to Cout of addsub_design
      S0 => S0, -- Connect S0 output to S0 of addsub_design
      S1 => S1, -- Connect S1 output to S1 of addsub_design
      S2 => S2, -- Connect S2 output to S2 of addsub_design
      S3 => S3  -- Connect S3 output to S3 of addsub_design
    );
end STRUCTURE;
