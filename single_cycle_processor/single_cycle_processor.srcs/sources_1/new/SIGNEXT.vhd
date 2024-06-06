----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 21:01:19
-- Design Name: 
-- Module Name: SIGNEXT - Behavioral
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

entity SIGNEXT is
  Port ( 
  a : in std_logic_vector(15 downto 0);
  y : out std_logic_vector(31 downto 0)
  );
end SIGNEXT;

architecture Behavioral of SIGNEXT is

begin
  process(a)
  begin
    if a(15)='0' then
      y <= "0000000000000000" & a ;
    elsif a(15)='1' then
      y <= "1111111111111111" & a ;  
    end if;
  end process;
end Behavioral;
