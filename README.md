# ece385_final
ECE 385 Final Project

The basic process for handwritten digit recognition:

1. Load the training weights onto the FPGA board
2. Store these training weights into some kind of a memory block.
3. Load the input data on the FPGA board
4. Report the recognized output to the console. 

TODO:

[ ] File I/O in C to read input weights and input data
[ ] Conversion of input data (ASCII) to binary format for easier handling
[ ] Set up the I/O module to read input weights and input data 
[ ] Set up the I/O module to output data to the console
[ ] Figure out how to use the LCD panel
[ ] Understand the neural network process

-------

Combining the MixColumns, SubBytes and ShiftRows into a single round operation: https://code.google.com/archive/p/byte-oriented-aes/
