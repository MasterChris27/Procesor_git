----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:00 05/15/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( Show_data : out  STD_LOGIC_VECTOR (15 downto 0);
				Clk: in std_logic);
end PC;

architecture Behavioral of PC is

signal bus_data :std_logic_vector(15 downto 0); 
signal bus_address :std_logic_vector(7 downto 0); 
signal bus_control:std_logic_vector(1 downto 0); 
signal bus_interuptions : std_logic;

--signal bus_data_memory :std_logic_vector(15 downto 0); 
--signal bus_address_memory :std_logic_vector(7 downto 0); 
--signal bus_control_memory :std_logic_vector(1 downto 0); 

signal status : integer range 0 to 10; -- we can have a lvl 10 only status of each instr




component UCP is  -- what is the in part here is it from the point of view of the UCP
    Port ( Bus_address : out  STD_LOGIC_VECTOR (7 downto 0); -- bus reserved for sending adresses 
           Bus_control : out  STD_LOGIC_VECTOR (1 downto 0);           -- bus reserved for selecting Memory Write/Read , IO write/Read
			  Bus_data : inout  STD_LOGIC_VECTOR (15 downto 0);  -- bus reserved for sending and receiving data acording to RC
			  Clk : in std_logic;
			  Interuptions : in std_logic 
			  );
end component;

component memory is
    Port ( Bus_address : in  STD_LOGIC_VECTOR (7 downto 0); -- receiving address of the registry
           Bus_control : in  STD_LOGIC_VECTOR (1 downto 0);           -- receiving type of action
           Bus_data : inout  STD_LOGIC_VECTOR (15 downto 0); -- receiving/sending data
			  Clk : in STD_LOGIC);                              -- clock so we have everything sync-ed
end component;


component IO is
    Port ( 
           Bus_address : in  STD_LOGIC_VECTOR (7 downto 0);
			  Bus_control : in std_logic_vector(1 downto 0);
           Bus_data : in  STD_LOGIC_VECTOR (15 downto 0);
			  Clk : in  STD_LOGIC;
			  Bus_interruptions : out std_logic
			  );
end component;


begin

--CPU:UCP port map(bus_address_cpu(7 downto 0),bus_control_cpu(1 downto 0),bus_data_cpu(15 downto 0),Clk);
--MEM : memory port map (bus_address_memory(7 downto 0),bus_control_memory(1 downto 0),bus_data_memory(15 downto 0),Clk);

CPU : UCP          port map(bus_address,bus_control,bus_data,Clk,bus_interuptions);
MEM : memory       port map(bus_address,bus_control,bus_data,Clk);
Peripherics: IO port map(bus_address,bus_control,bus_data,Clk,bus_interuptions);



process

 begin
 wait for 50ns;
  wait until rising_edge(Clk); 
  
	

end process;


Show_data <= bus_data;



end Behavioral;

