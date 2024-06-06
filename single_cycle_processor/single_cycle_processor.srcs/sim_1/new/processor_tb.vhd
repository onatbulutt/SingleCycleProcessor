----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 21:10:21
-- Design Name: 
-- Module Name: processor_tb - Behavioral
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

entity processor_tb is
end;

architecture bench of processor_tb is

  component processor
    Port ( 
    CLOCK : in std_logic;
    RST   : in std_logic
    );
  end component;

  signal CLOCK: std_logic :='0';
  signal RST: std_logic :='0';

  constant CLK_period : time := 10 ns;
begin

  uut: processor port map ( CLOCK => CLOCK,
                            RST   => RST );


   CLK_process :process
   begin
		CLOCK <= '0';
		wait for CLK_period/2;
		CLOCK <= '1';
		wait for CLK_period/2;
   end process;

  stimulus: process
  begin
  
    -- Put initialisation code here
        RST <= '1';
		wait for 10 ns;	
		RST <= '0';
		wait for 100 ns;

      wait for CLK_period*10;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
  