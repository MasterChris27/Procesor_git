----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:45 05/15/2018 
-- Design Name: 
-- Module Name:    IO - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IO is
    Port ( 
           Bus_address : in  STD_LOGIC_VECTOR (7 downto 0);
			  Bus_control : in std_logic_vector(1 downto 0);
           Bus_data : in  STD_LOGIC_VECTOR (15 downto 0);
			  Clk : in  STD_LOGIC;
			  Bus_interruptions : out std_logic
			  );
end IO;

architecture Behavioral of IO is

-- 00 Memory read
-- 01 Memory write
-- 10 I/O read
-- 11 I/O write



type register_array is array(0 to 127) of STD_LOGIC_VECTOR (15 downto 0); 
signal ports: register_array := (others => x"0000");


type reg_array is array(0 to 15) of STD_LOGIC_VECTOR (15 downto 0); --15 ports of possible interruptors

signal data :std_logic_vector(15 downto 0);
--signal status : INTEGER range 0 to 10;



begin

	


end Behavioral;

