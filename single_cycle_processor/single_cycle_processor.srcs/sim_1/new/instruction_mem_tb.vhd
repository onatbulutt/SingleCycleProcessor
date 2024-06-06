----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2024 15:39:58
-- Design Name: 
-- Module Name: instruction_mem_tb - Behavioral
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

entity instruction_mem_tb is
end;

architecture bench of instruction_mem_tb is

  component instruction_mem
    Port ( 
    a : in std_logic_vector(5 downto 0);
    rd: out std_logic_vector(31 downto 0) 
    );
  end component;

  signal a: std_logic_vector(5 downto 0);
  signal rd: std_logic_vector(31 downto 0) ;

begin

  uut: instruction_mem port map ( a  => a,
                                  rd => rd );

  stimulus: process
  begin
  
    -- Put initialisation code here
    a <= "000001";
    wait for 100 ns;
       
    a <= "000011";
    wait for 100 ns;
    
    a <= "000100";
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
  