----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2024 13:06:07
-- Design Name: 
-- Module Name: ALUControl_tb - Behavioral
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

entity ALUControl_tb is
end;

architecture bench of ALUControl_tb is

  component ALUControl
    Port ( 
    funct : in std_logic_vector(5 downto 0);
    aluop : in std_logic_vector(1 downto 0);
    alucontrol2 : out std_logic_vector(2 downto 0)
    );
  end component;

  signal funct: std_logic_vector(5 downto 0);
  signal aluop: std_logic_vector(1 downto 0);
  signal alucontrol2: std_logic_vector(2 downto 0) ;

begin

  uut: ALUControl port map ( funct      => funct,
                             aluop      => aluop,
                             alucontrol2 => alucontrol2 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    aluop <= "00";
    funct <= "011000";
    wait for 100 ns;
    
    aluop <= "01";
    funct <= "111000";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "100000";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "100010";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "100100";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "100101";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "101010";
    wait for 100 ns;
    
    aluop <= "10";
    funct <= "101011";
    wait for 100 ns;
    
    aluop <= "00";
    funct <= "011000";
    wait for 100 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;