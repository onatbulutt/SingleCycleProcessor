----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 22:57:26
-- Design Name: 
-- Module Name: register_file - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; 



entity register_file is
  port (
    clk   : in  std_logic;       
    we3  : in  std_logic;           
    ra1    : in  std_logic_vector(4 downto 0);  
    ra2    : in  std_logic_vector(4 downto 0);  
    wa3    : in  std_logic_vector(4 downto 0);  
    wd3: in  std_logic_vector(31 downto 0); 
    rd1     : out std_logic_vector(31 downto 0); 
    rd2    : out std_logic_vector(31 downto 0)  
  );
end register_file;

architecture Behavioral of register_file is
type reg_type is array(0 to 31) of std_logic_vector(31 downto 0);
signal RegFile : reg_type := (
		X"00000000", 
		X"00000001", 
		X"00000002", 
		X"00000003", 
		X"00000004",
		X"00000005",
		X"00000006", 
		X"00000007", 
		X"00000008", 
		X"00000009", 
		X"0000000a", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"00000000", 
		X"10008000", 
		X"7fffe838", 
		X"00000000", 
		X"00000000"  
	);
begin
  process(ra1, ra2)
    begin
        
        rd1 <= RegFile(conv_integer(ra1));  
        rd2 <= RegFile(conv_integer(ra2));  
    end process;
  process(clk)
  begin
    if rising_edge(clk) then
        if we3 = '1' then		
             RegFile(conv_integer(wa3)) <= wd3;                
		end if;
	end if;
  end process;
end Behavioral;

