----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2024 21:34:39
-- Design Name: 
-- Module Name: tb_program_counter - Behavioral
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

entity tb_program_counter is
end tb_program_counter;

architecture sim of tb_program_counter is
    -- Declare signals to connect to the DUT (Device Under Test)
    signal clk : std_logic := '0';  -- Clock signal
    signal reset : std_logic := '0';  -- Reset signal
    signal pc_in : std_logic_vector(31 downto 0) := (others => '0');  -- PC input
    signal pc_out : std_logic_vector(31 downto 0);  -- PC output

    -- Component declaration for the program counter
    component program_counter
        port(
            clk : in std_logic;
            reset : in std_logic;
            pc_in : in std_logic_vector(31 downto 0);
            pc_out : out std_logic_vector(31 downto 0)
        );
    end component;

    -- Clock period for simulation
    constant clk_period : time := 10 ns;  

begin
    -- Instantiate the program_counter
    uut: program_counter
        port map(
            clk => clk,
            reset => reset,
            pc_in => pc_in,
            pc_out => pc_out
        );

    -- Clock generation process
    clk_process: process
    begin
        while True loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Test process to apply reset and various inputs
    test_process: process
    begin
        -- Apply a reset and check PC output
        reset <= '1';
        pc_in <= x"00000004";
        wait for 2 * clk_period;  -- Allow time for reset to take effect
        reset <= '0';
        
        -- Set pc_in and check if it updates after clock edge
        pc_in <= x"00000004";
        wait for 2 * clk_period;  -- Wait for two clock cycles
        assert pc_out = x"00000004"  -- Check if pc_out is correct
        report "Error: PC output is incorrect after first input" severity error;

        -- Set another pc_in value and check again
        pc_in <= x"00000008";
        wait for 2 * clk_period;
        assert pc_out = x"00000008"
        report "Error: PC output is incorrect after second input" severity error;

        -- End of test
        wait;  -- Keep the simulation running
    end process;

end sim;

