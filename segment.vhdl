library ieee;
use ieee.std_logic_1164.all;

entity segment is 
  port(
    D_IN : in std_logic_vector(3 downto 0);
    SZ_OUT : out std_logic_vector(6 downto 0)
    );
end segment; 
    
architecture behavior of segment is
  
begin 
  with D_IN select
    SZ_OUT <= 
			"0000001" when "0000", -- "0" 
			"1001111" when "0001", -- "1" 
			"0010010" when "0010", -- "2" 
			"0000110" when "0011", -- "3" 
			"1001100" when "0100", -- "4" 
			"0100100" when "0101", -- "5" 
			"0100000" when "0110", -- "6" 
			"0001111" when "0111", -- "7"  
			"0000000" when "1000", -- "8"  
			"0000100" when "1001", -- "9" 
			"0000010" when "1010", -- A 
			"1100000" when "1011", -- B 
			"0110001" when "1100", -- C 
			"1000010" when "1101", -- D 
			"0110000" when "1110", -- E 
			"0111000" when "1111", -- F 
            "0000000" when others;  
end behavior;
