----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 21:12:00
-- Design Name: 
-- Module Name: SL2 - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SL2 is
    Port (
        a  : in  std_logic_vector(31 downto 0);  -- Input 32-bit vector
        y : out std_logic_vector(31 downto 0)   -- Output 32-bit vector
    );
end SL2;

architecture Behavioral of SL2 is
begin
    -- Perform a 2-bit left shift on the input data
    y <= std_logic_vector(shift_left(unsigned(a), 2));
end Behavioral;