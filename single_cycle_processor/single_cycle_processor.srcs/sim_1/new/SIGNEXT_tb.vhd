----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 21:06:55
-- Design Name: 
-- Module Name: SIGNEXT_tb - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity SIGNEXT_tb is
end;

architecture bench of SIGNEXT_tb is

  component SIGNEXT
    Port ( 
    a : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(31 downto 0)
    );
  end component;

  signal a: std_logic_vector(15 downto 0);
  signal y: std_logic_vector(31 downto 0) ;

begin

  uut: SIGNEXT port map ( a => a,
                          y => y );

  stimulus: process
  begin
  
    -- Put initialisation code here
       a <= x"0001";
       wait for 100 ns;
       
       a <= x"f000";
       wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;