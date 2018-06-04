----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:53 05/03/2018 
-- Design Name: 
-- Module Name:    pipe_line - Behavioral 
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

entity pipe_line is
    Port ( a_in : in  STD_LOGIC_VECTOR (15 downto 0);
           b_in : in  STD_LOGIC_VECTOR (15 downto 0);
           c_in : in  STD_LOGIC_VECTOR (15 downto 0);
           op_in : in  STD_LOGIC_VECTOR (7 downto 0);
           a_out : out  STD_LOGIC_VECTOR (15 downto 0);
           b_out : out  STD_LOGIC_VECTOR (15 downto 0);
           c_out : out  STD_LOGIC_VECTOR (15 downto 0);
           op_out : out  STD_LOGIC_VECTOR (7 downto 0);
			  Clk : in STD_LOGIC);
end pipe_line;

architecture Behavioral of pipe_line is

begin
 process
  begin
  
  wait until Clk'Event and Clk="1";
		op_out<=op_in;
		a_out<=a_in;
		b_out<=b_in;
		c_out<=c_in;

  end process;


end Behavioral;

