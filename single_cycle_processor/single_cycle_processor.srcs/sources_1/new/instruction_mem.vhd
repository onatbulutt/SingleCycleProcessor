----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 21:51:25
-- Design Name: 
-- Module Name: instruction_mem - Behavioral
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

entity instruction_mem is
  Port ( 
  
  a : in std_logic_vector(31 downto 0);
  rd: out std_logic_vector(31 downto 0) 
  );
end instruction_mem;

architecture Behavioral of instruction_mem is
    type ROM_Array is array (0 to 63) of std_logic_vector(31 downto 0);
    signal IMem : ROM_Array := (								 
		
		 --x"20450004", -- addi $5,$2,4    r5 =2+4=6
		 X"00A41822", -- SUB $3, $5, $4 --> $3 = 0X05 - 0X04 = 0X01
		 X"00E61024", -- AND $2, $7, $6 --> $2 = 0X07 AND 0X06 = 0X06
		 X"00852025", -- OR $4, $4, $5 --> $4 = 0X04 OR 0X05 = 0X05
		 X"00C72820", -- ADD $5, $6, $7 --> $5 = 0X06 + 0X07 = 0X0D
		 X"1421FFFA", -- BNE $1, $1, -24 --> BRANCH NOT IF $1=$1
		 X"1022FFFF", -- BEQ $1, $2, -4 --> BRANCH IF $1=$2
		 X"0062302A", -- SLT $6, $3, $2 --> $6 = $3 < $2 = 0X01
		 									-- = 0X01 < 0X06
		 X"10210002", -- BEQ $1, $1, 2 --> BRANCH IF $1=$1
		 X"00000000", -- NOP --> NOP
		 X"00000000", -- NOP --> NOP
		 x"14220002", -- bne (eþit olmadýðý için 2 branch alýyor)
		 X"00000000", -- NOP --> NOP
         X"00000000", -- NOP --> NOP
		 X"AC010002", -- SW $1, 1(2) 
		 X"8C010002", --LW $1, 1(2) 
		 
		 X"08000000", -- jump to pc=0
		 X"00000000",
		 X"00000000",
		 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
  X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000", -- NOP --> NOP
 X"00000000" -- NOP --> NOP



	);
begin
    process(a)
    begin
      rd <= IMem(TO_INTEGER(unsigned(a))/4);
    end process;  

end Behavioral;
