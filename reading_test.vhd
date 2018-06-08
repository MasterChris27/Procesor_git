----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:35 06/08/2018 
-- Design Name: 
-- Module Name:    reading_test - Behavioral 
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


use IEEE.NUMERIC_STD.ALL;


library UNISIM;
use UNISIM.VComponents.all;

entity reading_test is
end reading_test;

architecture Behavioral of reading_test is

signal memorie:std_logic_vector(31 downto 0);

begin


reading_from_file : process ( IN_GLOBAL_RESET , IN_CLOCK ) is
file text_file : text open read_mode is "HexInstr.txt" ;
variable current_line : line ;
variable incoming_data : integer ;
variable data_coutner : integer := 0 ;
	begin
    if IN_GLOBAL_RESET = '1' then
        data <= ( others => '0' ) ;
	elsif rising_edge ( IN_CLOCK ) then
        if not endfile ( text_file ) then
            if data_coutner = 0 then
                readline ( text_file , current_line ) ;
            end if;
            read ( current_line , incoming_data ) ;  
            data <= std_logic_vector ( to_unsigned ( incoming_data , data ' length ) ) ;	
            data_coutner := ( data_coutner + 1 ) rem 4 ;	
        end if ;
    end if ;		
end process reading_from_file ;

	memorie <=data;
end Behavioral;

