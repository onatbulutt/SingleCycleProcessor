----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 21:20:13
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
port(
  clk : in std_logic;
  reset : in std_logic;
  pc_in : in std_logic_vector(31 downto 0);
  pc_out : out std_logic_vector(31 downto 0)
  );
end program_counter;

architecture Behavioral of program_counter is

begin
    process(clk,reset)
    begin
      if reset = '1' then
        pc_out <= (others =>'0');
      elsif rising_edge(clk) then
        pc_out <= pc_in;  
      end if;  
    end process;
end Behavioral;
