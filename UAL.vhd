----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:34 05/03/2018 
-- Design Name: 
-- Module Name:    UAL - Behavioral 
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
use ieee.std_logic_unsigned.All;
use ieee.Numeric_std.all;
--use sizes.all;  -- trying to have every constant in the same file

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Op : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Flag : out  STD_LOGIC_VECTOR (3 downto 0));
end UAL;

architecture Behavioral of UAL is

signal Sadd : STD_LOGIC_VECTOR(16 downto 0);
signal Smul : STD_LOGIC_VECTOR(31 downto 0);
signal Ssub : STD_LOGIC_VECTOR(16 downto 0);
signal Sleft: STD_LOGIC_VECTOR(15 downto 0);
signal Sright:STD_LOGIC_VECTOR(15 downto 0);

begin

		Sadd<=('0' & A)+('0' & B);
		Smul<=A*B;
		Ssub<=('0' & A)-('0' & B);
		Sleft<=A(14 downto 0) & '0';
		Sright<= '0'& A(15 downto 1);

	S<= Sadd(15 downto 0) when op=x"00" else -- it shoudl have a default state where it doesn't do anything
		 Ssub(15 downto 0) when op=x"01" else
		 Smul(15 downto 0) when op=x"02" else
		 Sleft when op=x"03" else
		 Sright when op=x"04"else
		 "ZZZZZZZZZZZZZZZZ" when op=x"FF"; -- default
		 -- else -- must add a default mode to it !
	  --  report "unreachable" when others;
	  
 --Flag<=Sadd(16) when op=x"0" else
--		 Ssub(16) when op=x"1" else
	--	 Smul(31) when op=x"2"; -- else -- must add a default mode to it !
	  --  report "unreachable" when others;
		 
		 
 




end Behavioral;

