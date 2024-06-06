----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 19:53:27
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
end;

architecture bench of ALU_tb is

  component ALU
    Port ( 
    a : in std_logic_vector(31 downto 0);
    b : in std_logic_vector(31 downto 0);
    alucontrol : in std_logic_vector(2 downto 0);
    zero : out std_logic;
    result : out std_logic_vector(31 downto 0)
    );
  end component;

  signal a: std_logic_vector(31 downto 0);
  signal b: std_logic_vector(31 downto 0);
  signal alucontrol: std_logic_vector(2 downto 0);
  signal zero: std_logic;
  signal result: std_logic_vector(31 downto 0) ;

begin

  uut: ALU port map ( a          => a,
                      b          => b,
                      alucontrol => alucontrol,
                      zero       => zero,
                      result     => result );

  stimulus: process
  begin
  
    -- Put initialisation code here
    alucontrol <= "000";
    a <= x"00000001";
    b <= x"00000010";
    wait for 100 ns;
    
    alucontrol <= "001";
    wait for 100 ns;
    
    alucontrol <= "010";
    a <= x"00000011";
    b <= x"00000010";
    wait for 100 ns;
    
    alucontrol <= "011";
    wait for 100 ns;
    
    alucontrol <= "100";
    wait for 100 ns;
    
    alucontrol <= "101";
    wait for 100 ns;
    
    alucontrol <= "110";
    a <= x"00010000";
    b <= x"00000010";
    wait for 100 ns;
    
    alucontrol <= "111";
    a <= x"10010010";
    b <= x"00010010";
    wait for 100 ns;
    
    a <= x"01010010";
    b <= x"10010010";
    wait for 100 ns;
    
    a <= x"01010010";
    b <= x"01010010";
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;

