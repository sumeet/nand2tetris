// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


// initialize product to 0, as per test
@2
M=0

(LOOP)
// store R1 into register D, the number of times to add
@1
D=M

// if number of times to add is zero, then we're done, jump to the end
@END
D;JEQ

// add the value being multipled into R2
@0
D=M
@2
M=M+D

// decrement the number of times to add by 1
@1
M=M-1

@LOOP
0;JMP


(END)
(INFINITE_LOOP)
@INFINITE_LOOP // Infinite loop (our standard
0;JMP // way to terminate programs).
