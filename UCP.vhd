----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:44 05/04/2018 
-- Design Name: 
-- Module Name:    UCP - Behavioral 
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

entity UCP is
    Port ( Bus_address : out  STD_LOGIC_VECTOR (7 downto 0); -- bus reserved for sending adresses 
           Bus_control : out  STD_LOGIC_VECTOR (1 downto 0);           -- bus reserved for selecting Memory Write/Read , IO write/Read
			  Bus_data : inout  STD_LOGIC_VECTOR (15 downto 0);  -- bus reserved for sending and receiving data acording to RC
			  Clk : in std_logic                                 -- clk to all main 
			  --add a new "bus" to communicate between UAL and RA
			  );
end UCP;

architecture Behavioral of UCP is
signal Data :std_logic_vector(15 downto 0);    -- result from UAL to data
signal data_address :std_logic_vector(15 downto 0);

signal reg_curr_instr : std_logic_vector (31 downto 0);  -- to be debated how we structure our instructions

signal curr_op: std_logic_vector(7 downto 0);
signal flag : std_logic_vector(3 downto 0);
signal result : STD_LOGIC_VECTOR (15 downto 0);

signal status : integer range 0 to 10; -- we can have a lvl 10 only status of each instr


type register_array is array(0 to 512) of STD_LOGIC_VECTOR (31 downto 0); -- check for a way to put  variables 

signal instr_mem: register_array;
--instr_counter <= 0;
type reg_type is array (15 downto 0) of std_logic_vector(15 downto 0);-- our registries
signal reg : reg_type;


type reg_rec_type is array (10 downto 0) of std_logic_vector(15 downto 0);-- our registries

signal reg_recursivity : reg_rec_type ; -- could create another type of recusivity



--keeping the current instruction in CPU
--signal reg_instructions : std_logic_vector(15 downto 0); -- possibly making an array out of it
--counting all instructions to be able to return and advance

signal currentInst : integer range 0 to 1024; -- make it better
signal currentRecursivityLevel : integer range 0 to 10 ;

signal regSelectorA:std_logic_vector(15 downto 0);
signal regSelectorB:std_logic_vector(15 downto 0);

-- might not need this part
component Reg_16
    Port(  data_in : in  STD_LOGIC_VECTOR (15 downto 0);  -- entrance
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);  -- output
           Clk : in  STD_LOGIC;  -- write or output data
           Load : in  STD_LOGIC; -- enable entry of data
           Enable : in  STD_LOGIC); -- enable output of the data 
end component;
-- until here 



component UAL	
    Port(  A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Op : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Flag : out  STD_LOGIC_VECTOR (3 downto 0) ); -- enable output of the data 
end component;



begin
--RD:Reg_16  port map(Data,Bus_data,Clk,RC(0),RC(1)); -- we set on wich position we set the Load/Enable
-- Add another RD and I will comunicate between them with a signal
 -- cum fac ca RD sa poate fie scris din ambele parti 
ALU:UAL port map(regSelectorA,regSelectorB,curr_op,result,flag); -- we always put the resultat S in r1
            --  op @1 @2/
--####### How to use the instructions ######
--	Format: [Op][Op]AABBBB (first 2 operations; next 2 A, last 4 B.
--	Ops: |00 |01 |02 |03 |   04  05   06  07 08   09  0A   0B  0C  0D    0E  0F
--		  |ADD|SUB|MUL|DIV|STORE LOAD AFC EQU INF InfE Sup SupE Jmp Jmpc Call Ret

-- NOT GOOD must increment
instr_mem(0)<=x"06010032";--afc r1 with 50
instr_mem(1)<=x"06020023";-- afc r2 with 35
instr_mem(2)<=x"00020001";-- add and store in r2
instr_mem(3)<=x"00010002";-- add and store in r6
instr_mem(4)<=x"06060002";--afc r6 with 2
instr_mem(5)<=x"04020002";-- store at @2 the value of r2
instr_mem(6)<=x"04030006";-- store at @3 the value of r6
instr_mem(7)<=x"05020009";-- load in r2 the value from @2

instr_mem(8)<=x"06010030";--afc r1
instr_mem(9)<=x"06020020";-- afc r2
instr_mem(10)<=x"00060001";-- add and store in r6
instr_mem(11)<=x"04080006";-- store at @8 the value of r6

instr_mem(12)<=x"06010023";--afc r1 with 35
instr_mem(13)<=x"06020022";-- afc r2 with 35
instr_mem(14)<=x"07020001";-- store in r1 the result of r1==r2

instr_mem(15)<=x"0e000002";-- if r2 = 0 then we jump at instrc 1

	

process


 begin
 --wait for 50ns;
  wait until rising_edge(Clk); 
  Bus_data <= "ZZZZZZZZZZZZZZZZ";
 -- Bus_control<= "ZZ";
  --change everything to double the size of operation 
  if(reg_curr_instr(31 downto 24)= x"00") then-- ADD
			 if(status=0)then -- we have to put it to status =1 for reasigning the value 
					regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
					regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
					--curr_op<=x"ff";  -- the current operation changes only after the process so it remains to FF when we need it to work
					status<=status+1;
					curr_op<=x"00"; 
				elsif(status=1) then
					reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
					status<=0;
					currentInst<= currentInst+1;
				--	assert false report "Simulation Finished" severity failure;  -- debug stop 
			 
			 end if;
	 
  elsif(reg_curr_instr(31 downto 24)= x"01") then-- sub
		  if(status=0)then -- we have to put it to status =1 for reasigning the value 
					regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
					regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
					--curr_op<=x"ff";  -- the current operation changes only after the process so it remains to FF when we need it to work
					status<=status+1;
					curr_op<=x"01"; 
				elsif(status=1) then
					reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
					status<=0;
					currentInst<= currentInst+1;
				--	assert false report "Simulation Finished" severity failure;  -- debug stop 
			 
			 end if;
	 
	 
  elsif(reg_curr_instr(31 downto 24)= x"02") then-- MUL
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
					regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
					regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
					--curr_op<=x"ff";  -- the current operation changes only after the process so it remains to FF when we need it to work
					status<=status+1;
					curr_op<=x"02"; 
				elsif(status=1) then
					reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
					status<=0;
					currentInst<= currentInst+1;
				--	assert false report "Simulation Finished" severity failure;  -- debug stop 
			 
			 end if;
	 
	 
  elsif(reg_curr_instr(31 downto 24)= x"03") then-- DIV
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
					regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
					regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
					--curr_op<=x"ff";  -- the current operation changes only after the process so it remains to FF when we need it to work
					status<=status+1;
					curr_op<=x"03"; 
				elsif(status=1) then
					reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
					status<=0;
					currentInst<= currentInst+1;
				--	assert false report "Simulation Finished" severity failure;  -- debug stop 
			 
			 end if;
	 
  elsif(reg_curr_instr(31 downto 24)= x"04") then-- STORE at @adr the value of Rx
			if(status=0)then
				curr_op<="ZZZZZZZZ";
				Bus_address <= reg_curr_instr(23 downto 16);
				Bus_data <= reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- might need to put it 7 downto 0
				Bus_control<="01";
				status<=status+1; -- <=0 
				elsif(status=1) then
					status<=0;
					Bus_control<="ZZ";
				currentInst<= currentInst+1;
					--assert false report "Simulation Finished" severity failure;  -- debug stop
			--	elsif(status=1)then
			--		if(Bus_data=flag)
			 end if;	 
	 
	elsif(reg_curr_instr(31 downto 24)= x"05") then-- LOAD in Rx the value from @adr
			if(status=0)then
				curr_op<="ZZZZZZZZ";
				Bus_address <= reg_curr_instr(23 downto 16);
				Bus_control<="00";
				status<=status+1;
			elsif(status=1)then
				 reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=Bus_data;
				 status<=status+1;
			elsif(status=2)then
				 status<=0;
				Bus_control<="ZZ"; -- add a default value
				 Bus_data<="ZZZZZZZZZZZZZZZZ";
				 currentInst<= currentInst+1;
				 
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
			 end if;	 
	 
	elsif(reg_curr_instr(31 downto 24)= x"06") then-- afc int Rx the value of y
			if(status=0)then
			--	curr_op<="ZZZZZZZZ";
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=reg_curr_instr(15 downto 0);
				status<=0;
				currentInst<= currentInst+1;
			end if;	
		
	 
	 
	elsif(reg_curr_instr(31 downto 24)= x"07") then-- Equality
	--assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
				regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
				regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
				status<=status+1;
				curr_op<=x"07"; 
			elsif(status=1) then
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
				status<=0;
				currentInst<= currentInst+1;
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
		 
			end if;
	 
	 
	 elsif(reg_curr_instr(31 downto 24)= x"08") then-- inf
	 --assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
				regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
				regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
				status<=status+1;
				curr_op<=x"08"; 
			elsif(status=1) then
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
				status<=0;
				currentInst<= currentInst+1;
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
		 
			end if;
	 
	 elsif(reg_curr_instr(31 downto 24)= x"09") then-- Inf superior
	 --assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
				regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
				regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
				status<=status+1;
				curr_op<=x"09"; 
			elsif(status=1) then
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
				status<=0;
				currentInst<= currentInst+1;
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
		 
			end if;
		 
	 elsif(reg_curr_instr(31 downto 24)= x"0a") then-- superior
	 --assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
				regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
				regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
				status<=status+1;
				curr_op<=x"0a"; 
			elsif(status=1) then
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
				status<=0;
				currentInst<= currentInst+1;
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
		 
			end if;
		 
	 
	 elsif(reg_curr_instr(31 downto 24)= x"0b") then-- superior equal
	 --assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then -- we have to put it to status =1 for reasigning the value 
				regSelectorA <=reg(to_integer(unsigned(reg_curr_instr(23 downto 16))));
				regSelectorB <=reg(to_integer(unsigned(reg_curr_instr(15 downto 0)))); -- maybe 7 downto 0
				status<=status+1;
				curr_op<=x"0b"; 
			elsif(status=1) then
				reg(to_integer(unsigned(reg_curr_instr(23 downto 16))))<=result;
				status<=0;
				currentInst<= currentInst+1;
			--	assert false report "Simulation Finished" severity failure;  -- debug stop 
		 
			end if;
			
	elsif(reg_curr_instr(31 downto 24)= x"0c") then-- JMP
	--assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then
			currentInst<=to_integer(unsigned(reg_curr_instr(23 downto 16)))+1; -- we increment it automaticly
			--	status<=0;
			end if ;
	elsif(reg_curr_instr(31 downto 24)= x"0d") then-- JMPC
	--assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then
				if(reg(to_integer(unsigned(reg_curr_instr(15 downto 0))))=x"00") then
					currentInst<=to_integer(unsigned(reg_curr_instr(23 downto 16)))+1; -- we increment it automaticly
				else
					currentInst<= currentInst+1;
				end if;
			end if ;
	 
	
-- ADD constant to size of each register
	
	elsif(reg_curr_instr(31 downto 24)= x"0e") then-- CALL
	--assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then
				--do we need to add +1 all the time
					reg_recursivity(currentRecursivityLevel)<=std_logic_vector(to_unsigned(currentInst,16)); -- +1 ?!?!
					currentRecursivityLevel<=currentRecursivityLevel+1;
					currentInst<=to_integer(unsigned( reg_curr_instr(23 downto 16))) +1;
				
			end if ;
	 
	 	 
	elsif(reg_curr_instr(31 downto 24)= x"0F") then-- RET
	--assert false report "Simulation Finished" severity failure;  -- debug stop 
			if(status=0)then
				
				-- DOES THIS WORK ?
				
					currentRecursivityLevel<=currentRecursivityLevel-1;
					currentInst<=to_integer(unsigned(reg_recursivity(currentRecursivityLevel-1)));
				
			end if ;	 
	 
	 
	 
	 
  end if;
  
 
 end process;
 curr_op<="ZZZZZZZZ";
 reg_curr_instr <= instr_mem(currentInst);
 --Bus_data <= data;

end Behavioral;

