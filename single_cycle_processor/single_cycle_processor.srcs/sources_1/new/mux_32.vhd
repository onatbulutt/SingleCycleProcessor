----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 20:26:51
-- Design Name: 
-- Module Name: mux_32 - Behavioral
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

entity mux_32 is
  Port ( 
  s : in std_logic;
  d0 : in std_logic_vector(31 downto 0);
  d1 : in std_logic_vector(31 downto 0);
  y : out std_logic_vector(31 downto 0)
  );
end mux_32;

architecture Behavioral of mux_32 is

begin
 
   y <= d0 when (s = '0') else d1; 

end Behavioral;
