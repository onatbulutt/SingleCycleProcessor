----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2024 12:47:33
-- Design Name: 
-- Module Name: ALUControl - Behavioral
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

entity ALUControl is
  Port ( 
  funct : in std_logic_vector(5 downto 0);
  aluop : in std_logic_vector(1 downto 0);
  alucontrol2 : out std_logic_vector(2 downto 0)
  );
end ALUControl;

architecture Behavioral of ALUControl is

begin

process(funct, aluop)
begin
 if aluop = "00" then
   alucontrol2 <= "010"; --add
 elsif aluop(0) = '1' then
   alucontrol2 <= "110"; -- sub
 elsif aluop(1) = '1' then
   if funct = "100000" then
     alucontrol2 <= "010"; -- add
   elsif funct = "100010" then
     alucontrol2 <= "110"; -- sub
   elsif funct = "100100" then
     alucontrol2 <= "000"; -- and   
   elsif funct = "100101" then
     alucontrol2 <= "001"; -- or  
   elsif funct = "101010" then
     alucontrol2 <= "111"; -- and       
   end if;     
 end if;    
end process;   
end Behavioral;
