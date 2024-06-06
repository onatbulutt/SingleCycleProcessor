----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 16:16:47
-- Design Name: 
-- Module Name: register_file_tb - Behavioral
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

entity register_file_tb is
end;

architecture bench of register_file_tb is

  component register_file
    port (
      clk   : in  std_logic;       
      we3  : in  std_logic;           
      ra1    : in  std_logic_vector(4 downto 0);  
      ra2    : in  std_logic_vector(4 downto 0);  
      wa3    : in  std_logic_vector(4 downto 0);  
      wd3: in  std_logic_vector(31 downto 0); 
      rd1     : out std_logic_vector(31 downto 0); 
      rd2    : out std_logic_vector(31 downto 0)  
    );
  end component;

  signal clk: std_logic;
  signal we3: std_logic;
  signal ra1: std_logic_vector(4 downto 0);
  signal ra2: std_logic_vector(4 downto 0);
  signal wa3: std_logic_vector(4 downto 0);
  signal wd3: std_logic_vector(31 downto 0);
  signal rd1: std_logic_vector(31 downto 0);
  signal rd2: std_logic_vector(31 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: register_file port map ( clk => clk,
                                we3 => we3,
                                ra1 => ra1,
                                ra2 => ra2,
                                wa3 => wa3,
                                wd3 => wd3,
                                rd1 => rd1,
                                rd2 => rd2 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    we3<='1';
    wa3 <= "00001";
    wd3 <= x"aaaaaaaa";
    wait for 10 ns;
    
    ra1 <= "00011";
    wait for 10 ns;
    
    ra2 <= "00001";
    wait for 10 ns;
    
    ra2 <= "00011";
    wait for 10 ns;
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;