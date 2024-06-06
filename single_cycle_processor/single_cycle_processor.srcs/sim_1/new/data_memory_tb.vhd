----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 16:26:00
-- Design Name: 
-- Module Name: data_memory_tb - Behavioral
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

entity data_memory_tb is
end;

architecture bench of data_memory_tb is

  component data_memory
   Port ( 
      clk : in std_logic;
      we : in std_logic;
      a: in std_logic_vector(31 downto 0);
      wd : in std_logic_vector(31 downto 0);
      rd: out std_logic_vector(31 downto 0)
   );
  end component;

  signal clk: std_logic;
  signal we: std_logic;
  signal a: std_logic_vector(31 downto 0);
  signal wd: std_logic_vector(31 downto 0);
  signal rd: std_logic_vector(31 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: data_memory port map ( clk => clk,
                              we  => we,
                              a   => a,
                              wd  => wd,
                              rd  => rd );

  stimulus: process
  begin
  
    -- Put initialisation code here
    we <= '0';
    a <= x"00000001";
    wd <= x"aaaaaaaa";
    wait for 10 ns;
    
    wait for 10 ns;
    
    we <= '1';
    a <= x"00000001";
    wd <= x"aaaaaaaa";
    wait for 10 ns;
    
    we <= '0';
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