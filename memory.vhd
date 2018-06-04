----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:13:10 05/04/2018 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
    Port ( Bus_address : in  STD_LOGIC_VECTOR (7 downto 0); -- receiving address of the registry
           Bus_control : in  STD_LOGIC_VECTOR (1 downto 0);           -- receiving type of action
           Bus_data : inout  STD_LOGIC_VECTOR (15 downto 0); -- receiving/sending data
			  Clk : in STD_LOGIC);                              -- clock so we have everything sync-ed
end memory;

architecture Behavioral of memory is 

-- 00 Memory read
-- 01 Memory write
-- 10 I/O read
-- 11 I/O write


	-- creating memory of 2^14 spots
	type register_array is array(0 to 512) of STD_LOGIC_VECTOR (15 downto 0); -- check for a way to put  variables 
	signal matrix: register_array := (others => x"0000");
	signal data :std_logic_vector(15 downto 0);
	signal status : INTEGER range 0 to 10;

begin

	--matrix <= (others => x"0000");  -- instanciating all memory with 0
	--Bus_data<=x"0000";
	--Registry:Reg_16  port map(Bus_data,Bus_data,Clk,RC(0),RC(1)); -- we set on wich position we set the Load/Enable



	process
	begin
		wait until rising_edge(Clk);  -- search for the registry first 
		
		Bus_data <= "ZZZZZZZZZZZZZZZZ";
		-- can we use Z as state to not make any operations on the memory ?
		if(Bus_control="00") then  --we  are reading from memory 
			if(status=0)then
				status<=1;
				Bus_data <= matrix(to_integer(unsigned(Bus_address)));
			elsif(status<=1)then
				
				Bus_data<="ZZZZZZZZZZZZZZZZ";
				status<=0;
			end if;
		elsif(Bus_control="01") then  --we are writing in memory
			matrix(to_integer(unsigned(Bus_address))) <= Bus_data(15 downto 0); -- we are casting from x"000f" to 15 integer
		end if ;	
  
  
  end process;


end Behavioral;

