--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:54:14 05/03/2018
-- Design Name:   
-- Module Name:   /home/boza/4IR/Archi/Procesor/testUAL.vhd
-- Project Name:  Procesor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UAL
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
 
ENTITY testUAL IS
END testUAL;
 
ARCHITECTURE behavior OF testUAL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UAL
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Op : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         Flag : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');
	signal Clk : std_logic := '0';

 	--Outputs
   signal Flag : std_logic_vector(3 downto 0) := (others => '0');
   signal S : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UAL PORT MAP (
          A => A,
          B => B,
          Op => Op,
          S => S,
          Flag => Flag
        );

   -- Clock process definitions
   Clk_p :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
      wait for Clk_period*10;
		
		A <= x"0120", x"023A" after 100 ns, x"002A" after 200 ns, x"002A" after 300 ns, x"02A0" after 400 ns;
		B <= x"103F", x"0F0F" after 100 ns, x"002A" after 200 ns;
		Op<= x"0", x"1" after 100 ns, x"2" after 200 ns;--, x"3" after 300 ns, x"4" after 400 ns;
			
			
      -- insert stimulus here 

      wait;
   end process;

END;
