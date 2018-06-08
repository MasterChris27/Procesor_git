--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:27 06/06/2018
-- Design Name:   
-- Module Name:   /home/boza/4IR/Archi/Procesor/test_read.vhd
-- Project Name:  Procesor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: text_read
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
 
ENTITY test_read IS
END test_read;
 
ARCHITECTURE behavior OF test_read IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT text_read
    PORT(
         address : IN  std_logic_vector(3 downto 0);
         dataout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal dataout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: text_read PORT MAP (
          address => address,
          dataout => dataout
        );

   -- Stimulus process
process
   begin		
      wait for 100 ns;	

      wait;
   end process;
END;
