// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// total number of pixels: 512w * 256h = 131072 pixels (bits)
// number of 16-bit addresses: 8192
(LOOP)
// store this in M[0]          ^
@8192
D=A
@0
M=D

// load KBD into D
@KBD
D=M

// if no key pressed (KBD is 0), then fill with white
@WHITE
D;JEQ

// else fill with black
(BLACK)
@0
D=M

// go back to input loop if done drawing pixels
@LOOP
D;JEQ

// subtract num pixels left to draw from screen
// screen is: 16384
// screen max is: 16384 + 8192 = 24575
@24576
A=A-D
// -1 = every bit flipped to 1 (black)
M=-1

@0
M=M-1

@BLACK
0;JMP

(WHITE)
@0
D=M

// go back to input loop if done drawing pixels
@LOOP
D;JEQ

// subtract num pixels left to draw from screen
// screen is: 16384
// screen max is: 24576 + 8192 = 24575
@24576
A=A-D
// 0 = white
M=0

@0
M=M-1

@WHITE
0;JMP
