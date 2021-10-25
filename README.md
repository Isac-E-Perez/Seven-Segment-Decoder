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

<img width="340" alt="Screen Shot 2021-10-20 at 9 28 54 PM" src="https://user-images.githubusercontent.com/89553126/138200815-d9c8c528-1a95-4a76-8d29-45f86943a452.png">

**Internal description of the seven segment decoder is specified here**

<img width="344" alt="Screen Shot 2021-10-20 at 9 29 58 PM" src="https://user-images.githubusercontent.com/89553126/138200958-2a5ae9c5-bced-49d5-ad27-5190169bcc9a.png">

The selected signal assignment statement is evaluated each time there is a change in the chooser expression listed in the first line of the selected signal assignment statement. Re-evaluation also occurs every time there is a change in a conditional signal on the right-hand side of the signal assignment operator.

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the operations of the circuit. Stimuli is provided to the circuit, so I can verify the outputs behave as I expect. The VHDL file called 'seven_tb' is where I specified the stimuli to the circuit.

<img width="593" alt="Screen Shot 2021-10-20 at 9 32 17 PM" src="https://user-images.githubusercontent.com/89553126/138201206-c8f4c792-48aa-42cb-90db-ce6bfe76be28.png">

<img width="419" alt="Screen Shot 2021-10-20 at 9 32 32 PM" src="https://user-images.githubusercontent.com/89553126/138201212-9d1e1d6d-db9f-4a83-845e-a3beb810bc24.png">

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, a process was created so that I could deliver signals sequentially and not concurrenlty.

Finally, I verified the units outputted by using a waveform viewer.
 
**D_IN = 0000 → D_IN = 1111 in binary**

![0](https://user-images.githubusercontent.com/89553126/138179532-c3e6f2e4-6f4c-451f-b47f-fa39fce5667c.png)

**D_IN = 0000 → D_IN = 1111 in hex number**

![1](https://user-images.githubusercontent.com/89553126/138179536-9018eec0-4211-4925-9c21-a2869f8cbf2e.png)

Looking back to the relationship between the input and output, waveform and the black box, the code produce what should be expected, therefore, I know my seven segment decoder code is operating correctly.
