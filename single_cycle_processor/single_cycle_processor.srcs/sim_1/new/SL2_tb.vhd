----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 21:13:56
-- Design Name: 
-- Module Name: SL2_tb - Behavioral
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

entity SL2_tb is
end;

architecture bench of SL2_tb is

  component SL2
      Port (
          a  : in  std_logic_vector(31 downto 0);
          y : out std_logic_vector(31 downto 0)
      );
  end component;

  signal a: std_logic_vector(31 downto 0);
  signal y: std_logic_vector(31 downto 0) ;

begin

  uut: SL2 port map ( a => a,
                      y => y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    a <= x"f0000001";
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;