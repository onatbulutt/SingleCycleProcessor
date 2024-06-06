----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 16:06:33
-- Design Name: 
-- Module Name: tb_adder - Behavioral
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

entity tb_adder is
end;

architecture bench of tb_adder is

  component adder
    Port ( 
     a: in std_logic_vector(31 downto 0);
     b: in std_logic_vector(31 downto 0);
     y: out std_logic_vector(31 downto 0)
    );
  end component;

  signal a: std_logic_vector(31 downto 0);
  signal b: std_logic_vector(31 downto 0);
  signal y: std_logic_vector(31 downto 0) ;

begin

  uut: adder port map ( a => a,
                        b => b,
                        y => y );

  stimulus: process
  begin
  
    -- Put initialisation code here
    a <= x"00000001";
    b <= x"f0000000";
    wait for 10 ns;
    
    
    -- Put test bench stimulus code here

    wait;
  end process;


end;