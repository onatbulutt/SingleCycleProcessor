----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2024 18:45:01
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port ( 
  a : in std_logic_vector(31 downto 0);
  b : in std_logic_vector(31 downto 0);
  alucontrol : in std_logic_vector(2 downto 0);
  zero : out std_logic;
  result : out std_logic_vector(31 downto 0)
  );
end ALU;

architecture Behavioral of ALU is
signal r : std_logic_vector(31 downto 0);
begin             
  process(a,b,alucontrol)
  begin  
    r <= STD_LOGIC_VECTOR(UNSIGNED(a) - UNSIGNED(b));
    case alucontrol is
      when "000" =>
        result <= a and b;
      when "001" =>
        result <= a or b;
      when "010" =>
        result <= std_logic_vector(unsigned(a) + unsigned(b));
      when "011" => 
        result <= (others => 'X');  
      when "100" =>
        result <= a and (not b);
      when "101" =>
         result <= a or (not b);  
      when "110" =>          
         result <= STD_LOGIC_VECTOR(UNSIGNED(a) - UNSIGNED(b));
      when "111" =>
         if (SIGNED(a) < SIGNED(b)) then
						result <= X"00000001";
					else 
						result <= X"00000000";
				    end if;		
      when others =>
         result <= (others => 'X');  
      end case;   
  end process;
  
  zero <= '1' when r = x"00000000" else
          '0';
              
end Behavioral;
