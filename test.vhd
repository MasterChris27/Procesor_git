----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:56 04/10/2018 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity main is
port(signal L,Se,E,R,Oscil: std_logic;
     signal Do : out std_logic_vector(7 downto 0);
     signal Di : in std_logic_vector(7 downto 0)
);
end main;

architecture struct of main is

component code
	Port ( Load : in  STD_LOGIC;  -- 1 loaded
			  Sens : in STD_LOGIC; -- 1 up
			  Enable : in STD_LOGIC; -- 0 active
           Dout : out  STD_LOGIC_VECTOR (7 downto 0); --out put of current status
           Din : in  STD_LOGIC_VECTOR (7 downto 0);  -- input of start count  
           Clk : in  STD_LOGIC; -- clock
           Reset : in  STD_LOGIC -- reset on 0
			  ); 
end component;
	 
component div
    Port(osc : in  STD_LOGIC ;
	      Clk_out : out STD_LOGIC );
end component;

signal a : std_logic;
	 
begin

Counter: code port map(L,Se,E,Do,Di,a,R);
Divizor: div port map(Oscil,a);

end architecture struct ;	 

