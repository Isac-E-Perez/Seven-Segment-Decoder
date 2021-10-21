# Seven Segment Decoder Project

### About:

For this project, I created a seven segment decoder with the use of VHDL code. The decoder has an output of *SZ_OUT*. A digital decoder is a device which converts one digital format into another. The Binary Coded Decimal (BCD) to 7 Segment Decoder converts 4 bit binary to 7 bit control signal. The circuit contains an input bundle of four signals and an output bundle of seven signals. The BCD to 7 segment decoder converts 4 bit binary to 7 bit control signal which can be displayed on 7 segment display. Seven display consist of 7 LED segments to display 0 to 9 and A to F. The relationship between the input and output is shown in the table below. 

**The relationship between the input and output**

![0](https://user-images.githubusercontent.com/89553126/138180469-c66523bb-f2bf-42b5-bc41-26f11a1b7f11.png)

**Black box**

<img width="377" alt="Screen Shot 2021-10-20 at 8 17 46 PM" src="https://user-images.githubusercontent.com/89553126/138194093-16b0ead9-3802-4bda-9de0-6f672ba2277b.png">
 
### Note:

The code is made for the Nexys 4 Artix-7 FPGA Board. I do not have access or own the board so my code is based on the manual specifications found here,

https://digilent.com/reference/_media/basys3:basys3_rm.pdf

### Results: 

**D_IN = 0000 → D_IN = 1111 in binary**

![0](https://user-images.githubusercontent.com/89553126/138179532-c3e6f2e4-6f4c-451f-b47f-fa39fce5667c.png)

**D_IN = 0000 → D_IN = 1111 in hex number**

![1](https://user-images.githubusercontent.com/89553126/138179536-9018eec0-4211-4925-9c21-a2869f8cbf2e.png)
