--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:21:37 05/15/2018
-- Design Name:   
-- Module Name:   /home/boza/4IR/Archi/Procesor/test_mem.vhd
-- Project Name:  Procesor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_mem IS
END test_mem;
 
ARCHITECTURE behavior OF test_mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         Bus_address : IN  std_logic_vector(15 downto 0);
         Bus_control : IN  std_logic_vector(1 downto 0);
         Bus_data : INOUT  std_logic_vector(15 downto 0);
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Bus_address : std_logic_vector(15 downto 0) := (others => '0');
   signal Bus_control : std_logic_vector(1 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

	--BiDirs
   signal Bus_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          Bus_address => Bus_address,
          Bus_control => Bus_control,
          Bus_data => Bus_data,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10ns;
		
		 Bus_address <= x"0001", x"0002" after 20 ns,            x"0001" after 40 ns;
       Bus_control <=    "01",    "01" after 20 ns,               "00" after 40 ns;
       Bus_data    <= x"ab21", x"1222" after 20 ns, "ZZZZZZZZZZZZZZZZ" after 40 ns;
     
	   

      wait;
   end process;

END;
