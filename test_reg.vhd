-- TestBench Template 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.All;
use ieee.Numeric_std.all;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT Reg_16
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);  -- entrance
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);  -- output
           Clk : in  STD_LOGIC;  -- write or output data
           Load : in  STD_LOGIC; -- enable entry of data
           Enable : in  STD_LOGIC);
          END COMPONENT;


--inputs   studentupm2008

          SIGNAL data_in :  std_logic_vector(15 downto 0);
			 signal Clk : std_logic;
			 signal Load : std_logic;
			 signal Enable : std_logic;
 --outputs         
          SIGNAL data_out:  std_logic_vector(15 downto 0);
			 
			 
constant Clk_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: Reg_16 PORT MAP(
			 data_in =>data_in , 
           data_out=> data_out,
           Clk =>Clk,  -- write or output data
           Load =>Load, -- enable entry of data
           Enable =>Enable
          );
  Clk_p :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 30 ns; -- wait until global set/reset completes

			Load <= '0', '1' after 30 ns,'0' after 400 ns;
			Enable <= '0', '1' after 30 ns,'0' after 200 ns,'1' after 300 ns;
        data_in <= x"a410", x"1025" after 50 ns, x"1225" after 150 ns, x"a3a5" after 250 ns, x"3225" after 350 ns, x"1025" after 450 ns;
			
       wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
