----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2024 13:18:19
-- Design Name: 
-- Module Name: mainControl - Behavioral
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

entity mainControl is
  Port ( 
  opcode : in std_logic_vector(5 downto 0);
  memwrite : out std_logic;
  memtoreg : out std_logic;
  branch : out std_logic;
  branch_n : out std_logic;
  alusrc : out std_logic;
  regdst : out std_logic;
  regwrite : out std_logic;
  aluop : out std_logic_vector(1 downto 0);
  jump : out std_logic
  );
end mainControl;

architecture Behavioral of mainControl is

begin
  process(opcode)
  begin
  case opcode is
    when "000000" => --r-type
      regwrite <= '1';
      regdst <= '1';
      alusrc <= '0';
      branch <= '0';
      branch_n <= '0';
      jump <= '0';
      memwrite <= '0';
      memtoreg <= '0';
      aluop <= "10";
    when "100011" => -- lw
      regwrite <= '1';
      regdst <= '0';
      alusrc <= '1';
      branch <= '0';
      memwrite <= '0';
      memtoreg <= '1';
      branch_n <= '0';
      jump <= '0';
      aluop <= "00";
    when "101011" => --sw
      regwrite <= '0';
      regdst <= 'X';
      alusrc <= '1';
      branch <= '0';
      memwrite <= '1';
      memtoreg <= 'X';
      branch_n <= '0';
      jump <= '0';
      aluop <= "00";
    when "000100" => --beq
      regwrite <= '0';
      regdst <= 'X';
      alusrc <= '0';
      branch <= '1';
      memwrite <= '0';
      memtoreg <= 'X';
      branch_n <= '0';
      jump <= '0';
      aluop <= "10";   
    when "000010" => --j
      regwrite <= '0';
      regdst <= 'X';
      alusrc <= '0';
      branch <= '0';
      memwrite <= '0';
      memtoreg <= 'X';
      branch_n <= '0';
      jump <= '1';
      aluop <= "00";
    when "000101" => --bne
      regwrite <= '0';
      regdst <= 'X';
      alusrc <= '0';
      branch <= '0';
      memwrite <= '0';
      memtoreg <= '0';
      branch_n <= '1';
      jump <= '0';
      aluop <= "10";
    when "001000"=> -- addi
      regwrite <= '1';
      regdst <= '1';
      alusrc <= '1';
      branch <= '0';
      memwrite <= '0';
      memtoreg <= '0';
      branch_n <= '0';
      jump <= '0';
      aluop <= "00";  
    when others =>
       regwrite <= '1';
      regdst <= '0';
      alusrc <= '1';
      branch <= '0';
      memwrite <= '0';
      memtoreg <= '0';
      branch_n <= '0';
      jump <= '0';
      aluop <= "00"; 
  end case;    
  end process;

end Behavioral;
