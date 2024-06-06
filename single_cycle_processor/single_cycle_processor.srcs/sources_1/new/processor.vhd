----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 18:19:42
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
  Port ( 
  CLOCK : in std_logic;
  RST   : in std_logic
  );
end processor;

architecture Behavioral of processor is

component program_counter is
port(
  clk : in std_logic;
  reset : in std_logic;
  pc_in : in std_logic_vector(31 downto 0);
  pc_out : out std_logic_vector(31 downto 0)
  );
end component;

component ALU is
Port ( 
  a : in std_logic_vector(31 downto 0);
  b : in std_logic_vector(31 downto 0);
  alucontrol : in std_logic_vector(2 downto 0);
  zero : out std_logic;
  result : out std_logic_vector(31 downto 0)
  );
end component;

component ALUControl is
Port ( 
  funct : in std_logic_vector(5 downto 0);
  aluop : in std_logic_vector(1 downto 0);
  alucontrol2 : out std_logic_vector(2 downto 0)
  );
end component;

component SIGNEXT is
Port ( 
  a : in std_logic_vector(15 downto 0);
  y : out std_logic_vector(31 downto 0)
  );
end component;

component SL2 is
    Port (
        a  : in  std_logic_vector(31 downto 0);  -- Input 32-bit vector
        y : out std_logic_vector(31 downto 0)   -- Output 32-bit vector
    );
end component;

component adder is
  Port ( 
   a: in std_logic_vector(31 downto 0);
   b: in std_logic_vector(31 downto 0);
   y: out std_logic_vector(31 downto 0)
  );
end component;

component data_memory is
 Port ( 
    clk : in std_logic;
    we : in std_logic;
    a: in std_logic_vector(31 downto 0);
    wd : in std_logic_vector(31 downto 0);
    rd: out std_logic_vector(31 downto 0)
 );
end component;

component instruction_mem is
  Port ( 
  
  a : in std_logic_vector(31 downto 0);
  rd: out std_logic_vector(31 downto 0) 
  );
end component;

component mainControl is
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
end component;

component mux_32 is
  Port ( 
  s : in std_logic;
  d0 : in std_logic_vector(31 downto 0);
  d1 : in std_logic_vector(31 downto 0);
  y : out std_logic_vector(31 downto 0)
  );
end component;

component mux_5 is
  Port ( 
  s : in std_logic;
  d0 : in std_logic_vector(4 downto 0);
  d1 : in std_logic_vector(4 downto 0);
  y : out std_logic_vector(4 downto 0)
  );
end component;


component register_file is
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
end component;

signal pcin , pcout : std_logic_vector(31 downto 0); -- program_counter
signal pc_adder_out : std_logic_vector(31 downto 0);
signal instruction : std_logic_vector(31 downto 0);
signal ctrl_opcode : std_logic_vector(5 downto 0);
signal ctrl_memwrite, ctrl_memtoreg, ctrl_branch, ctrl_branch_n, ctrl_alusrc : std_logic;
signal ctrl_regdst, ctrl_regwrite, ctrl_jump : std_logic;
signal ctrl_aluop : std_logic_vector(1 downto 0);
signal jumpaddr : STD_LOGIC_VECTOR(31 downto 0);
signal branchmuxselect: std_logic;
signal ALU_zero : std_logic;
signal rs,rt,rd ,regdstmux_out: std_logic_vector(4 downto 0);
signal A,B : std_logic_vector(31 downto 0);
signal immediate : STD_LOGIC_VECTOR(15 downto 0);
signal jumpinst : STD_LOGIC_VECTOR(25 downto 0); 
signal shifted_signimm , signimm: STD_LOGIC_VECTOR(31 downto 0);
signal branch_out,branch_mux_out : std_logic_vector(31 downto 0);
signal memreg_out , alusrcmux_out  : std_logic_vector(31 downto 0);
signal ALU_funct : std_logic_vector(5 downto 0);
signal alu_control : std_logic_vector(2 downto 0);
signal memory_out, ALU_result :  std_logic_vector(31 downto 0);






begin

    ctrl_opcode <= instruction(31 downto 26);
	rs <= instruction(25 downto 21);
	rt <= instruction(20 downto 16);
	rd <= instruction(15 downto 11);
	ALU_funct <= instruction(5 downto 0);
	immediate <= instruction(15 downto 0);
	jumpinst <= instruction(25 downto 0);
	
	jumpaddr(31 downto 28) <= pc_adder_out(31 downto 28);
	jumpaddr(27 downto 2) <= jumpinst;
	jumpaddr(1 downto 0) <= (others => '0');
	
	branchmuxselect <= ((ctrl_branch and ALU_zero) or (ctrl_branch_n and (not ALU_zero)));
    
PC: program_counter
    port map(clk=>CLOCK, reset=>RST, pc_in=>pcin, pc_out=>pcout);

PCAdder: adder 
    port map(a=>pcout, b=>x"00000004", y=>pc_adder_out);
  
IM: instruction_mem
    port map(a=>pcout, rd=>instruction);   
    
Main_Control: mainControl
    port map(opcode=>ctrl_opcode, memwrite=>ctrl_memwrite, memtoreg=>ctrl_memtoreg, branch=>ctrl_branch, branch_n=>ctrl_branch_n,
    alusrc=>ctrl_alusrc, regdst=>ctrl_regdst, regwrite=>ctrl_regwrite, aluop=>ctrl_aluop, jump=>ctrl_jump); 

alucontrol_comp : ALUControl 
    port map(funct=>ALU_funct, aluop=>ctrl_aluop, alucontrol2 =>alu_control);
    
Sign_ext: SIGNEXT
    port map(a=>immediate, y=>signimm); 
 
shift: SL2 
    port map(a=>signimm, y=>shifted_signimm);
 
Branch_adder: adder 
    port map(a=>shifted_signimm, b=>pc_adder_out, y=>branch_out);
 
branch_mux: mux_32 
    port map(s=>branchmuxselect, d0=>pc_adder_out, d1=>branch_out, y=>branch_mux_out); 
    
jump_mux: mux_32 
    port map(s=>ctrl_jump, d0=>branch_mux_out, d1=>jumpaddr, y=>pcin); 
    
reg_dst_mux : mux_5    
    port map(s=>ctrl_regdst, d0=>rt, d1=>rd, y=>regdstmux_out);
    
registerfile : register_file    
    port map(clk=>CLOCK, we3=>ctrl_regwrite, ra1=>rs, ra2=>rt, wa3=>regdstmux_out, wd3=>memreg_out, rd1=>A, rd2=>B);
    
alusrc_mux: mux_32   
    port map(s=>ctrl_alusrc, d0=>B, d1=>signimm, y=>alusrcmux_out);
    
alu_comp : ALU   
    port map(a=>A, b=>alusrcmux_out, alucontrol=>alu_control, zero=>ALU_zero, result=>ALU_result);
    
memory : data_memory
    port map(clk=>CLOCK, we=>ctrl_memwrite, a=>ALU_result, wd=>B, rd=>memory_out);    
    
memtoregmux : mux_32
    port map(s=>ctrl_memtoreg, d0=>ALU_result, d1=>memory_out, y=>memreg_out);   
    
    
end Behavioral;
