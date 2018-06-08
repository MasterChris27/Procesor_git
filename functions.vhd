--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use	IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_textio.all;
use ieee.math_real;
library STD;
use			STD.TextIO.all;



package functions is

constant DATA_BITS: integer  :=32 ;
constant DEPTH : integer := 512;


subtype word_t  is std_logic_vector(DATA_BITS - 1 downto 0);
type    ram_t   is array(0 to DEPTH - 1) of word_t;


-- Read a *.hex file
impure function ocram_ReadMemFile(FileName : STRING) return ram_t is
  file FileHandle       : TEXT open READ_MODE is FileName;
  variable CurrentLine  : LINE;
  variable TempWord     : STD_LOGIC_VECTOR((div_ceil(word_t'length, 4) * 4) - 1 downto 0);
  variable Result       : ram_t    := (others => (others => '0'));

begin
  for i in 0 to DEPTH - 1 loop
    exit when endfile(FileHandle);

    readline(FileHandle, CurrentLine);
    hread(CurrentLine, TempWord);
    Result(i)    := resize(TempWord, word_t'length);
  end loop;

  return Result;
end function;

end functions;

package body functions is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end functions;
