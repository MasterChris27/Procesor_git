--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:55:33 05/28/2018
-- Design Name:   
-- Module Name:   /home/boza/4IR/Archi/Procesor/testUCP.vhd
-- Project Name:  Procesor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UCP
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
 
ENTITY testUCP IS
END testUCP;
 
ARCHITECTURE behavior OF testUCP IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UCP
    PORT(
         Bus_address : OUT  std_logic_vector(7 downto 0);
         Bus_control : OUT  std_logic_vector(1 downto 0);
         Bus_data : INOUT  std_logic_vector(15 downto 0);
         Clk : IN  std_logic;
			Interuptions : IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Interuptions : std_logic := '0';

	--BiDirs
   signal Bus_data : std_logic_vector(15 downto 0);

 	--Outputs
   signal Bus_address : std_logic_vector(7 downto 0);
   signal Bus_control : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UCP PORT MAP (
          Bus_address => Bus_address,
          Bus_control => Bus_control,
          Bus_data => Bus_data,
          Clk => Clk,
			 Interuptions =>Interuptions
			 
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
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
