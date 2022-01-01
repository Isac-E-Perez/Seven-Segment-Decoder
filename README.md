# Seven Segment Decoder Project

### About:

For this project, I created a seven segment decoder with the use of VHDL code. The decoder has an output of *SZ_OUT*. A digital decoder is a device which converts one digital format into another. The Binary Coded Decimal (BCD) to 7 Segment Decoder converts 4 bit binary to 7 bit control signal. The circuit contains an input bundle of four signals and an output bundle of seven signals. The BCD to 7 segment decoder converts 4 bit binary to 7 bit control signal which can be displayed on 7 segment display. Seven display consist of 7 LED segments to display 0 to 9 and A to F. The relationship between the input and output is shown in the table below. 

**The relationship between the input and output**

![0](https://user-images.githubusercontent.com/89553126/138180469-c66523bb-f2bf-42b5-bc41-26f11a1b7f11.png)

**Black box**

<img width="377" alt="Screen Shot 2021-10-20 at 8 17 46 PM" src="https://user-images.githubusercontent.com/89553126/138194093-16b0ead9-3802-4bda-9de0-6f672ba2277b.png">
 
### Note:

The code is made for the Basys 3 Artix-7 FPGA Board. I do not have access or own the board so my code is based on the manual specifications found here,

https://digilent.com/reference/_media/basys3:basys3_rm.pdf

### Results: 

In VHDL, *D_IN* is an input (**IN**), and *SZ_OUT* is an output (**OUT**) of my project.

**I/O's are specified here (the circuit is specified using a Hardware Desciption Language)**
 
```VHDL
library ieee;
use ieee.std_logic_1164.all;

entity segment is 
  port(
    D_IN : in std_logic_vector(3 downto 0);
    SZ_OUT : out std_logic_vector(6 downto 0)
    );
end segment; 
```

**Internal description of the seven segment decoder is specified here**

```VHDL
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
```

The selected signal assignment statement is evaluated each time there is a change in the chooser expression listed in the first line of the selected signal assignment statement. Re-evaluation also occurs every time there is a change in a conditional signal on the right-hand side of the signal assignment operator.

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the operations of the circuit. Stimuli is provided to the circuit, so I can verify the outputs behave as I expect. The VHDL file called 'seven_tb' is where I specified the stimuli to the circuit.

 ```VHDL
library ieee;
use ieee.std_logic_1164.all;

entity segment_tb is
end segment_tb;
  
architecture behavior of segment_tb is 
  component segment 
    port(
        D_IN : in std_logic_vector(3 downto 0);
        SZ_OUT : out std_logic_vector(6 downto 0)
        );
  end component;

-- Input
signal D_IN : std_logic_vector(3 downto 0) := (others => '0'); -- default value

-- Output 
signal SZ_OUT : std_logic_vector(6 downto 0);

begin 
  uut: segment port map(D_IN => D_IN, SZ_OUT => SZ_OUT);
  
	stim_proc: process
	begin 
	wait for 100 ns; -- hold reset state for 100 ns
    
	-- Stimuli: 
	D_IN <= "0000"; wait for 20 ns;
	D_IN <= "0001"; wait for 20 ns;
	D_IN <= "0010"; wait for 20 ns;
	D_IN <= "0011"; wait for 20 ns;
	D_IN <= "0100"; wait for 20 ns;
	D_IN <= "0101"; wait for 20 ns;
	D_IN <= "0110"; wait for 20 ns;
	D_IN <= "0111"; wait for 20 ns;
	D_IN <= "1000"; wait for 20 ns;
	D_IN <= "1001"; wait for 20 ns;
	D_IN <= "1010"; wait for 20 ns;
	D_IN <= "1011"; wait for 20 ns;
	D_IN <= "1100"; wait for 20 ns;
	D_IN <= "1101"; wait for 20 ns;
	D_IN <= "1110"; wait for 20 ns; 
	D_IN <= "1111"; wait for 20 ns;
     
	assert false report "Reached end of test";    
	wait;
	end process;
end behavior;
```

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, the process statement is a concurrent statement which is constituted of sequential statements exclusively.

Finally, I verified the units outputted by using a waveform viewer.
 
**D_IN = 0000 → D_IN = 1111 in binary**

![0](https://user-images.githubusercontent.com/89553126/138179532-c3e6f2e4-6f4c-451f-b47f-fa39fce5667c.png)

**D_IN = 0000 → D_IN = 1111 in hex number**

![1](https://user-images.githubusercontent.com/89553126/138179536-9018eec0-4211-4925-9c21-a2869f8cbf2e.png)

Looking back to the relationship between the input and output, waveform and the black box, the code produce what should be expected, therefore, I know my seven segment decoder code is operating correctly.
