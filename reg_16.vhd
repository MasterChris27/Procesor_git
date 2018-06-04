----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:18 05/04/2018 
-- Design Name: 
-- Module Name:    Ram_16 - Behavioral 
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
use sizes.vhd;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_16 is  
	-- generic(
	--	size_data: natural:=16
	-- );
    Port ( data_in : in  STD_LOGIC_VECTOR (size_data downto 0);  -- entrance
           data_out : out  STD_LOGIC_VECTOR (size_data downto 0);  -- output
           Clk : in  STD_LOGIC;  -- write or output data
           Load : in  STD_LOGIC; -- enable entry of data
           Enable : in  STD_LOGIC); -- enable output of the data 
end reg_16;

architecture Behavioral of Reg_16 is

signal data : STD_LOGIC_VECTOR(size_data downto 0);  -- actual data stored



begin

	process 
	 begin
		wait until rising_edge(Clk) ;
		
		if(enable ="1" and Load="1") then    -- if we are writing in the registry
			 data <= data_in;
		else
			data <= data;
			end if;
			
		--if(Enable="1") then   -- if we are reading from the registry

		--else
		--	data<=data;
			
		--	end if;
		

	 end process;
	 
	data_out<=data;  -- it's always put there after a process
end Behavioral;

