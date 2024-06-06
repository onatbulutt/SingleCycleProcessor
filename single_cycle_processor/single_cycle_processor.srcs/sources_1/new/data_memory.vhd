----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 23:03:55
-- Design Name: 
-- Module Name: data_memory - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_memory is
 Port ( 
    clk : in std_logic;
    we : in std_logic;
    a: in std_logic_vector(31 downto 0);
    wd : in std_logic_vector(31 downto 0);
    rd: out std_logic_vector(31 downto 0)
 );
end data_memory;

architecture Behavioral of data_memory is
type ram_type is array (0 to 255) of std_logic_vector(31 downto 0);
signal ram : ram_type;
begin
  process(a,we)
  begin
    if we = '0' then
      rd <= ram(TO_INTEGER(unsigned(a)));
    end if;  
  end process;
  
  process(clk)
  begin
    if rising_edge(clk) then
      if we = '1' then
        ram(TO_INTEGER(unsigned(a))) <= wd;  
      end if;
    end if;
  end process;
end Behavioral;
